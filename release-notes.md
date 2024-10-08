## AnatomicalLocation 
### zib-AnatomicalLocation
* `CodeableConcept` ; textual ; Refined guidance for Location and Laterality ; ZIBFHIR-113
* `.extension:bodyStructureReference` ; extension ; Replaced ExtAnatomicalLocationLaterality with BodyStructureReference for Laterality ; ZIBFHIR-113
* `.extension:bodyStructureReference` ; mapping ; Moved mapping of Laterality to `BodyStructure.locationQualifier`; ZIBFHIR-113

### zib-AnatomicalLocation-BodyStructure
* New profile that maps Laterality to a native FHIR element inside the BodyStructure resource instead of a custom extension (ZIBFHIR-113).
# Nictiz-R4-Zib2024 Release Notes

## HealthcareProvider
### zib-HealthcareProvider-Organization
* `.type:organizationType` ; terminology ; Changed codes in OrganizationTypeCodelist; ZIB-1559, ZIB-1927
* `.type:departmentSpecialty` ; terminology ; Changed codes in DepartmentSpecialtyCodelist; ZIB-1665
## AddressInformation (zib-AddressInformation)
* `.line.extension:houseNumberIndication.value[x]` ; constraint ; Adjusted zib-AddressInformation-1 for HouseNumberIndication ; ZIB-2218
## zib-ContactInformation
* `.extension:comment` ; extension ; Replaced the extension `ext-comment` with the extension `contactpoint-comment` on zib-ContactInformation-TelephoneNumbers. ; ZIBFHIR-97
* `.extension:purpose` ; extension ; Added `contactpoint-purpose` on zib-ContactInformation-TelephoneNumbers to capture the zib terminology of NumberTypeCodelist, since the zib and FHIR ValueSet on `.use` do not completely map. 
* `.extension:purpose` ; textual ; Added guidance for mapping of _EC_ in ConceptMap NummerSoortCodelijst-to-ContactInformation-TelephoneNumbersUse. ; ZIB-1652 
* `ContactPoint` ; textual ; Added mapping guidance for NumberType on the root comment of zib-ContactInformation-TelephoneNumbers.


