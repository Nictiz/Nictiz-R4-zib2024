## zib-Patient
* `.extension:genderIdentity.value[x]` ; extensions ; Added GenderIdentity on Patient; [ZIB-1693]
* `.gender` ; terminology ; Added guidance for mapping of 'X' and 'V' in GeslachtCodelijst-to-AdministrativeGender ConceptMap ; [ZIB-1239]
* `.multipleBirth[x]:multipleBirthInteger` ; mapping ; Added mapping of MultipleBirthSequence ; [ZIB-1670]
* `.multipleBirth[x]:multipleBirthInteger` ; textual ; Added guidance: When exporting the data, if `.multipleBirth[x]:multipleBirthInteger` (MultipleBirthSequence) is present and has a value, MultipleBirthIndicator may be set to 'true', since MultipleBirthIndicator and MultipleBirthSequence cannot both be represented at the same time.


