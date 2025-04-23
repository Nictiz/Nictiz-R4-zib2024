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
* No significant changes.

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
* `.line.extension:houseNumberIndication.value[x]` ; textual ; Added guidance for HouseNumberIndication. ; ZIB-2218, ZIB-2549
* `.line.extension:houseNumberIndication.value[x]` ; constraint ; Removed houseNumberIndication for HouseNumberIndication. ; ZIB-2218, ZIB-2549
* `.country.extension:countryCode.value[x]` ; terminology ; Changed codes in LandCodelijsten (LandGBACodelijst and LandISOCodelijst). ; ZIB-2218, ZIB-2549

## Admission (zib-Admission, nl-core-Admission)
* New profile of zib Admission on resource Encounter.

## AnatomicalLocation 
### zib-AnatomicalLocation, nl-core-AnatomicalLocation
* `CodeableConcept` ; textual ; Added guidance for Location and Laterality. ; ZIBFHIR-113
* `CodeableConcept` ; constraint ; Added zib-AnatomicalLocation-01 for Location. ; ZIBFHIR-113
* `.extension:bodyStructureReference` ; extension ; Replaced ExtAnatomicalLocationLaterality with BodyStructureReference for Laterality. ; ZIBFHIR-113
* `.extension:bodyStructureReference` ; mapping ; Moved mapping of Laterality to `BodyStructure.locationQualifier`. ; ZIBFHIR-113

### zib-AnatomicalLocation-BodyStructure, nl-core-AnatomicalLocation-BodyStructure
* New profile that maps Laterality to a native FHIR element inside the BodyStructure resource instead of a custom extension. ; ZIBFHIR-113

## BloodPressure 
### zib-BloodPressure, nl-core-BloodPressure
* Changed description of BloodPressure. ; ZIB-2112, ZIB-2589
* `.bodySite` ; mapping ; Renamed mapping from MeasuringLocation to AnatomicalLocation. ; ZIB-1731
* `.bodySite` ; terminology ; Changed codes in MeetLocatieCodelijst. ; ZIB-1731, ZIB-1813
* `.bodySite` ; terminology ; Changed value set from MeetLocatieCodelijst to LocatieCodelijsten. ; ZIBFHIR-192
* `.bodySite` ; terminology ; Added MeetLocatieCodelijst as minimum allowable value set. ; ZIBFHIR-192
* `.method` ; terminology ; Changed codes in MeetmethodeCodelijst. ; ZIB-2036
* `.component:diastolicEndpoint.value[x]` ; terminology ; Changed codes in DiastolischEindpuntCodelijst. ; ZIB-2218, ZIB-2549
* `.component:cuffType.value[x]` ; terminology ; Changed codes in ManchetTypeCodelijst. ; ZIB-2218, ZIB-2549

### zib-BloodPressure.AnatomicalLocation-BodyStructure, nl-core-BloodPressure.AnatomicalLocation-BodyStructure
* A new profile that applies zib BloodPressure constraints to the Location concept within AnatomicalLocation (ZIB-1731).

## BodyHeight (zib-BodyHeight, nl-core-BodyHeight)
* `.value[x]` ; textual ; Changed definition of HeightValue. ; ZIB-1887
* `.value[x]` ; textual ; Added guidance for HeightValue. ; ZIB-1887

## BodyTemperature (zib-BodyTemperature, nl-core-BodyTemperature)
* `.value[x]` ; terminology ; Added required binding to BodyTemperatureUnits. ; ZIBFHIR-178

## BodyWeight (zib-BodyWeight, nl-core-BodyWeight)
* `.value[x]` ; textual ; Changed definition of WeightValue. ; ZIB-1886
* `.value[x]` ; terminology ; Changed value set from ZibBodyWeightUnits to BodyWeightUnits. ; ZIBFHIR-178
* `.component:clothing.value[x]` ; terminology ; Changed codes in KledingCodelijst. ; ZIB-1704

## CareTeam (zib-CareTeam, nl-core-CareTeam) 
* No significant changes.

## ComfortScale (zib-ComfortScale, nl-core-ComfortScale)
* `.value[x]:valueInteger` ; textual ; Refined guidance for TotalScore. ; ZIB-1839
* `.value[x]:valueInteger` ; constraint ; Adjusted maxValueInteger value for TotalScore. ; ZIB-1839

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
* `.code` ; terminology ; Pattern changed from http://snomed.info/sct#275818006 to http://snomed.info/sct#129008009. ; ZIB-1765

### zib-DevelopmentChild.ToiletTrainednessUrine, nl-core-DevelopmentChild.ToiletTrainednessUrine
* `.code` ; terminology ; Pattern changed from http://snomed.info/sct#275819003 to http://snomed.info/sct#129009001. ; ZIB-2271

## Education (zib-Education, nl-core-Education)
* `.value[x]` ; terminology ; Changed value set from SchooltypeCodelijsten to SchooltypeCBSCodelijst. ; ZIB-1575

## EpisodeOfCare (zib-EpisodeOfCare, nl-core-EpisodeOfCare)
* `.extension:comment` ; extension ; Replaced extension ExtComment with Note. ; ZIBFHIR-97

## FLACCpainScale (zib-FLACCpainScale, nl-core-FLACCpainScale)
* No significant changes.

## FluidBalance
### zib-FluidBalance, nl-core-FluidBalance
* No significant changes.

### zib-FluidBalance.FluidTotalIn, nl-core-FluidBalance.FluidTotalIn
* No significant changes.

### zib-FluidBalance.FluidTotalOut, nl-core-FluidBalance.FluidTotalOut
* No significant changes.

## GlasgowComaScale (zib-GlasgowComaScale, nl-core-GlasgowComaScale)
* `.component:gcsMotor.value[x]` ; terminology ; Changed codes in GCS_MotorCodelijsten (GCS_MotorCodelijst, GCS_MotorCodelijstBaby and GCS_MotorCodelijstKleuter). ; ZIB-1314
* `.component:gcsVerbal.value[x]` ; terminology ; Changed codes in GCS_VerbalCodelijsten (GCS_VerbalCodelijst, GCS_VerbalCodelijstBaby and GCS_VerbalCodelijstKleuter). ; ZIB-1314

## HeadCircumference (zib-HeadCircumference, nl-core-HeadCircumference)
* `.value[x]` ; textual ; Changed definition of HeadCircumferenceMeasurement. ; ZIBFHIR-178
* `.value[x]` ; terminology ; Added required binding to BodyLengthUnits. ; ZIBFHIR-178

## HealthcareProvider
### zib-HealthcareProvider, nl-core-HealthcareProvider
* No significant changes.

### zib-HealthcareProvider-Organization, nl-core-HealthcareProvider-Organization
* `.type:organizationType` ; terminology ; Changed codes in OrganisatieTypeCodelijst. ; ZIB-1559, ZIB-1927
* `.type:departmentSpecialty` ; terminology ; Changed codes in AfdelingSpecialismeCodelijst. ; ZIB-2218, ZIB-2549
* `.type:departmentSpecialty` ; textual ; Changed definition of DepartmentSpecialty. ; ZIB-1665

## HealthProfessional 
### zib-HealthProfessional-Practitioner, nl-core-HealthProfessional-Practitioner
* `.identifier` ; textual ; Changed definition of HealthProfessionalIdentificationNumber. ; ZIB-1673
* `.gender` ; textual ; Changed definition of Gender. ; ZIB-1256, ZIB-1368

### zib-HealthProfessional-PractitionerRole, nl-core-HealthProfessional-PractitionerRole
* `.specialty:specialty` ; terminology ; Changed codes in SpecialismeCodelijsten (SpecialismeAGBCodelijst and SpecialismeUZICodelijst). ; ZIB-2218, ZIB-2549

## IllnessPerception 
### zib-IllnessPerception, nl-core-IllnessPerception 
* `.code` ; terminology ; Pattern changed from http://snomed.info/sct#363910003 to http://snomed.info/sct#159971000146104. ; ZIB-1600

### zib-IllnessPerception.CopingWithIllnessByFamily, nl-core-IllnessPerception.CopingWithIllnessByFamily 
* No significant changes.

### zib-IllnessPerception.CopingWithIllnessByPatient, nl-core-IllnessPerception.CopingWithIllnessByPatient 
* No significant changes.

### zib-IllnessPerception.PatientIllnessInsight, nl-core-IllnessPerception.PatientIllnessInsight
* No significant changes.

## LegalSituation 
### zib-LegalSituation-LegalStatus, nl-core-LegalSituation-LegalStatus
* `.category:legalStatusCode` ; terminology ; Pattern changed from http://snomed.info/sct#303186005 to http://snomed.info/sct#8625004. ; ZIB-2272
* `.code` ; terminology ; Changed codes in LegalStatusCodelist. ; ZIB-1357, ZIB-1504, ZIB-2218

### zib-LegalSituation-Representation, nl-core-LegalSituation-Representation
* `.code` ; terminology ; Changed codes in RepresentationCodelist. ; ZIB-1480, ZIB-2099, ZIB-2218

## LanguageProficiency (zib-Patient, nl-core-Patient)
* `.communication.extension:languageControl.extension:level.value[x]` ; terminology ; Changed codes in TaalvaardigheidBegrijpenCodelijst, TaalvaardigheidLezenCodelijst and TaalvaardigheidSprekenCodelijst, changed value set from v3.LanguageAbilityProficiency to TaalvaardigheidCodelijsten. ; ZIB-1877
* `.communication.extension:comment` ; extension ; Replaced extension ExtComment with ExtLanguageProficiencyComment. ; ZIBFHIR-97
* `.communication.language` ; terminology ; Changed codes in CommunicatieTaalCodelijst. ; ZIB-2218, ZIB-2549

## LifeStance (zib-LifeStance, nl-core-LifeStance)
* `Observation` ; mapping ; Renamed mapping from LifeStanceRC to LifeStance. ; ZIB-2578

## LivingSituation 
### zib-LivingSituation, nl-core-LivingSituation
* `effective[x]:effectiveDateTime` ; mapping ; Added mapping of Date ; ZIB-1272

### zib-LivingSituation.HomeAdaption, nl-core-LivingSituation.HomeAdaption
* `effective[x]:effectiveDateTime` ; mapping ; Added mapping of Date ; ZIB-1272

### zib-LivingSituation.HouseType, nl-core-LivingSituation.HouseType
* `effective[x]:effectiveDateTime` ; mapping ; Added mapping of Date ; ZIB-1272
* `value[x]:valueCodeableConcept` ; terminology ; Changed codes in TypeOfHomeCodelist ; ZIB-1501, ZIB-1575

### zib-LivingSituation.LivingCondition, nl-core-LivingSituation.LivingCondition
* `effective[x]:effectiveDateTime` ; mapping ; Added mapping of Date ; ZIB-1272

## MaritalStatus (zib-Patient, nl-core-Patient)
* `.maritalStatus` ; terminology ; Changed codes in BurgerlijkeStaatCodelijst. ; ZIB-2218, ZIB-2549

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

## NutritionAdvice (zib-NutritionAdvice, nl-core-NutritionAdvice)
* No significant changes.

## O2Saturation (zib-O2Saturation, nl-core-O2Saturation)
* `.effective[x]:effectiveDateTime` ; mapping ; Renamed mapping from O2SaturationDateTime to SpO2SaturationDateTime. ; ZIB-1217
* `.bodySite` ; mapping ; Added mapping of MeasuringLocation. ; ZIB-1217

## PainScore (zib-PainScore, nl-core-PainScore)
* Changed description of PainScore. ; ZIB-1996
* `.method` ; terminology ; Changed codes in PijnMeetmethodeCodelijst. ; ZIB-2218, ZIB-2549

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
* `.extension:genderIdentity.value[x]` ; extension ; Added extension individual-genderIdentity for GenderIdentity. ; ZIB-1693, ZIBFHIR-321
* `.gender` ; terminology ; Changed code description in GeslachtCodelijst. ; ZIB-1239
* `.multipleBirth[x]:multipleBirthInteger` ; mapping ; Added mapping of MultipleBirthSequence. ; ZIB-1670

## Payer 
### zib-Payer-Organization, nl-core-Payer-Organization
* `Organization` ; mapping ; Removed mapping of InsuranceCompany. ; ZIBFHIR-196

### zib-Payer.InsuranceCompany, nl-core-Payer.InsuranceCompany
* `Coverage` ; mapping ; Moved mapping of InsuranceCompany from `.payor`. ; ZIBFHIR-196
* `Coverage` ; textual ; Added guidance for Insurance. ; ZIBFHIR-196
* `.type` ; terminology ; Changed codes in VerzekeringssoortCodelijst. ; ZIB-2218, ZIB-2549

### zib-Payer.PayerPerson, nl-core-Payer.PayerPerson
* `Coverage` ; mapping ; Moved mapping of PayerPerson from `.payor`. ; ZIBFHIR-196

## Problem (zib-Problem, nl-core-Problem)
* `.code` ; terminology ; Changed codes in ProbleemNaamCodelijst. ; ZIB-1477, ZIB-1575, ZIB-2087, ZIB-2218, ZIB-2549
* `.code.text` ; mapping ; Moved mapping of FurtherSpecificationProblemName from `.code.extension:furtherSpecificationProblemName.value[x]`. ; ZIBFHIR-145
* `.bodySite` ; cardinality ; Changed max cardinality from 1 to *. ; ZIB-1433
* `.bodySite` ; terminology ; Binding strength changed from required to extensible. ; ZIBFHIR-113
* `.note.text` ; textual ; Changed definition of Comment. ; ZIB-1610

## SkinDisorder (zib-SkinDisorder, nl-core-SkinDisorder)
* `.code` ; terminology ; Changed codes in SoortAandoeningCodelijst. ; ZIB-1572
* `.bodySite` ; terminology ; Binding strength changed from required to extensible. ; ZIBFHIR-113

## SNAQ65plusScore (zib-SNAQ65plusScore, nl-core-SNAQ65plusScore)
* `Observation` ; constraint ; Removed zib-SNAQ65PlusScore-1 for WeightLossScore, UpperArmCircumferenceScore, AppetiteScore and ExerciseScore. ; ZIB-1668
* `Observation` ; constraint ; Renamed and adjusted zib-SNAQ65PlusScore-2 to zib-SNAQ65plusScore-1. ; ZIB-1668
* `.value[x]:valueInteger` ; textual ; Changed definition of TotalScore. ; ZIB-1635, ZIB-1668
* `.value[x]:valueInteger` ; constraint ; Adjusted maxValueInteger value for TotalScore. ; ZIB-1635, ZIB-1668
* `.component:upperArmCircumferenceScore.value[x]` ; mapping ; Renamed mapping from UpperarmCircumference to UpperArmCircumferenceScore. ; ZIB-1633

## SNAQrcScore (zib-SNAQrcScore , nl-core-SNAQrcScore)
* `.value[x]:valueInteger` ; textual ; Changed definition of TotalScore. ; ZIB-2058
* `.value[x]:valueInteger` ; constraint ; Adjusted maxValueInteger value for TotalScore. ; ZIB-2058
* `.component:weightLossScore.value[x]` ; terminology ; Changed codes in SNAQrcGewichtsverliesScoreCodelijst. ; ZIB-2058
* `.component:assistedEatingScore.value[x]` ; mapping ; Renamed mapping from AssistedEating to AssistedEatingScore. ; ZIB-1633

## SNAQScore (zib-SNAQScore, nl-core-SNAQScore)
* No significant changes.