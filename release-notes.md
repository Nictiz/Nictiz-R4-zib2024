## AddressInformation (zib-AddressInformation, nl-core-AddressInformation)
* `.extension:addressType.value[x]` ; terminology ; Changed codes in AdresSoortCodelijst. ; ZIB-2218
* `.line.extension:houseNumberLetter-houseNumberAddition.value[x]` ; textual ; Moved guidance for HouseNumberLetter and HouseNumberAddition from `.definition` to `.comment`, added zib concept definitions to `.definition`. ; ZIBFHIR-142
* `.line.extension:houseNumberIndication.value[x]` ; textual ; Added guidance for HouseNumberIndication. ; ZIB-2218
* `.line.extension:houseNumberIndication.value[x]` ; constraint ; Removed houseNumberIndication for HouseNumberIndication. ; ZIB-2218
* `.country.extension:countryCode.value[x]` ; terminology ; Changed codes in LandCodelijsten (LandGBACodelijst en LandISOCodelijst). ; ZIB-2218

## AnatomicalLocation 
### zib-AnatomicalLocation, nl-core-AnatomicalLocation
* `CodeableConcept` ; textual ; Refined guidance for Location and Laterality ; ZIBFHIR-113
* `.extension:bodyStructureReference` ; extension ; Replaced ExtAnatomicalLocationLaterality with BodyStructureReference for Laterality ; ZIBFHIR-113
* `.extension:bodyStructureReference` ; mapping ; Moved mapping of Laterality to `BodyStructure.locationQualifier` ; ZIBFHIR-113

### zib-AnatomicalLocation-BodyStructure, nl-core-AnatomicalLocation-BodyStructure
* New profile that maps Laterality to a native FHIR element inside the BodyStructure resource instead of a custom extension. ; ZIBFHIR-113

## ContactInformation 
### zib-ContactInformation-TelephoneNumbers, nl-core-ContactInformation-TelephoneNumbers
* `ContactPoint` ; textual ; Added guidance for NumberType. ; ZIB-1652
* `.extension:comment` ; extension ; Replaced extension ExtComment with ContactPointComment. ; ZIBFHIR-97
* `.extension:purpose` ; extension ; Added ContactPointPurpose for NumberType. ; ZIB-1652, ZIBFHIR-129
* `.use` ; terminology ; Added mappings in NummerSoortCodelijst_to_ContactInformation_TelephoneNumbersUse. ; ZIB-1652
* `.use` ; textual ; Added guidance for NumberType. ; ZIB-1652

### zib-ContactInformation-EmailAddresses, nl-core-ContactInformation-EmailAddresses
* No significant changes.

## HealthcareProvider
### zib-HealthcareProvider-Organization, nl-core-HealthcareProvider-Organization
* `.type:organizationType` ; terminology ; Changed codes in OrganisatieTypeCodelijst. ; ZIB-1559, ZIB-1927
* `.type:departmentSpecialty` ; terminology ; Changed codes in AfdelingSpecialismeCodelijst. ; ZIB-2218
* `.type:departmentSpecialty` ; textual ; Changed definition of DepartmentSpecialty. ; ZIB-1665

### zib-HealthcareProvider, nl-core-HealthcareProvider
* No significant changes.

## LaboratoryTestResult
### zib-LaboratoryTestResult 
* `Observation` ; textual ; Removed guidance for InterpretationMethod. ; ZIB-1292
* `Observation` ; textual ; Removed guidance for Requester. ; ZIB-1269
* `.method` ; terminology ; Binding strength changed from Required to Extensible and changed codes in TestMethodCodelist. ; ZIB-1958
* `.value[x]` ; terminology ; Removed TestResultCodelist. ; ZIB-2568
* `.value[x]:valueString` ; slicing ; Added Testresult to a slice. ; ZIB-2568
* `.value[x]:valueQuantity` ; slicing ; Added Testresult to a slice. ; ZIB-2568
* `.value[x]:valueCodeableConcept` ; slicing ; Added Testresult to a slice. ; ZIB-2568
* `.value[x]:valueCodeableConcept` ; terminology ; Added TestResultCodelist with Extensible binding. ; ZIB-2568
* `.interpretation:resultFlags` ; cardinality ; Changed max cardinality from * to 1. ; ZIB-1072

### nl-core-LaboratoryTestResult
* `.identfier` ; mapping ; Removed mapping of LaboratoriumUitslagIdentificatie and TestIdentificatie. ; ZIBFHIR-152
* `.extension:edifactReferenceNumber` ; extension ; Removed ext-EdifactReferenceNumber. ; ZIBFHIR-152
* `.extension:copyIndicator` ; extension ; Removed ext-copyIndicator. ; ZIBFHIR-152

### zib-LaboratoryTestResult.Specimen, nl-core-LaboratoryTestResult.Specimen
* `.collection.collected[x]:collectedDateTime` ; mapping ; Removed mapping of CollectionDateTime. ; ZIB-2239
* `.collection.collected[x]:collectedPeriod` ; mapping ; Removed mapping of CollectionPeriod. ; ZIB-2239
* `.collection.duration` ; mapping ; Removed mapping of CollectionPeriod. ; ZIB-2239
* `.collection.quantity` ; mapping ; Removed mapping of CollectedVolume. ; ZIB-2239
* `.collection.method` ; mapping ; Removed mapping of CollectionMethod. ; ZIB-2239
* `.collection.bodySite.extension:laterality` ; extension ; Removed ExtAnatomicalLocationLaterality. ; ZIBFHIR-113
* `.collection.bodySite.extension:morphology` ; extension ; Replaced ExtLaboratoryTestResultSpecimenMorphology with BodyStructureReference for Morphology. ; ZIBFHIR-113
* `.collection.bodySite.extension:morphology` ; mapping ; Moved mapping of Morphology to `BodyStructure.morphology`. ; ZIBFHIR-113
* `.receivedTime` ; mapping ; Removed mapping of ReceivedDateTime. ; ZIB-2239

### zib-LaboratoryTestResult.Specimen-BodyStructure, nl-core-LaboratoryTestResult.Specimen-BodyStructure
* New profile that maps morphology to a native FHIR element inside the BodyStructure resource instead of a custom extension. ; ZIBFHIR-113

## NameInformation
### zib-NameInformation
* No significant changes.

### nl-core-NameInformation
* All changes from the zib profile.
* `HumanName` ; constraint ; Renamed nl-core-NameInformation-01 to nl-core-NameInformation-1. ; ZIBFHIR-141
* `.family` ; constraint ; Renamed nl-core-NameInformation-02 to nl-core-NameInformation-2. ; ZIBFHIR-141

### zib-NameInformation.GivenName, nl-core-NameInformation.GivenName
* No significant changes.





