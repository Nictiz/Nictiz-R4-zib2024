## AddressInformation (zib-AddressInformation, nl-core-AddressInformation)
* `.extension:addressType.value[x]` ; terminology ; Changed codes in AdresSoortCodelijst. ; ZIB-2218
* `.line.extension:houseNumberLetter-houseNumberAddition.value[x]` ; textual ; Moved guidance for HouseNumberLetter and HouseNumberAddition from `.definition` to `.comment`, added zib concept definitions to `.definition`. ; ZIBFHIR-142
* `.line.extension:houseNumberIndication.value[x]` ; textual ; Added guidance for HouseNumberIndication. ; ZIB-2218
* `.line.extension:houseNumberIndication.value[x]` ; constraint ; Removed houseNumberIndication for HouseNumberIndication. ; ZIB-2218
* `.country.extension:countryCode.value[x]` ; terminology ; Changed codes in LandCodelijsten (LandGBACodelijst en LandISOCodelijst). ; ZIB-2218

## ContactInformation 
### zib-ContactInformation-TelephoneNumbers, nl-core-ContactInformation-TelephoneNumbers
* `ContactPoint` ; textual ; Added guidance for NumberType. ; ZIB-1652
* `.extension:comment` ; extension ; Replaced extension ExtComment with ContactPointComment. ; ZIBFHIR-97
* `.extension:purpose` ; extension ; Added ContactPointPurpose for NumberType. ; ZIB-1652, ZIBFHIR-129
* `.use` ; terminology ; Added mappings in NummerSoortCodelijst_to_ContactInformation_TelephoneNumbersUse. ; ZIB-1652
* `.use` ; textual ; Added guidance for NumberType. ; ZIB-1652

### zib-ContactInformation-EmailAddresses, nl-core-ContactInformation-EmailAddresses
* No significant changes.

## ContactPerson
### zib-ContactPerson, nl-core-ContactPerson
* `.extension:comment` ; extension ; Added Note for Comment. ; ZIB-947, ZIB-1375, ZIBFHIR-97
* `.relationship:role` ; textual ; Added guidance for Role. ; ZIBFHIR-73
* `.relationship:role` ; terminology ; Changed value set from RolCodelijst to RolSnomedCodelijst. ; ZIB-1180, ZIB-1470, ZIB-1481, ZIB-1496, ZIB-1556, ZIB-1616, ZIB-1789, ZIB-2008, ZIB-2211
* `.relationship:relationship` ; textual ; Changed definition of Relationship. ; ZIB-1556
* `.relationship:relationship` ; terminology ; Changed value set from RelatieCodelijst to RelatieSnomedCodelijst. ; ZIB-1180, ZIB-1438, ZIB-1495, ZIB-1486, ZIB-1556, ZIB-1616, ZIB-1770, ZIB-1789, ZIB-1941, ZIB-2008

## HealthcareProvider
### zib-HealthcareProvider-Organization, nl-core-HealthcareProvider-Organization
* `.type:organizationType` ; terminology ; Changed codes in OrganisatieTypeCodelijst. ; ZIB-1559, ZIB-1927
* `.type:departmentSpecialty` ; terminology ; Changed codes in AfdelingSpecialismeCodelijst. ; ZIB-2218
* `.type:departmentSpecialty` ; textual ; Changed definition of DepartmentSpecialty. ; ZIB-1665

### zib-HealthcareProvider, nl-core-HealthcareProvider
* No significant changes.

## HealthProfessional (zib-HealthProfessional, nl-core-HealthProfessional)
* No significant changes.

## NameInformation
### zib-NameInformation
* No significant changes.

### nl-core-NameInformation
* All changes from the zib profile.
* `HumanName` ; constraint ; Renamed nl-core-NameInformation-01 to nl-core-NameInformation-1. ; ZIBFHIR-141
* `.family` ; constraint ; Renamed nl-core-NameInformation-02 to nl-core-NameInformation-2. ; ZIBFHIR-141

### zib-NameInformation.GivenName, nl-core-NameInformation.GivenName
* No significant changes.
