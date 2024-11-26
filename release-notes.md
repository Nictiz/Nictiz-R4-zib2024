## AnatomicalLocation 
### zib-AnatomicalLocation, nl-core-AnatomicalLocation
* `CodeableConcept` ; textual ; Refined guidance for Location and Laterality ; ZIBFHIR-113
* `.extension:bodyStructureReference` ; extension ; Replaced ExtAnatomicalLocationLaterality with BodyStructureReference for Laterality ; ZIBFHIR-113
* `.extension:bodyStructureReference` ; mapping ; Moved mapping of Laterality to `BodyStructure.locationQualifier` ; ZIBFHIR-113
* `.coding:location` ; mapping ; Moved mapping of Location to a slice on Conding ; ZIBFHIR-113

### zib-AnatomicalLocation-BodyStructure, nl-core-AnatomicalLocation-BodyStructure
* New profile that maps Laterality to a native FHIR element inside the BodyStructure resource instead of a custom extension. ; ZIBFHIR-113