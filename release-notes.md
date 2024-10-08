## AnatomicalLocation 
### zib-AnatomicalLocation
* `CodeableConcept` ; textual ; Refined guidance for Location and Laterality ; ZIBFHIR-113
* `.extension:bodyStructureReference` ; extension ; Replaced ExtAnatomicalLocationLaterality with BodyStructureReference for Laterality ; ZIBFHIR-113
* `.extension:bodyStructureReference` ; mapping ; Moved mapping of Laterality to `BodyStructure.locationQualifier`; ZIBFHIR-113

### zib-AnatomicalLocation-BodyStructure
* New profile that maps Laterality to a native FHIR element inside the BodyStructure resource instead of a custom extension (ZIBFHIR-113).