# Nictiz-R4-Zib2024 Release Notes

## AnatomicalLocation 
### zib-AnatomicalLocation
* `CodeableConcept` ; textual ; Refined guidance for Location and Laterality ; ZIBFHIR-113
* `.extension:bodyStructureReference` ; extension ; Replaced ExtAnatomicalLocationLaterality with BodyStructureReference for Laterality ; ZIBFHIR-113
* `.extension:bodyStructureReference` ; mapping ; Moved mapping of Laterality to `BodyStructure.locationQualifier`; ZIBFHIR-113

### zib-AnatomicalLocation-BodyStructure
* New profile that maps Laterality to a native FHIR element inside the BodyStructure resource instead of a custom extension ; ZIBFHIR-113

## AddressInformation (zib-AddressInformation)
* `.line.extension:houseNumberIndication.value[x]` ; constraint ; Adjusted zib-AddressInformation-1 for HouseNumberIndication ; ZIB-2218

## zib-ContactInformation
* `.extension:comment` ; extension ; Replaced the extension `ext-comment` with the extension `contactpoint-comment` on zib-ContactInformation-TelephoneNumbers. ; ZIBFHIR-97
* `.extension:purpose` ; extension ; Added `contactpoint-purpose` on zib-ContactInformation-TelephoneNumbers to capture the zib terminology of NumberTypeCodelist, since the zib and FHIR ValueSet on `.use` do not completely map. 
* `.extension:purpose` ; textual ; Added guidance for mapping of _EC_ in ConceptMap NummerSoortCodelijst-to-ContactInformation-TelephoneNumbersUse. ; ZIB-1652 
* `ContactPoint` ; textual ; Added mapping guidance for NumberType on the root comment of zib-ContactInformation-TelephoneNumbers.

## HealthcareProvider
### zib-HealthcareProvider-Organization
* `.type:organizationType` ; terminology ; Changed codes in OrganizationTypeCodelist; ZIB-1559, ZIB-1927
* `.type:departmentSpecialty` ; terminology ; Changed codes in DepartmentSpecialtyCodelist; ZIB-1665

## LaboratoryTestResult
### zib-LaboratoryTestResult
* `Observation` ; textual ; Removed guidance for InterpretationMethod ; ZIB-1292
* `Observation` ; textual ; Removed guidance for Requester ; ZIB-1269
* `.method` ; terminology ; Binding strength changed from Required to Extensible and changed codes in TestMethodCodelist ; ZIB-1958
* `.value[x]` ; terminology ; Added valueset TestResultCodelist ; ZIB-1442, ZIB-1293 , ZIB-1274
* `.interpretation:resultFlags` ; cardinality ; Changed max cardinality from * to 1 ; ZIB-1072

### zib-LaboratoryTestResult.Specimen
* `.collection.collected[x]:collectedDateTime` ; mapping ; Removed mapping of CollectionDateTime ; ZIB-2239
* `.collection.collected[x]:collectedPeriod` ; mapping ; Removed mapping of CollectionPeriod ; ZIB-2239
* `.collection.duration` ; mapping ; Removed mapping of CollectionPeriod ; ZIB-2239
* `.collection.quantity` ; mapping ; Removed mapping of CollectedVolume ; ZIB-2239
* `.collection.method` ; mapping ; Removed mapping of CollectionMethod ; ZIB-2239
* `.collection.bodySite.extension:laterality` ; extension ; Removed ExtAnatomicalLocationLaterality ; ZIBFHIR-113
* `.collection.bodySite.extension:morphology` ; extension ; Replaced ExtLaboratoryTestResultSpecimenMorphology with  BodyStructureReference for Morphology ; ZIBFHIR-113
* `.collection.bodySite.extension:morphology` ; mapping ; Moved mapping of Morphology to `BodyStructure.morphology` ; ZIBFHIR-113
* `.receivedTime` ; mapping ; Removed mapping of ReceivedDateTime ; ZIB-2239

### zib-LaboratoryTestResult.Specimen-BodyStructure
* New profile that maps morphology to a native FHIR element inside the BodyStructure resource instead of a custom extension ; ZIBFHIR-113
