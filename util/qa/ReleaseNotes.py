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
        
    def __init__(self, name):
        self.name = name
        self.changes = []
        self.open_change = None

    def addRemark(self, remark):
        self.changes.append(remark)

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
    def __init__(self, name, is_multiprofile, *profile_names):
        if not re.match("^[A-Z][A-Za-z]+$", name, re.MULTILINE):
            raise ParserException(f"Invalid zib name: {name}")
        self.name = name
        self.is_multiprofile = is_multiprofile
        self.profiles = [Profile(name) for name in profile_names]

    def addProfile(self, profile_name):
        if not (self.is_multiprofile or len(self.profile_names) == 0):
            raise ParserException("Trying to add a profile to a zib where just one profile should exist")
        self.profiles.append(Profile(profile_name))
    
    def getCurrProfile(self):
        if len(self.profiles):
            return self.profiles[-1]
        return None
    
    def asHTML(self):
        str = f"<h2>{self.name}"
        if not self.is_multiprofile:
            str += f" (profile {self.profiles[-1].name})"
        str += "</h2>\n"
        str += "<table>\n"
        
        num_cols = 1
        for profile in self.profiles:
            for change in profile.changes:
                if isinstance(change, Profile.Change):
                    num_cols = 4
                    str += "<thead><tr><td>path(s)</td><td>category</td><td>remark</td><td>BITS ticket(s)</td></tr></thead>\n"
                    break
        
        for profile in self.profiles:
            if self.is_multiprofile:
                str += f"<td colspan='4'>profile {profile.name}</td>\n"
            for change in profile.changes:
                str += "<tr>"
                if isinstance(change, Profile.Change):
                    str += "<td>" + "<br />".join([f"<code>{path}</code>" for path in change.paths]) + "</td>"
                    str += "<td>" + change.category + "</td>"
                    str += "<td>" + re.sub("`(.*?)`", "<code>\\1</code>", change.description) + "</td>"
                    str += "<td>" + ", ".join([f"<a href='https://bits.nictiz.nl/issues/{issue}'>{issue}</a>" for issue in change.issues]) + "</td>"
                elif type(change) == str:
                    str += f"<tr><td colspan='4'>{change}</td></tr>"
                str += "</tr>\n"

        str += "</table>\n"

        return str

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
            case ["##", zib_name, profile_name]:
                if match := re.match(r"^\(([A-Za-z\.-]+)\)$", profile_name):
                    self.zibs.append(Zib(zib_name, False, match.group(1)))
                else:
                    self._error(f"incorrectly formatted profile name: {profile_name}")
            case ["###", profile_name]:
                self._getCurrentZib().addProfile(profile_name)
            case ["*", path, ";"]:
                self._getCurrProfile().addPartialChange(path)
            case ["*", path, ";", category, ";", *rest]:
                description, issues = self._splitTextAndIssues(rest)
                if len(issues) == 0:
                    self._error("no JIRA issue keys are provided")
                self._getCurrProfile().addChange(path, category, description, issues)
            case ["*", *general_remark]:
                self._getCurrProfile().addRemark(" ".join(general_remark))
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

    def _getCurrProfile(self):
        curr_profile = self._getCurrentZib().getCurrProfile()
        if not curr_profile:
            self._error("no profile name has been declared for this change")
        return curr_profile

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
