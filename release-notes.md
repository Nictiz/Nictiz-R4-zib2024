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

## LanguageProficiency (zib-Patient, nl-core-Patient)
* `.communication.extension:languageControl.extension:level.value[x]` ; terminology ; Changed codes in LanguageControlListeningCodelist, LanguageControlSpeakingCodelist and LanguageControlReadingCodelist. ; ZIB-1877
* `.communication.extension:comment` ; extension ; Replaced the extension `ext-Comment` with the extension `ext-LanguageProficiency.Comment`. ; ZIBFHIR-97

## MaritalStatus (zib-Patient, nl-core-Patient)
* `.maritalStatus` ; terminology ; Changed codes in MaritalStatusCodelist. ; ZIB-2218

## NameInformation
### zib-NameInformation
* No significant changes.

### nl-core-NameInformation
* All changes from the zib profile.
* `HumanName` ; constraint ; Renamed nl-core-NameInformation-01 to nl-core-NameInformation-1. ; ZIBFHIR-141
* `.family` ; constraint ; Renamed nl-core-NameInformation-02 to nl-core-NameInformation-2. ; ZIBFHIR-141

### zib-NameInformation.GivenName, nl-core-NameInformation.GivenName
* No significant changes.

## Nationality (zib-Patient, nl-core-Patient)
* No significant changes.

## Patient (zib-Patient, nl-core-Patient)
* `.extension:genderIdentity.value[x]` ; extension ; Added extension `patient-genderIdentity` for GenderIdentity. ; ZIB-1693
* `.gender` ; terminology ; Changed code description in GeslachtCodelijst. ; ZIB-1239
* `.multipleBirth[x]:multipleBirthInteger` ; mapping ; Added mapping of MultipleBirthSequence. ; ZIB-1670
