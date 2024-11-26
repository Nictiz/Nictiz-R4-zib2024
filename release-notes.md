## AddressInformation (zib-AddressInformation, nl-core-AddressInformation)
* `.extension:addressType.value[x]` ; terminology ; Changed codes in AdresSoortCodelijst. ; ZIB-2218
* `.line.extension:houseNumberLetter-houseNumberAddition.value[x]` ; textual ; Moved guidance for HouseNumberLetter and HouseNumberAddition from `.definition` to `.comment`, added zib concept definitions to `.definition`. ; ZIBFHIR-142
* `.line.extension:houseNumberIndication.value[x]` ; textual ; Added guidance for HouseNumberIndication. ; ZIB-2218
* `.line.extension:houseNumberIndication.value[x]` ; constraint ; Removed houseNumberIndication for HouseNumberIndication. ; ZIB-2218
* `.country.extension:countryCode.value[x]` ; terminology ; Changed codes in LandCodelijsten (LandGBACodelijst en LandISOCodelijst). ; ZIB-2218

## DevelopmentChild
### zib-DevelopmentChild, nl-core-DevelopmentChild
* No significant changes.
### zib-DevelopmentChild.AgeFirstMenstruation, nl-core-DevelopmentChild.AgeFirstMenstruation
* No significant changes.
### zib-DevelopmentChild.DevelopmentCognition, nl-core-DevelopmentChild.DevelopmentCognition
* No significant changes.
### zib-DevelopmentChild.DevelopmentLinguistics, nl-core-DevelopmentChild.DevelopmentLinguistics
* No significant changes.
### zib-DevelopmentChild.DevelopmentLocomotion, nl-core-DevelopmentChild.DevelopmentLocomotion
* No significant changes.
### zib-DevelopmentChild.ToiletTrainednessFeces, nl-core-DevelopmentChild.ToiletTrainednessFeces
* `.code.pattern[x]` ; terminology ; Pattern changed from http://snomed.info/sct#275818006 to http://snomed.info/sct#129008009. ; ZIB-1765
### zib-DevelopmentChild.ToiletTrainednessUrine, nl-core-DevelopmentChild.ToiletTrainednessUrine
* `.code.pattern[x]` ; terminology ; Pattern changed from http://snomed.info/sct#275819003 to http://snomed.info/sct#129009001. ; ZIB-2271

## NameInformation
### zib-NameInformation
* No significant changes.

### nl-core-NameInformation
* All changes from the zib profile.
* `HumanName` ; constraint ; Renamed nl-core-NameInformation-01 to nl-core-NameInformation-1. ; ZIBFHIR-141
* `.family` ; constraint ; Renamed nl-core-NameInformation-02 to nl-core-NameInformation-2. ; ZIBFHIR-141

### zib-NameInformation.GivenName, nl-core-NameInformation.GivenName
* No significant changes.
