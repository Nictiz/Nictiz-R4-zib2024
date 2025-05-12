# Condition, Diagnosis, and Symptom

This document outlines the FHIR mapping strategy for the Dutch Zorginformatiebouwstenen (zib) concerning Condition, Diagnosis, and Symptom. These concepts are closely related and require a structured approach in FHIR to capture both their persistent nature and point-in-time assessments accurately.

We utilize four distinct FHIR profiles based on the Condition, ClinicalImpression, and Observation resources to represent this information, separating the core record of a condition, diagnosis, or symptom from specific temporal recordings or assessments.

## FHIR profiles

* zib-ConditionAndDiagnosis (based on Condition): Represents the core, enduring record of a patient's diagnosed condition or health problem. It consolidates long-term information from both the Condition and Diagnosis zibs.
* zib-ConditionAndDiagnosis-ClinicalImpression (based on ClinicalImpression): Captures the clinical assessment or impression related to a Condition/Diagnosis at a specific point in time. 
* zib-Symptom (based on Condition): Represents the core record of a symptom, particularly when it's persistent or requires tracking as a distinct entity over time.
* zib-Symptom.Characteristics (based on Observation): Records specific, point-in-time details, characteristics, or status updates about a symptom.

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

```

## General rules

* When recording a new symptom, always an instance is created of the zib-ConditionAndDiagnosis, zib-Symptom and zib-Symptom.Characteristics profiles. 
* Subsequent recordings about the this symptom can be tracked added using zib-Symptom.Characteristics or by updating the zib-Symptom instance.





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

UpdateSymptom_A -- update --> CD_A
UpdateSymptom_A -- update --> S_A
```

### 5. Symptom A is finished and new Symptom D for Condition A 

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

CloseSymptom_A -- update --> S_A
NewSymptom_D -- create --> S_D
NewSymptom_D -- update --> SC_D
NewSymptom_D -- update --> CD_A

```

### 6. Symptom A is closed and there is new Diagnosis B for the Condition A


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
        TODO - reference to Condition A -- extension?`"] 
    CDCI_B["`**ClinicalImpression**
        (zib-ConditionAndDiagnosis-ClinicalImpression)
        .id = _6CDCIB_`"] 

CloseSymptom_A -- update --> S_A
NewDiagnosis_B -- create --> CD_B
NewDiagnosis_B -- create --> CDCI_B

```


### 7. Existins symptom A and related condition A are closed 
