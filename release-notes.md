## AbilityToDressOneself (zib-AbilityToDressOneself, nl-core-AbilityToDressOneself)
* No significant changes.

## AbilityToDrink
### zib-AbilityToDrink, nl-core-AbilityToDrink
* No significant changes.

### zib-AbilityToDrink.DrinkingLimitations, nl-core-AbilityToDrink.DrinkingLimitations
* No significant changes.

## AbilityToEat 
### zib-AbilityToEat, nl-core-AbilityToEat
* No significant changes.

### zib-AbilityToEat.EatingLimitations, nl-core-AbilityToEat.EatingLimitations
* No significant changes.

## AbilityToGroom (zib-AbilityToGroom, nl-core-AbilityToGroom)
* No significant changes

## AbilityToUseToilet 
### zib-AbilityToUseToilet, nl-core-AbilityToUseToilet
* No significant changes.

### zib-AbilityToUseToilet.MenstrualCare, nl-core-AbilityToUseToilet.MenstrualCare
* No significant changes.

### zib-AbilityToUseToilet.ToiletUse, nl-core-AbilityToUseToilet.ToiletUse
* No significant changes.

## AbilityToWashOneself (zib-AbilityToWashOneself, nl-core-AbilityToWashOneself)
* No significant changes.

## AddressInformation (zib-AddressInformation, nl-core-AddressInformation)
* `.line.extension:houseNumberLetter-houseNumberAddition.value[x]` ; textual ; Moved guidance for HouseNumberLetter and HouseNumberAddition from `.definition` to `.comment`, added zib concept definitions to `.definition`. ; ZIBFHIR-142
* `.line.extension:houseNumberIndication.value[x]` ; textual ; Added guidance for HouseNumberIndication. ; ZIB-2218
* `.line.extension:houseNumberIndication.value[x]` ; constraint ; Removed houseNumberIndication for HouseNumberIndication. ; ZIB-2218
* `.country.extension:countryCode.value[x]` ; terminology ; Changed codes in LandCodelijsten (LandGBACodelijst and LandISOCodelijst). ; ZIB-2218

## AnatomicalLocation 
### zib-AnatomicalLocation, nl-core-AnatomicalLocation
* `CodeableConcept` ; textual ; Refined guidance for Location and Laterality ; ZIBFHIR-113
* `.extension:bodyStructureReference` ; extension ; Replaced ExtAnatomicalLocationLaterality with BodyStructureReference for Laterality ; ZIBFHIR-113
* `.extension:bodyStructureReference` ; mapping ; Moved mapping of Laterality to `BodyStructure.locationQualifier` ; ZIBFHIR-113

### zib-AnatomicalLocation-BodyStructure, nl-core-AnatomicalLocation-BodyStructure
* New profile that maps Laterality to a native FHIR element inside the BodyStructure resource instead of a custom extension. ; ZIBFHIR-113

## BloodPressure 
### zib-BloodPressure, nl-core-BloodPressure
* `.bodySite` ; terminology ; Changed codes in MeetLocatieCodelijst. ; ZIB-1731, ZIB-1813
* `.bodySite` ; mapping ; Removed mapping of MeasuringLocation. ; ZIB-1731
* `.bodySite` ; mapping ; Added mapping of AnatomicalLocation. ; ZIB-1731
* `.method` ; terminology ; Changed codes in MeetmethodeCodelijst. ; ZIB-2036
* `.component:diastolicEndpoint.value[x]` ; terminology ; Changed codes in DiastolischEindpuntCodelijst. ; ZIB-2218
* `.component:cuffType.value[x]` ; terminology ; Changed codes in ManchetTypeCodelijst. ; ZIB-2218

### zib-BloodPressure.AnatomicalLocation, nl-core-BloodPressure.AnatomicalLocation
* A new profile that applies zib BloodPressure constraints to the Location concept within AnatomicalLocation (ZIB-1731).

## BodyHeight (zib-BodyHeight, nl-core-BodyHeight)
* `.value[x]` ; textual ; Changed definition of HeightValue. ; ZIB-1887
* `.value[x]` ; textual ; Added guidance for HeightValue. ; ZIB-1887

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

### zib-Patient, nl-core-Patient
* `.contact.relationship:role` ; textual ; Added guidance for Role. ; ZIBFHIR-73
* `.contact.relationship:role` ; terminology ; Changed value set from RolCodelijst to RolSnomedCodelijst. ; ZIB-1180, ZIB-1470, ZIB-1481, ZIB-1496, ZIB-1556, ZIB-1616, ZIB-1789, ZIB-2008, ZIB-2211
* `.contact.relationship:relationship` ; textual ; Changed definition of Relationship. ; ZIB-1556
* `.contact.relationship:relationship` ; terminology ; Changed value set from RelatieCodelijst to RelatieSnomedCodelijst. ; ZIB-1180, ZIB-1438, ZIB-1495, ZIB-1486, ZIB-1556, ZIB-1616, ZIB-1770, ZIB-1789, ZIB-1941, ZIB-2008

## Education (zib-Education, nl-core-Education)
* `.value[x]` ; terminology ; Changed value set from SchooltypeCodelijsten to SchooltypeCBSCodelijst. ; ZIB-1575

## FluidBalance
### zib-FluidBalance, nl-core-FluidBalance
* No significant changes.

### zib-FluidBalance.FluidTotalIn, nl-core-FluidBalance.FluidTotalIn
* No significant changes.

### zib-FluidBalance.FluidTotalOut, nl-core-FluidBalance.FluidTotalOut
* No significant changes.

## HealthcareProvider
### zib-HealthcareProvider, nl-core-HealthcareProvider
* No significant changes.

### zib-HealthcareProvider-Organization, nl-core-HealthcareProvider-Organization
* `.type:organizationType` ; terminology ; Changed codes in OrganisatieTypeCodelijst. ; ZIB-1559, ZIB-1927
* `.type:departmentSpecialty` ; terminology ; Changed codes in AfdelingSpecialismeCodelijst. ; ZIB-2218
* `.type:departmentSpecialty` ; textual ; Changed definition of DepartmentSpecialty. ; ZIB-1665

## HealthProfessional 
### zib-HealthProfessional-Practitioner, nl-core-HealthProfessional-Practitioner
* `.identifier` ; textual ; Changed definition of HealthProfessionalIdentificationNumber. ; ZIB-1673
* `.gender` ; textual ; Changed definition of Gender. ; ZIB-1256, ZIB-1368

### zib-HealthProfessional-PractitionerRole, nl-core-HealthProfessional-PractitionerRole
* `.specialty:specialty` ; terminology ; Changed codes in SpecialismeCodelijsten (SpecialismeAGBCodelijst and SpecialismeUZICodelijst). ; ZIB-2218

## IllnessPerception 
### zib-IllnessPerception, nl-core-IllnessPerception 
* `.code` ; terminology ; Pattern changed from http://snomed.info/sct#363910003 to http://snomed.info/sct#159971000146104. ; ZIB-1600

### zib-IllnessPerception.CopingWithIllnessByFamily, nl-core-IllnessPerception.CopingWithIllnessByFamily 
* No significant changes.

### zib-IllnessPerception.CopingWithIllnessByPatient, nl-core-IllnessPerception.CopingWithIllnessByPatient 
* No significant changes.

### zib-IllnessPerception.PatientIllnessInsight, nl-core-IllnessPerception.PatientIllnessInsight
* No significant changes.

## LanguageProficiency (zib-Patient, nl-core-Patient)
* `.communication.extension:languageControl.extension:level.value[x]` ; terminology ; Changed codes in TaalvaardigheidBegrijpenCodelijst, TaalvaardigheidLezenCodelijst and TaalvaardigheidSprekenCodelijst, changed value set from v3.LanguageAbilityProficiency to TaalvaardigheidCodelijsten. ; ZIB-1877
* `.communication.extension:comment` ; extension ; Replaced extension ExtComment with ExtLanguageProficiencyComment. ; ZIBFHIR-97
* `.communication.language` ; terminology ; Changed codes in CommunicatieTaalCodelijst. ; ZIB-2218

## MaritalStatus (zib-Patient, nl-core-Patient)
* `.maritalStatus` ; terminology ; Changed codes in BurgerlijkeStaatCodelijst. ; ZIB-2218

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

## ParticipationInSociety
### zib-ParticipationInSociety, nl-core-ParticipationInSociety
* No significant changes.

### zib-ParticipationInSociety.Hobby, nl-core-ParticipationInSociety.Hobby
* No significant changes.

### zib-ParticipationInSociety.SocialNetwork, nl-core-ParticipationInSociety.SocialNetwork
* No significant changes.

### zib-ParticipationInSociety.WorkSituation, nl-core-ParticipationInSociety.WorkSituation
* No significant changes.

## Patient (zib-Patient, nl-core-Patient)
* `.extension:genderIdentity.value[x]` ; extension ; Added extension genderIdentity for GenderIdentity. ; ZIB-1693
* `.gender` ; terminology ; Changed code description in GeslachtCodelijst. ; ZIB-1239
* `.multipleBirth[x]:multipleBirthInteger` ; mapping ; Added mapping of MultipleBirthSequence. ; ZIB-1670
