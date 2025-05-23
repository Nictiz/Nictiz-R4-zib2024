# Maturity of these profiles
## Validation by HL7 Netherlands
Nictiz develops FHIR profiles (and related conformance resources) representing the zibs. These profiles undergo a validation process at HL7 Netherlands[^1], which checks them on aspects like alignment with international FHIR usage, re-usability, usage of terminology, etc. If one or more of these aspects are deemed incorrect, HL7 Netherlands asks Nictiz to adjust the profile accordingly. Only if all these aspects are deemed correct by HL7 Netherlands, the profile passes validation.

Profiles can be in one of four statuses:
* not submitted for validation: the profiles have not been developed yet, are still in development, or are being adjusted after rejection or withdrawal.
* in progress: the profiles have been submitted for validation and are awaiting the discussion at HL7 Netherlands.
* validated: the profiles have passed review at HL7 Netherlands.
* rejected: issues have been found with the profiles during review at HL7 Netherlands. Normally, this will result in adjustments of the profile and re-submission, with the accompanying statuses.

[^1] In terms of the NEN7522, HL7 Netherlands fulfills the roles of "expert" and "autorisator".

## Beta status
Profiles that have passed validation at HL7 Netherlands are published with a beta label to indicate that, although they have undergone thorough review, they have not been tested in production use. Users should be aware that production testing could introduce the need for adjustments and even breaking changes, although this is deemed unlikely.

## Validation status for each zib
### AbilityToDressOneself v3.1.1
* Status: not submitted for validation

### AbilityToDrink v3.1.2
* Status: not submitted for validation

### AbilityToEat v3.1.1
* Status: not submitted for validation

### AbilityToGroom v1.0.2
* Status: not submitted for validation

### AbilityToManageMedication v2.0
* Status: not submitted for validation

### AbilityToPerformMouthcareActivities v3.1
* Status: not submitted for validation

### AbilityToPerformNursingActivities v1.0.2
* Status: not submitted for validation

### AbilityToUseToilet v3.1.1
* Status: not submitted for validation

### AbilityToWashOneself v3.1.1
* Status: not submitted for validation

### AddressInformation v1.2
* Profile: zib-AddressInformation
* Status: in progress

### AdministrationAgreement v3.0
* Status: not submitted for validation

### Admission v2.0
* Status: not submitted for validation

### AdvanceDirective v4.3
* Status: not submitted for validation

### AlcoholUse v3.3
* Status: not submitted for validation

### Alert v4.2
* Status: not submitted for validation

### AllergyIntolerance v4.1.1
* Status: not submitted for validation

### AnatomicalLocation v1.0.3
* Status: not submitted for validation

### ApgarScore v1.2
* Status: not submitted for validation

### BarthelADLIndex v3.2
* Status: not submitted for validation

### BladderFunction v4.1
* Status: not submitted for validation

### BloodPressure v5.0
* Status: not submitted for validation

### BodyHeight v3.1.2
* Status: not submitted for validation

### BodyTemperature v3.1.2
* Status: not submitted for validation

### BodyWeight v4.0
* Status: not submitted for validation

### BowelFunction v5.0
* Status: not submitted for validation

### Burnwound v4.1
* Status: not submitted for validation

### CareAgreement v1.1
* Status: not submitted for validation

### CareTeam v1.0.1
* Status: not submitted for validation

### ChecklistPainBehaviour v1.2
* Status: not submitted for validation

### CollectionData v1.0
* Status: not submitted for validation

### ComfortScale v1.2
* Status: not submitted for validation

### ComplaintPerception v1.0
* Status: not submitted for validation

### Condition v1.0
* Status: not submitted for validation

### ContactInformation v1.3.1
* Profiles:
    * zib-ContactInformation-EmailAddresses
    * zib-ContactInformation-TelephoneNumbers
* Status: in progress

### ContactPerson v4.1
* Profiles:
    * zib-ContactPerson
    * zib-Patient
* Status: in progress

### DAS v1.1
* Status: not submitted for validation

### DevelopmentChild v2.0
* Status: not submitted for validation

### DiagnosticInsight v1.0
* Status: not submitted for validation

### DispenseRequest v4.0
* Status: not submitted for validation

### DOSScore v1.2
* Status: not submitted for validation

### DrugUse v3.5
* Status: not submitted for validation

### Education v3.3
* Profile: zib-Education
* Status: in progress

### Encounter v6.0
* Status: not submitted for validation

### EncounterReport v1.0
* Status: not submitted for validation

### EpisodeOfCare v1.0
* Status: not submitted for validation

### Exclusion v1.0
* Status: not submitted for validation

### FamilyHistory v4.0
* Status: not submitted for validation

### FamilySituation v3.4.1
* Status: not submitted for validation

### FamilySituationChild v1.4
* Status: not submitted for validation

### FeedingPatternInfant v1.1.3
* Status: not submitted for validation

### FeedingTubeSystem v3.5
* Status: not submitted for validation

### FLACCpainScale v1.2.1
* Status: not submitted for validation

### FluidBalance v1.0.1
* Status: not submitted for validation

### FreedomRestrictingIntervention v1.3
* Status: not submitted for validation

### FunctionalOrMentalStatus v4.0
* Status: not submitted for validation

### GlasgowComaScale v3.4
* Status: not submitted for validation

### HeadCircumference v1.3
* Status: not submitted for validation

### HealthcareProvider v3.6
* Profiles:
    * zib-HealthcareProvider
    * zib-HealthcareProvider-Organization
* Status: in progress

### HealthProfessional v4.0
* Profiles:
    * zib-HealthProfessional-Practitioner
    * zib-HealthProfessional-PractitionerRole
* Status: in progress

### HearingFunction v3.3
* Status: not submitted for validation

### HeartRate v3.4.1
* Status: not submitted for validation

### HelpFromOthers v3.2
* Status: not submitted for validation

### HoNOS+ v1.0
* Status: not submitted for validation

### Hypersensitivity v1.0
* Status: not submitted for validation

### HypersensitivityIntolerance v1.0
* Status: not submitted for validation

### IllnessPerception v3.2
* Status: not submitted for validation

### Infusion v3.5
* Status: not submitted for validation

### InstructionsForUse v3.0
* Status: not submitted for validation

### LaboratoryTestResult v7.0
* Status: not submitted for validation

### LanguageProficiency v4.0
* Profiles: zib-Patient
* Status: in progress
* Remark: This zib is modeled inline in the zib-Patient profile.

### LegalSituation v5.0
* Status: not submitted for validation

### LifeStance v3.2.1
* Status: not submitted for validation

### LivingSituation v3.4
* Status: not submitted for validation

### MaritalStatus v3.2
* Profiles: zib-Patient
* Status: in progress
* Remark: This zib is modeled inline in the zib-Patient profile.

### MedicalDevice v4.0
* Status: not submitted for validation

### MedicationAdministration2 v3.0
* Status: not submitted for validation

### MedicationAgreement v3.0
* Status: not submitted for validation

### MedicationContraIndication v2.0.1
* Status: not submitted for validation

### MedicationDispense v3.0.1
* Status: not submitted for validation

### MedicationUse2 v3.0
* Status: not submitted for validation

### Mobility v3.3.1
* Status: not submitted for validation

### MultidisciplinaryTeamMeeting v2.0
* Status: not submitted for validation

### MUSTScore v3.1.1
* Status: not submitted for validation

### NameInformation v1.1.1
* Profiles:
    * zib-NameInformation
    * zib-NameInformation.GivenName
* Status: in progress

### Nationality v3.0
* Profiles: zib-Patient
* Status: in progress
* Remark: This zib is modeled inline in the zib-Patient profile.

### NursingIntervention v4.1
* Status: not submitted for validation

### NutritionAdvice v3.2.1
* Status: not submitted for validation

### O2Saturation v4.0
* Status: not submitted for validation

### OrderData v1.0.1
* Status: not submitted for validation

### OutcomeOfCare v3.3.1
* Status: not submitted for validation

### PainCharacteristics v2.1
* Status: not submitted for validation

### PainScore v4.1
* Status: not submitted for validation

### ParticipationInSociety v3.1
* Status: not submitted for validation

### Patient v4.3
* Profiles: zib-Patient
* Status: in progress

### Payer v4.1
* Status: not submitted for validation

### PharmaceuticalProduct v2.2.1
* Status: not submitted for validation

### Pregnancy v4.1
* Status: not submitted for validation

### PressureUlcer v3.7
* Status: not submitted for validation

### Problem v4.7
* Status: not submitted for validation

### Procedure v5.4.1
* Status: not submitted for validation

### PulseRate v3.3
* Status: not submitted for validation

### Range v1.0.1
* Status: not submitted for validation

### Reaction v2.0
* Status: not submitted for validation

### Refraction v2.0
* Status: not submitted for validation

### RegistrationData v1.1.1
* Status: not submitted for validation

### Respiration v3.2
* Status: not submitted for validation

### Signaling v2.0
* Status: not submitted for validation

### SkinDisorder v3.4
* Status: not submitted for validation

### SNAQ65+Score v1.3
* Status: not submitted for validation

### SNAQrcScore v1.3
* Status: not submitted for validation

### SNAQScore v3.3
* Status: not submitted for validation

### SOAPReport v1.3
* Status: not submitted for validation

### Stoma v3.4
* Status: not submitted for validation

### StrongKidsScore v1.1
* Status: not submitted for validation

### SurveillanceDecision v1.0
* Status: not submitted for validation

### Symptom v1.0
* Status: not submitted for validation

### TextResult v4.4
* Status: not submitted for validation

### TimeInterval v1.3
* Status: not submitted for validation

### TNMTumorClassification v4.0
* Status: not submitted for validation

### TobaccoUse v3.5
* Status: not submitted for validation

### TreatmentDirective2 v2.0.1 	
* Status: not submitted for validation

### TreatmentObjective v3.2.1
* Status: not submitted for validation

### Vaccination v6.0.1
* Status: not submitted for validation

### VisualAcuity v2.1.1
* Status: not submitted for validation

### VisualFunction v3.4
* Status: not submitted for validation

### Wound v3.6
* Status: not submitted for validation
