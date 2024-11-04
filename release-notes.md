## LanguageProficiency (zib-Patient, nl-core-Patient)
* `.communication.extension:patient-proficiency:languageControlListening` ; terminology ; Changed codes in LanguageControlListeningCodelist ; ZIB-1877
* `.communication.extension:patient-proficiency:languageControlSpeaking` ; terminology ; Changed codes in LanguageControlSpeakingCodelist ; ZIB-1877
* `.communication.extension:patient-proficiency:languageControlReading` ; terminology ; Changed codes in LanguageControlReadingCodelist; ZIB-1877
* `.communication.extension:comment` ; extension ; Replaced the extension `ext-Comment` with the extension `ext-LanguageProficiency.Comment`. ; ZIBFHIR-97

## MaritalStatus (zib-Patient, nl-core-Patient)
* `.maritalStatus` ; terminology ; Changed codes in MaritalStatusCodelist ; ZIB-2218

## Nationality (zib-Patient, nl-core-Patient)
* No significant changes.

## Patient (zib-Patient, nl-core-Patient)
* `.extension:genderIdentity.value[x]` ; extension ; Added GenderIdentity for GenderIdentity ; ZIB-1693
* `.gender` ; terminology ; Added guidance in GeslachtCodelijst-to-AdministrativeGender ConceptMap ; ZIB-1239
* `.multipleBirth[x]:multipleBirthInteger` ; mapping ; Added mapping of MultipleBirthSequence ; ZIB-1670