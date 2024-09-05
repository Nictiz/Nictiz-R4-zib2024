# Nictiz-R4-Zib2020/util

This folder contains some utilities for zib2024 profiling.

## QA

This folders contains the pieces to run the automated QA tools. These tools are used in the configured Github actions (configured in `.github/actions/*.yml` from the root of this repo). To use them manually:
* Make sure Docker or Podman is running (when using Podman, enable Docker compatibility mode and install the Podman Compose extension).
* Start the batch scripts "qa.bat"
* Point your webbrowser at http://localhost:9000. This will give you a menu of the checks that you can perform.

## addDataFromZib

Based on the definitions from ART-DECOR, metadata (`url`, `name`, `title`, `status`, `publisher`, `contact`, `purpose`, `copyright`, `abstract`, `text`) following the profiling guidelines is added if not present or edited when containing Forge's default values for both zib and nl-core profiles. An `id` (in both zib and nl-core profiles) and a `mapping` to a zib (only in zib profiles) following the guidelines should be present for this to work. If a non-default value is already present, the XSLT does not modify it, allowing for overruling the default value when profiling.

Notable exception to this is `definition` - this will not be added automatically and should still be added by hand.

All unused `mapping` elements that are added by default by Forge are removed.

When only a `mapping.map` is defined on an `element`, addDataFromZib.xsl adds `element.short`, `.definition`, `.alias` and `.mapping.comment` from the zib2024bbr-decor.xml file based on the zib Concept ID. If one of these elements is already defined, the XSLT displays a message identifying the conflict, but does not touch the defined value, allowing for overruling the default value when profiling.

Exception: no `.definition` is added to the root concept of a zib following 10.2.1.2 of the Profiling Guidelines.

The XSLT allows for multiple mappings on one element (combining `.short` and `.definition`, adding multiple `.alias`, adding the right `.mapping.comment`), but testing has been limited.

### Update ART-DECOR definitions

The ART-DECOR definitions file (zib2024bbr-decor.xml) can be retrieved from the following URL: <https://acceptance.art-decor.org/decor/services/RetrieveProject?prefix=zib2024bbr-&mode=verbatim&download=true&format=xml>

## downloadTerminology

This folder contains an xslt scripts that loops through all resources in the `resources` folder, finds relevant canonicals for ValueSets and systems for CodeSystems, and downloads these terminology resources from ART-DECOR to `resources/zib/terminology` and `resources/nl-core/terminology` respectively.

These scripts are standalone XSL files that operate without an XML source. They can be executed by selecting the XSL file as the XML source within Oxygen, or by calling the XSL using Saxon using the `-xsl:downloadTerminology.xsl -it:main` command line flags.

## updateNarratives

Tooling to add or re-generate the narratives for all resources in the "nl-core/examples" folder, using the [Nictiz Narrative Generator](https://github.com/Nictiz/HL7-mappings/tree/master/fhir-narrativegenerator). This tool requires ANT to be installed. To use: run "updateNarratives.bat".