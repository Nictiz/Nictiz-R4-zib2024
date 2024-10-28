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
