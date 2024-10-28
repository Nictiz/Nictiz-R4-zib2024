## AddressInformation (zib-AddressInformation)
* `.line.extension:houseNumberIndication.value[x]` ; constraint ; Adjusted zib-AddressInformation-1 for HouseNumberIndication ; ZIB-2218

## ContactInformation 
### zib-ContactInformation-TelephoneNumbers, nl-core-ContactInformation-TelephoneNumbers
* `ContactPoint` ; textual ; Added guidance for NumberType ; ZIB-1652
* `.extension:comment` ; extension ; Replaced extension ExtComment with ContactPointComment on zib-ContactInformation-TelephoneNumbers ; ZIBFHIR-97
* `.extension:purpose` ; extension ; Added ContactPointPurpose for NumberType ; ZIBFHIR-129
* `.use` ; terminology ; Added guidance for mapping of _EC_ in ConceptMap NummerSoortCodelijst-to-ContactInformation-TelephoneNumbersUse ; ZIB-1652 
### zib-ContactInformation-EmailAddresses, nl-core-ContactInformation-EmailAddresses
* No significant changes

## ContactPerson (zib-ContactPerson, nl-core-ContactPerson)
* `.extension:comment` ; extension ; Added Note for Comment ; ZIB-947, ZIB-1375, ZIBFHIR-97
* `.relationship:role` ; textual ; Added guidance for Role mapping ; ZIBFHIR-73
* `.relationship:role` ; terminology ; Changed codes in RoleCodelist ; ZIB-1470, ZIB-1481, ZIB-1496, ZIB-1556, ZIB-1616 ZIB-1789, ZIB-2211
* `.relationship:relationship` ; terminology ; Changed codes in RelatieSnomedCodelijst ; ZIB-1495, ZIB-1496, ZIB-1556, ZIB-1616, ZIB-1770, ZIB-1789, ZIB-1941, ZIB-2008 

## NameInformation
### zib-NameInformation, nl-core-NameInformation
* No significant changes

### zib-NameInformation.GivenName, nl-core-NameInformation.GivenName
* No significant changes
