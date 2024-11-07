## LanguageProficiency (zib-Patient, nl-core-Patient)
* `.communication.extension:languageControl.extension:level.value[x]` ; terminology ; Changed codes in LanguageControlListeningCodelist, LanguageControlSpeakingCodelist and LanguageControlReadingCodelist. ; ZIB-1877
* `.communication.extension:comment` ; extension ; Replaced the extension `ext-Comment` with the extension `ext-LanguageProficiency.Comment`. ; ZIBFHIR-97

## MaritalStatus (zib-Patient, nl-core-Patient)
* `.maritalStatus` ; terminology ; Changed codes in MaritalStatusCodelist. ; ZIB-2218

## Nationality (zib-Patient, nl-core-Patient)
* No significant changes.

## Patient (zib-Patient, nl-core-Patient)
* `.extension:genderIdentity.value[x]` ; extension ; Added extension `patient-genderIdentity` for GenderIdentity. ; ZIB-1693
* `.gender` ; terminology ; Changed code description in GeslachtCodelijst. ; ZIB-1239
* `.multipleBirth[x]:multipleBirthInteger` ; mapping ; Added mapping of MultipleBirthSequence. ; ZIB-1670