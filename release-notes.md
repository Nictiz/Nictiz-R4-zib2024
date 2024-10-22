## zib-ContactInformation
* `.extension:comment` ; extension ; Replaced the extension `ext-comment` with the extension `contactpoint-comment` on zib-ContactInformation-TelephoneNumbers. ; ZIBFHIR-97
* `.extension:purpose` ; extension ; Added `contactpoint-purpose` on zib-ContactInformation-TelephoneNumbers to capture the zib terminology of NumberTypeCodelist, since the zib and FHIR ValueSet on `.use` do not completely map. ; ZIBFHIR-129
* `.extension:purpose` ; textual ; Added guidance for mapping of _EC_ in ConceptMap NummerSoortCodelijst-to-ContactInformation-TelephoneNumbersUse. ; ZIB-1652 
* `ContactPoint` ; textual ; Added mapping guidance for NumberType on the root comment of zib-ContactInformation-TelephoneNumbers. ; ZIB-1652


