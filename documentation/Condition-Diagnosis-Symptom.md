# Condition, Diagnosis, and Symptom

This document outlines the FHIR mapping strategy for the zibs Condition, Diagnosis, and Symptom. These concepts are closely related and require a structured approach in FHIR to capture both their persistent nature and point-in-time assessments accurately.

Four distinct FHIR profiles based on the `Condition`, `ClinicalImpression`, and `Observation` resources represent these zibs, separating the core record of a condition, diagnosis, or symptom from specific temporal recordings or assessments.

## FHIR profiles

* _zib-ConditionAndDiagnosis_ represents the core, enduring record of a patient's diagnosed condition or health problem. It consolidates long-term information from both the Condition and Diagnosis zibs.
* _zib-ConditionAndDiagnosis-ClinicalImpression_ captures the clinical assessment or impression related to a Condition/Diagnosis at a specific point in time. 
* _zib-Symptom_ represents the core record of a symptom, particularly when it's persistent or requires tracking as a distinct entity over time.
* _zib-Symptom.Characteristics_ records specific, point-in-time details, characteristics, or status updates about a symptom.

The below diagram shows these profiles and how they relate to each other.
```mermaid
---
title: zibs Condition, Diagnosis and Symptom in FHIR
---

flowchart TB

    CD["`**Condition**
        (zib-ConditionAndDiagnosis)
        _Core record holding long-term details of the Condition or Diagnosis._`"]
    CDCI["`**ClinicalImpression**
        (zib-ConditionAndDiagnosis-ClinicalImpression)
        _Records a clinician's assessment related to a Condition/Diagnosis at a point in time._`"]
    S["`**Condition**
        (zib-Symptom)
        _Core record representing a persistent or tracked Symptom._`"]
    SC["`**Observation**
        (zib-Symptom.Characteristics)
        _Records specific characteristics or status of a Symptom at a point in time._`"]    

    %% --- Relationships ---
    CD      -- .evidence.detail --> S
    CDCI    -- .problem --> CD
    S       -- .evidence.detail --> SC
    CD      -- ext.condition-occurredFollowing, 
               ext.condition-ruledOut,
               ext.condition-related, 
               ext.condition-dueTo --> CD
```

## General rules

* When recording a new symptom, always an instance is created of the zib-ConditionAndDiagnosis, zib-Symptom and zib-Symptom.Characteristics profiles. 
* Subsequent recordings about the this symptom can be tracked added using zib-Symptom.Characteristics or by updating the zib-Symptom instance.
* When recording a new Diagnose, always an instance is created of zib-ConditionAndDiagnosis and zib-ConditionAndDiagnosis-ClinicalImpression profile.
* When recording modifying a diagnosis, if DiagnosisName is changed, a new instance of the Condition is created that contains a reference to the previous. 

## Technical Scenario's regarding instances

### 1. Patient has a new Symptom A

```mermaid
flowchart TB

NewSymptom_A["`New Symptom A`"]

    CD_A["`**Condition**
        (zib-ConditionAndDiagnosis)
        .id = _1CDA_`"] 

    S_A["`**Condition**
        (zib-Symptom)
        .id = _1SA_`"]

    SC_A["`**Observation**
        (zib-Symptom.Characteristics)
        .id = _1SCA_`"]    

    CD_A:::Ash
    S_A:::Ash
    SC_A:::Ash
    classDef Ash stroke-width:1px, stroke-dasharray:none, stroke:#999999, fill:#EEEEEE, color:#000000 

NewSymptom_A -- create --> CD_A
NewSymptom_A -- create --> S_A
NewSymptom_A -- create --> SC_A
```

### 2. Patient has a new Symptom B
```mermaid
flowchart TB

NewSymptom_B["`New Symptom B`"]

    CD_B["`**Condition**
        (zib-ConditionAndDiagnosis)
        .id = _2CDB_`"] 
    S_B["`**Condition**
        (zib-Symptom)
        .id = _2SB_`"]
    SC_B["`**Observation**
        (zib-Symptom.Characteristics)
        .id = _2SCB_`"]

    CD_B:::Ash
    S_B:::Ash
    SC_B:::Ash
    classDef Ash stroke-width:1px, stroke-dasharray:none, stroke:#999999, fill:#EEEEEE, color:#000000    

NewSymptom_B -- create --> CD_B
NewSymptom_B -- create --> S_B
NewSymptom_B -- create --> SC_B
```


### 3. Patient gets another Symptom C related to the same Condition as Symptom A
```mermaid
flowchart TB

NewSymptom_C["`New Symptom C related to Condition A`"]

    S_C["`**Condition**
        (zib-Symptom)
        .id = _3SC_`"]
    SC_C["`**Observation**
        (zib-Symptom.Characteristics)
        .id = _3SCC_`"]    
    CD_A["`**Condition**
        (zib-ConditionAndDiagnosis)
        .id = _1CDA_`"] 
    
    S_C:::Ash
    SC_C:::Ash
    CD_A:::Ash
    classDef Ash stroke-width:1px, stroke-dasharray:none, stroke:#999999, fill:#EEEEEE, color:#000000


NewSymptom_C -- create --> S_C
NewSymptom_C -- create --> SC_C
NewSymptom_C -- update --> CD_A
```

### 4. Healthprofessional updates symptom A (not the SymptomName)
```mermaid
flowchart TB

UpdateSymptom_A["`Update Symptom A`"]
    CD_A["`**Condition**
        (zib-ConditionAndDiagnosis)
        .id = _1CDA_`"] 
    S_A["`**Condition**
        (zib-Symptom)
        .id = _1SA_`"]
    
    S_A:::Ash
    CD_A:::Ash
    classDef Ash stroke-width:1px, stroke-dasharray:none, stroke:#999999, fill:#EEEEEE, color:#000000

UpdateSymptom_A -- update --> CD_A
UpdateSymptom_A -- update --> S_A
```

### 5. Symptom A is finished and patient gets a new Symptom D for Condition A 

```mermaid
flowchart TB

CloseSymptom_A["`Close Symptom A`"]
NewSymptom_D["`New Symptom D related to Condition A`"]

CloseSymptom_A -.-> NewSymptom_D

    S_A["`**Condition**
        (zib-Symptom)
        .id = _1SA_
        .clinicalStatus = _inactive_|_resolved_
        .abatement[x] = [past date]`"]    

    CD_A["`**Condition**
        (zib-ConditionAndDiagnosis)
        .id = _1CDA_`"] 

    S_D["`**Condition**
        (zib-Symptom)
        .id = _5SD_`"]
    SC_D["`**Observation**
        (zib-Symptom.Characteristics)
        .id = _5SCD_`"]    

    S_A:::Ash
    CD_A:::Ash
    S_D:::Ash
    SC_D:::Ash
    classDef Ash stroke-width:1px, stroke-dasharray:none, stroke:#999999, fill:#EEEEEE, color:#000000

CloseSymptom_A -- update --> S_A
NewSymptom_D -- create --> S_D
NewSymptom_D -- create --> SC_D
NewSymptom_D -- update --> CD_A

```

### 6. Symptom A is closed and there is a new Diagnosis B for Condition A


```mermaid
flowchart TB

CloseSymptom_A["`Close Symptom A`"]
NewDiagnosis_B["`New Diagnosis B related to Condition A`"]

CloseSymptom_A -.-> NewDiagnosis_B

    S_A["`**Condition**
        (zib-Symptom)
        .id = _1SA_
        .clinicalStatus = _inactive_|_resolved_
        .abatement[x] = [past date]`"]    

    CD_B["`**Condition**
        (zib-ConditionAndDiagnosis)
        .id = _6CDB_
        .extension:occuredFollowing = _1CDA_`"] 
    CDCI_B["`**ClinicalImpression**
        (zib-ConditionAndDiagnosis-ClinicalImpression)
        .id = _6CDCIB_`"] 

    S_A:::Ash
    CD_B:::Ash
    CDCI_B:::Ash
    classDef Ash stroke-width:1px, stroke-dasharray:none, stroke:#999999, fill:#EEEEEE, color:#000000

CloseSymptom_A -- update --> S_A
NewDiagnosis_B -- create --> CD_B
NewDiagnosis_B -- create --> CDCI_B
```


### 7. Existing symptom A and related condition A are closed 

```mermaid
flowchart TB

UpdateSymptom_A["`Update Symptom A`"]
UpdateDiagnosis_B["`Update Diagnosis B related to Condition A`"]

UpdateSymptom_A -.-> UpdateDiagnosis_B

    S_A["`
        **Condition**
        (zib-Symptom)
        .id = _1SA_
        .clinicalStatus = _inactive_|_resolved_
        .abatement[x] = [past date]
        `"]    

    CD_B["`
        **Condition**
        (zib-ConditionAndDiagnosis)
        .id = _6CDB_
        .extension.condition-course = 'niet meer aanwezig'
        .clinicalStatus = _inactive_|_resolved_
        .abatement[x] = [past date]
        `"] 
   
    S_A:::Ash
    CD_B:::Ash
    classDef Ash stroke-width:1px, stroke-dasharray:none, stroke:#999999, fill:#EEEEEE, color:#000000

UpdateSymptom_A -- update --> S_A
UpdateDiagnosis_B -- update --> CD_B

```

### 8. Healthprofessional rules out a Symptom

TODO

### 9. Healthprofessional modifies a single diagnosis 'Bronchitus' to a 'Longonsteking'

```mermaid
flowchart TB

UpdateDiagnosis_A["`Update Bronchitus diagnosis`"]
CreateDiagnosis_B["`Create Longonsteking diagnosis`"]

UpdateDiagnosis_A -.-> CreateDiagnosis_B

    CD_Bronchitus["`
            **Condition**
            (zib-ConditionAndDiagnosis)
            .id = _9CDBronchitus_
            .clinicalStatus = _inactive_|_resolved_
        `"] 
    CD_Longonsteking["`
            **Condition**
            (zib-ConditionAndDiagnosis)
            .id = _9CDBLongonsteking_
            .condition-occuredFollowing = _9CDBronchitus_
        `"] 
    CDCI_Longonsteking["`
        **ClinicalImpression**
        (zib-ConditionAndDiagnosis-ClinicalImpression)
        .id = _9CDCILongonsteking_
        `"] 
   
    CD_Bronchitus:::Ash
    CD_Longonsteking:::Ash
    CDCI_Longonsteking:::Ash
    classDef Ash stroke-width:1px, stroke-dasharray:none, stroke:#999999, fill:#EEEEEE, color:#000000

UpdateDiagnosis_A -- update --> CD_Bronchitus
CreateDiagnosis_B -- create --> CD_Longonsteking
CreateDiagnosis_B -- create --> CDCI_Longonsteking

```

### 10. Healthprofessional ruled out the DD disagnosis Bronchitus and made from the DD 'Longonsteking' the diagnosis.

```mermaid
flowchart TB

UpdateDiagnosis_A["`Update Bronchitus diagnosis`"]
CreateDiagnosis_B["`Create Longonsteking diagnosis`"]

UpdateDiagnosis_A -.-> CreateDiagnosis_B

    CD_Bronchitus["`
            **Condition**
            (zib-ConditionAndDiagnosis)
            .id = _9CDBronchitus_
            .verificationStatus = _refuted_
        `"] 
    CD_Longonsteking["`
            **Condition**
            (zib-ConditionAndDiagnosis)
            .id = _9CDBLongonsteking_
            .condition-occuredFollowing = _9CDBronchitus_
        `"] 
    CDCI_Longonsteking["`
        **ClinicalImpression**
        (zib-ConditionAndDiagnosis-ClinicalImpression)
        .id = _9CDCILongonsteking_
        `"] 
   
    CD_Bronchitus:::Ash
    CD_Longonsteking:::Ash
    CDCI_Longonsteking:::Ash
    classDef Ash stroke-width:1px, stroke-dasharray:none, stroke:#999999, fill:#EEEEEE, color:#000000

UpdateDiagnosis_A -- update --> CD_Bronchitus
CreateDiagnosis_B -- create --> CD_Longonsteking
CreateDiagnosis_B -- create --> CDCI_Longonsteking

```

### 11. Healthprofessional creates two DD disagnoses.

```mermaid
flowchart TB

CreateDiagnosis["`Create two DD diagnosis`"]

    CD_DD1["`
            **Condition**
            (zib-ConditionAndDiagnosis)
            .id = _11CD_DD1_
            .condition-related  = #11C
            .verificationStatus = _differential_
        `"] 
    CD_DD2["`
            **Condition**
            (zib-ConditionAndDiagnosis)
            .id = _11CD_DD2_
            .condition-related  = #11C
            .verificationStatus = _differential_
        `"] 
    CDCI_DD1["`
        **ClinicalImpression**
        (zib-ConditionAndDiagnosis-ClinicalImpression)
        .id = _11CDCI_DD1_
        `"] 
    CDCI_DD2["`
        **ClinicalImpression**
        (zib-ConditionAndDiagnosis-ClinicalImpression)
        .id = _11CDCI_DD2_
        `"] 
   
    CD_DD1:::Ash
    CDCI_DD1:::Ash
    CD_DD2:::Ash
    CDCI_DD2:::Ash
    classDef Ash stroke-width:1px, stroke-dasharray:none, stroke:#999999, fill:#EEEEEE, color:#000000

CreateDiagnosis -- create --> CD_DD1
CreateDiagnosis -- create --> CDCI_DD1
CreateDiagnosis -- create --> CD_DD2
CreateDiagnosis -- create --> CDCI_DD2


```


### 12. Healthprofessional establishes an new single Diagnosis and no Symptoms are recorded (e.g. first aid).

### 13. Healthprofessional establishes an new DD disagnosis and no Symptoms are recorded (this is the first DD disagnosis).

### 14. Healthprofessional establishes an new single Diagnosis for an Condition with existing Symptoms.

### 15. Healthprofessional establishes an new DD disagnosis for an Condition with existing Symptoms (this is the first DD of senario 12).

### 16. Healthprofessional modifies an existing single Diagnosis (the anatomical location).

### 17. Healthprofessional modifies an existing single Diagnosis (the comment).

### 18. Healthprofessional modifies an existing DD disagnosis (the anatomical location) without changing the number of Diagnoses or the Diagnosis Name.

### 19. Healthprofessional modifies an existing DD disagnosis (the coment) without changing the number of Diagnoses or the Diagnosis Name.

### 20. Healthprofessional adds an DD disagnosis to an existing Diagnosis (other DD disagnoses already exist).