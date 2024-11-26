#!/usr/bin/env python3

""" Helper script to check if the release notes are formatted according to the convention. """

import re
import sys

class ParserException(Exception):
    pass
    
class Profile:
    class Change:
        def __init__(self, path, category = None, description = None, *issues):
            self.paths = []
            self.addPath(path)
            self.setCategory(category)
            self.description = description
            self.issues = issues
        
        def addPath(self, path):
            if match := re.match("^`(.*)`$", path, re.MULTILINE):
                self.paths.append(match.group(1))
            else:
                raise ParserException(f"Incorrectly formatted path: {path}")
        
        def setCategory(self, category):
            if category == None:
                return
            if category not in ["mapping", "textual", "terminology", "cardinality", "extension", "type", "reference", "slicing", "constraint"]:
                raise ParserException(f"Invalid category '{category}'")
            self.category = category
    
    class Remark:
        def __init__(self, description, issues):
            self.description = description
            self.issues = issues

    def __init__(self, name):
        self.name = name
        self.changes = []
        self.open_change = None

    def addRemark(self, description, *issues):
        self.changes.append(Profile.Remark(description, issues))

    def addPartialChange(self, path):
        if self.open_change:
            self.open_change.addPath(path)
        else:
            self.open_change = Profile.Change(path)

    def addChange(self, path, category, description, *issues):
        if self.open_change:
            self.open_change.addPath(path)
            self.open_change.setCategory(category)
            self.open_change.description = description
            self.open_change.issues = issues
            self.changes.append(self.open_change)
            self.open_change = None
        else:
            self.changes.append(Profile.Change(path, category, description, *issues))

class Zib:
    """
    A profiled zib, with one or more profile(s). A zib that is mapped onto more
    than one profile is considered "multi_profile", for example when a zib has
    been mapped onto an Observation panel.
    Note that the "multi_profile" designation doesn't apply to the zib- and
    nl-core layers; if these are subject to the same changes, then they are
    grouped together as a profile group.
    """
    
    def __init__(self, name, is_multiprofile, profile_names = None):
        if not re.match("^[A-Z][A-Za-z]+$", name, re.MULTILINE):
            raise ParserException(f"Invalid zib name: {name}")
        self.name = name
        self.is_multiprofile = is_multiprofile
        self.profile_groups = []
        if profile_names:
            self.profile_groups.append(self._parseProfileString(profile_names))

    def addProfiles(self, profile_names):
        if not (self.is_multiprofile or len(self.profile_names) == 0):
            raise ParserException("Trying to add a profile (group) to a zib where just one profile should exist")
        self.profile_groups.append(self._parseProfileString(profile_names))

    def _parseProfileString(self, profile_names):
        return [Profile(name.strip()) for name in profile_names.split(",")]

    def getCurrProfileGroup(self):
        if len(self.profile_groups):
            return self.profile_groups[-1]
        return None
    
class Parser:
    def parse(self, path):
        f = open(path)

        self.zibs = []
        self.line_no = 0
        self.is_valid = True

        for line in f.readlines():
            self.line_no += 1
            try:
                self._analyze(line)
            except ParserException as e:
                raise ParserException(f"ERROR (line {self.line_no}): {e}")

        return self.zibs

    def _analyze(self, line):
        line = line.rstrip()
        normalized = re.sub(r"\s+", " ", line)
        normalized_len = len(normalized)
        if len(line) != normalized_len:
            self._warning("use single spaces for separations")
        normalized = re.sub(r"\s*;\s*", " ; ", normalized).rstrip()
        if len(normalized) != normalized_len:
            self._error("all ';' marks should be surrounded with spaces")
        match normalized.split():
            case ["##", zib_name]:
                self.zibs.append(Zib(zib_name, True))
            case ["##", zib_name, *profile_list]:
                profile_list = "".join(profile_list)
                if profile_list[0] != "(" or profile_list[-1] != ")":
                    self._error("profile names should be enclosed in parentheses")
                self.zibs.append(Zib(zib_name, False, profile_list[1:-1]))
            case ["###", *profile_names]:
                profile_names = "".join(profile_names)
                self._getCurrentZib().addProfiles(profile_names)
            case ["*", path, ";"]:
                for profile in self._getCurrProfileGroup():
                    profile.addPartialChange(path)
            case ["*", path, ";", category, ";", *rest]:
                description, issues = self._splitTextAndIssues(rest)
                if len(issues) == 0:
                    self._error("no JIRA issue keys are provided")
                for profile in self._getCurrProfiles():
                    profile.addChange(path, category, description, issues)
            case ["*", *general_remark]:
                description, issues = self._splitTextAndIssues(general_remark)
                for profile in self._getCurrProfiles():
                    profile.addRemark(description, *issues)
            case []:
                pass
            case _:
                self._error(f"incorrectly formatted line")

    def _splitTextAndIssues(self, rest):
        """ Split the remainder of a line, containing a description and optionally issue keys.
            Returns the description and a list of issue keys. If no issues are provided, an empty list is returned.
        """
        try:
            index = rest.index(";")
            description_parts = rest[:index]
            issues = []
            for issue in rest[index + 1:]:
                issue = issue.replace(",", "")
                if not re.match("[A-Z]+-[0-9]+", issue):
                    self._error(f"Incorrectly formatted issue key '{issue}'")
                issues.append(issue)
        except ValueError:
            description_parts = rest
            issues = []

        description = " ".join(description_parts)
        return description, issues

    def _getCurrentZib(self):
        if not len(self.zibs):
            self._error("no zib has been declared yet")
        return self.zibs[-1]

    def _getCurrProfiles(self):
        curr_profiles = self._getCurrentZib().getCurrProfileGroup()
        if not curr_profiles:
            self._error("no profile names have been declared for this change")
        return curr_profiles

    def _warning(self, message):
        self.is_valid = False
        print(f"WARNING (line {self.line_no}): {message}")

    def _error(self, message):
        raise ParserException(message)

if __name__ == "__main__":
    parser = Parser()
    try:
        zibs = parser.parse(sys.argv[1])
    except ParserException as e:
        print(e)
        sys.exit(1)

    if not parser.is_valid:
        print("Problems were found in the release notes file")
        sys.exit(1)
