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

* When recording a new symptom, an instance of the zib-Symptom, zib-Symptom.Characteristics, and zib-ConditionAndDiagnosis profiles must be created/present. 
* When recording a new diagnosis, an instance is of the zib-ConditionAndDiagnosis and zib-ConditionAndDiagnosis-ClinicalImpression profiles are created.
* When modifying a symptom instance, all concepts may be updated, except for the _SymptomName_. A change to the _SymptomName_ is considered a new symptom and therefore requires a new instance of both the zib-Symptom and zib-Symptom.Characteristics profiles.
* When modifying a diagnosis instance, all concepts may be updated, except for the _DiagnosisName_. A change to the _DiagnosisName_ is considered a new diagnosis and therefore requires a new instance of both the zib-ConditionAndDiagnosis and zib-ConditionAndDiagnosis-ClinicalImpression profiles.

## Specific guidelines

* When the condition is resolved (i.e. the patient no longer experiences it), the `.clinicalStatus` is set to _inactive_ and the `.abatement[x]` is included.
* Diagnosis concepts are mapped in both zib-ConditionAndDiagnosis and zib-ConditionAndDiagnosis-ClinicalImpression profiles. However, the concepts _MethodOfConfirmation_ (NL-CM:5.6.5), _Comment_ (NL-CM:5.6.11), and _Condition_ (NL-CM:5.6.10) are mapped only in zib-ConditionAndDiagnosis. Conversely, the concepts in the _Reason_ container (NL-CM:5.6.13), _IsComplication_ (NL-CM:5.6.12), _AnatomicalLocation_ (NL-CM:5.6.9), and _DiagnosisStatus_ (NL-CM:5.6.4) are mapped only in zib-ConditionAndDiagnosis-ClinicalImpression.
* When a diagnosis is ruled out based on clinical judgment, the `.verificationStatus` is set to _refuted_. 
* When a single diagnosis is refuted and replaced by another, the `extension:condition-occurredFollowing` is included in the new zib-ConditionAndDiagnosis instance to reference the refuted diagnosis. This creates a clear, traceable sequence between the diagnosis instances.
* When two or more differential diagnoses are added, multiple zib-ConditionAndDiagnosis instances are created, one for each differential diagnosis,  as well as a single instance of zib-ConditionAndDiagnosis-ClinicalImpression. In this ClinicalImpression `.problem` references the differential diagnoses, while `.finding` includes their names (DiagnosisName). If additional differential diagnoses are added later, new zib-ConditionAndDiagnosis instances are created accordingly, and one zib-ConditionAndDiagnosis-ClinicalImpression instance is added. This new ClinicalImpression again uses `.problem` and `.finding` to reference and describe the newly added differential diagnoses.
* When a differential diagnosis is added, the `.extension:condition-related` is included in the zib-ConditionAndDiagnosis instance to reference the other related differential diagnoses. This establishes a link between them.
* When a differential diagnosis is refuted, the `.extension:condition-ruledOut` is included in the remaining differential diagnoses to indicate the refuted diagnosis.
* TODO Symptom uitsluiten en aflsuiten

## General example of clinical flow with 4 moments of recordings


```mermaid
flowchart TB
    T1(["T1"]) --> T2(["T2"]) & Symptom_Hoest["New Symptom: Hoest"]
    T2 --> T3(["T3"]) & Symptom_Rhonci["New Symptom: Rhonchi"] & Diagnosis_Bronchitis["New Diagnosis: Bronchitis"]
    T3 --> T4(["T4"]) & Symptom_Koorts["New Symptom: Koorts"]
    Symptom_Hoest -- create --> S_Hoest["**Condition**
        (zib-Symptom)
        --------------------
        Hoest"] & SC_Hoest["**Observation**
        (zib-Symptom.Characteristics)
        --------------------
        Hoest"] & CD_Bronchitis["**Condition**
        (zib-ConditionAndDiagnosis)
        --------------------"]
    Symptom_Rhonci -- create --> S_Rhonci["**Condition**
        (zib-Symptom)
        --------------------
        Rhonci"] & SC_Rhonci["**Observation**
        (zib-Symptom.Characteristics)
        --------------------
        Rhonci"]
    Symptom_Rhonci -- update --> CD_Bronchitis
    Diagnosis_Bronchitis -- create --> CDCI_Bronchitis["**Condition**
        (zib-ConditionAndDiagnosis-ClinicalImpression)
        --------------------
        Bronchitis"]
    Diagnosis_Bronchitis -- update --> CD_Bronchitis
    Symptom_Koorts -- create --> S_Koorts["**Condition**
        (zib-Symptom)
        --------------------
        Koorts"] & SC_Koorts["**Observation**
        (zib-Symptom.Characteristics)
        --------------------
        Koorts"]
    Symptom_Koorts -- update --> CD_Bronchitis
    T4 --> Diagnosis_Longontsteking["New Diagnosis: Longonsteking"]
    Diagnosis_Longontsteking -- create --> CDCI_Longonsteking["**ClinicalImpression**
        (zib-ConditionAndDiagnosis-ClinicalImpression)
        --------------------
        Longonsteking"]
    Diagnosis_Longontsteking -- create --> CD_Longonsteking["**Condition**
        (zib-ConditionAndDiagnosis)
        --------------------
        Longonsteking"]
    Diagnosis_Longontsteking -- update --> CD_Bronchitis
    CD_Bronchitis -. evidence_detail .-> S_Hoest & S_Rhonci
    CD_Longonsteking -. evidence_detail .-> S_Hoest & S_Rhonci & S_Koorts

    S_Hoest -. evidence_detail .-> SC_Hoest
    S_Rhonci -. evidence_detail .- SC_Rhonci
    CDCI_Bronchitis -. problem .- CD_Bronchitis
    CDCI_Longonsteking -. problem .-> CD_Longonsteking
    S_Koorts -. evidence_detail .- SC_Koorts

     S_Hoest:::Ash
     SC_Hoest:::Ash
     CD_Bronchitis:::Ash
     CD_Longonsteking:::Ash
     S_Rhonci:::Ash
     SC_Rhonci:::Ash
     CDCI_Bronchitis:::Ash
     CDCI_Longonsteking:::Ash
     S_Koorts:::Ash
     SC_Koorts:::Ash

    classDef Ash stroke-width:1px, stroke-dasharray:none, stroke:#999999, fill:#EEEEEE, color:#000000
```



## Technical Scenario's regarding instances

### 1. Patient has a new Symptom A

```mermaid
flowchart TB

NewSymptom_A["`New Symptom A`"]

    CD_A["`**Condition**
        (zib-ConditionAndDiagnosis)
        --------------------
        .id = _1CD_A_`"] 

    S_A["`**Condition**
        (zib-Symptom)
        --------------------
        .id = _1S_A_`"]

    SC_A["`**Observation**
        (zib-Symptom.Characteristics)
        --------------------
        .id = _1SC_A_`"]    

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
        --------------------
        .id = _2CD_B_`"] 
    S_B["`**Condition**
        (zib-Symptom)
        --------------------
        .id = _2S_B_`"]
    SC_B["`**Observation**
        (zib-Symptom.Characteristics)
        --------------------
        .id = _2SC_B_`"]

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
        --------------------
        .id = _3S_C_`"]
    SC_C["`
        **Observation**
        (zib-Symptom.Characteristics)
        --------------------
        .id = _3SC_C_
        `"]    
    CD_A["`
        **Condition**
        (zib-ConditionAndDiagnosis)
        --------------------
        .id = _1CD_A_
        .evidence.detail = _3S_C_
        `"] 
    
    S_C:::Ash
    SC_C:::Ash
    CD_A:::Ash
    classDef Ash stroke-width:1px, stroke-dasharray:none, stroke:#999999, fill:#EEEEEE, color:#000000


NewSymptom_C -- create --> S_C
NewSymptom_C -- create --> SC_C
NewSymptom_C -- update --> CD_A
```

### 4. Healthprofessional adds new recording/observation of an existing Symptom C.
```mermaid
flowchart TB

NewSymptom_C["`New recording of existing Symptom C`"]

    S_C["`**Condition**
        (zib-Symptom)
        --------------------
        .id = _3S_C_
        .evidence.detail = _4SC_C_`"]
    SC_C["`
        **Observation**
        (zib-Symptom.Characteristics)
        --------------------
        .id = _4SC_C_
        `"]     
    
    S_C:::Ash
    SC_C:::Ash
    classDef Ash stroke-width:1px, stroke-dasharray:none, stroke:#999999, fill:#EEEEEE, color:#000000

NewSymptom_C -- update --> S_C
NewSymptom_C -- create --> SC_C
```


### 5. Healthprofessional updates the anatomical location of symptom A
```mermaid
flowchart TB

UpdateSymptom_A["`Update Symptom A`"]
    S_A["`**Condition**
        (zib-Symptom)
        --------------------
        .id = _5S_A_
        .bodySite = [Anatomical location]`"]
  
    S_A:::Ash
    classDef Ash stroke-width:1px, stroke-dasharray:none, stroke:#999999, fill:#EEEEEE, color:#000000

UpdateSymptom_A -- update --> S_A
```

### 6. Symptom A has resolved and patient gets a new Symptom D for Condition A 

```mermaid
flowchart TB

CloseSymptom_A["`Close Symptom A`"]
NewSymptom_D["`New Symptom D related to Condition A`"]

CloseSymptom_A -.-> NewSymptom_D

    S_A["`**Condition**
        (zib-Symptom)
        --------------------
        .id = _6S_A_
        .clinicalStatus = _inactive_|_resolved_
        .abatement[x] = [past date]`"]    

    CD_A["`**Condition**
        (zib-ConditionAndDiagnosis)
        --------------------
        .id = _1CD_A_
        .evidence.detail = _6S_D_`"] 

    S_D["`**Condition**
        (zib-Symptom)
        --------------------
        .id = _6S_D_`"]
    SC_D["`**Observation**
        (zib-Symptom.Characteristics)
        --------------------
        .id = _6SC_D_`"]    

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

### 7. Symptom A has resolved and there is a new Diagnosis B for Condition A 

```mermaid
flowchart TB

CloseSymptom_A["`Close Symptom A`"]
NewDiagnosis_B["`New Diagnosis B related to Condition A`"]

CloseSymptom_A -.-> NewDiagnosis_B

    S_A["`**Condition**
        (zib-Symptom)
        --------------------
        .id = _7S_A_
        .clinicalStatus = _inactive_|_resolved_
        .abatement[x] = [past date]`"]    

CD_A["`**Condition**
        (zib-ConditionAndDiagnosis)
        --------------------
        .id = _7CD_A_
        .verificationStatus = _refuted_`"]

    CD_B["`**Condition**
        (zib-ConditionAndDiagnosis)
        --------------------
        .id = _7CD_B_
        .extension:occuredFollowing = _7CD_A_`"] 
    CDCI_B["`**ClinicalImpression**
        (zib-ConditionAndDiagnosis-ClinicalImpression)
        --------------------
        .id = _7CDCI_B_`"] 

    S_A:::Ash
    CD_A:::Ash
    CD_B:::Ash
    CDCI_B:::Ash
    classDef Ash stroke-width:1px, stroke-dasharray:none, stroke:#999999, fill:#EEEEEE, color:#000000

CloseSymptom_A -- update --> S_A
NewDiagnosis_B -- update --> CD_A
NewDiagnosis_B -- create --> CD_B
NewDiagnosis_B -- create --> CDCI_B
```

### 8. Symptom A has resolved along with the related condition A?

```mermaid
flowchart TB

UpdateSymptom_A["`Update Symptom A`"]
UpdateDiagnosis_B["`Update Condition A`"]

UpdateSymptom_A -.-> UpdateDiagnosis_B

    S_A["`
        **Condition**
        (zib-Symptom)
        --------------------
        .id = _8S_A_
        .clinicalStatus = _inactive_|_resolved_
        .abatement[x] = [past date]
        `"]    

    CD_B["`
        **Condition**
        (zib-ConditionAndDiagnosis)
        --------------------
        .id = _8CD_A_
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

### 9. Healthprofessional rules out Symptom B for Condition A?

```mermaid
flowchart TB

UpdateSymptom_A["`Update Symptom B`"]

    S_A["`
        **Condition**
        (zib-Symptom)
        .id = _9S_A_
        .verificationStatus = _refuted_
        `"]    
   
    S_A:::Ash

    classDef Ash stroke-width:1px, stroke-dasharray:none, stroke:#999999, fill:#EEEEEE, color:#000000

UpdateSymptom_A -- update --> S_A

```

### 10. Healthprofessional modifies a single diagnosis 'Bronchitus' to a Pneumonia

```mermaid
flowchart TB

UpdateDiagnosis_A["`Update Bronchitus diagnosis`"]
CreateDiagnosis_B["`Create Pneumonia diagnosis`"]

UpdateDiagnosis_A -.-> CreateDiagnosis_B

    CD_Bronchitus["`
            **Condition**
            (zib-ConditionAndDiagnosis)
            --------------------
            .id = _10CD_Bronchitus_
            .verificationStatus = _refuted_
        `"] 
    CD_Pneumonia["`
            **Condition**
            (zib-ConditionAndDiagnosis)
            --------------------
            .id = _10CD_Pneumonia_
            .condition-occuredFollowing = _10CD_Bronchitus_
        `"] 
    CDCI_Pneumonia["`
        **ClinicalImpression**
        (zib-ConditionAndDiagnosis-ClinicalImpression)
        --------------------
        .id = _10CDCI_Pneumonia_
        `"] 
   
    CD_Bronchitus:::Ash
    CD_Pneumonia:::Ash
    CDCI_Pneumonia:::Ash
    classDef Ash stroke-width:1px, stroke-dasharray:none, stroke:#999999, fill:#EEEEEE, color:#000000

UpdateDiagnosis_A -- update --> CD_Bronchitus
CreateDiagnosis_B -- create --> CD_Pneumonia
CreateDiagnosis_B -- create --> CDCI_Pneumonia

```

### 11. Healthprofessional ruled out the DD Bronchitus and made from the DD Pneumonia the diagnosis.

```mermaid
flowchart TB

UpdateDiagnosis_A["`Update Bronchitus diagnosis`"]
UpdateDiagnosis_B["`Update Pneumonia diagnosis`"]

UpdateDiagnosis_A -.-> UpdateDiagnosis_B

    CD_Bronchitus["`
            **Condition**
            (zib-ConditionAndDiagnosis)
            --------------------
            .id = _11CD_Bronchitus_
            .verificationStatus = _refuted_
        `"] 
    CD_Pneumonia["`
            **Condition**
            (zib-ConditionAndDiagnosis)
            --------------------
            .id = _11CD_Pneumonia_
            .condition-ruledOut = _11CD_Bronchitus_
            .verificationStatus = _confirmed_
        `"] 
   
    CD_Bronchitus:::Ash
    CD_Pneumonia:::Ash
    classDef Ash stroke-width:1px, stroke-dasharray:none, stroke:#999999, fill:#EEEEEE, color:#000000

UpdateDiagnosis_A -- update --> CD_Bronchitus
UpdateDiagnosis_B -- update --> CD_Pneumonia

```

### 12. Healthprofessional creates two differential disagnoses.

```mermaid
flowchart TB

CreateDiagnosis["`Create two differential diagnosis`"]

    CD_DD1["`
            **Condition**
            (zib-ConditionAndDiagnosis)
            --------------------
            .id = _12CD_DD1_
            .condition-related  = _12CD_DD2_
            .verificationStatus = _differential_
        `"] 
    CD_DD2["`
            **Condition**
            (zib-ConditionAndDiagnosis)
            --------------------
            .id = _12CD_DD2_
            .condition-related  = _12CD_DD1_
            .verificationStatus = _differential_
        `"] 
    CDCI_DD1["`
        **ClinicalImpression**
        (zib-ConditionAndDiagnosis-ClinicalImpression)
        --------------------
        .id = _12CDCI_DD1_
        .problem = _12CD_DD1_
        .problem = _12CD_DD2_
        .finding = Bronchitus
        .finding = Pneumonia
        `"] 

    CD_DD1:::Ash
    CDCI_DD1:::Ash
    CD_DD2:::Ash
    classDef Ash stroke-width:1px, stroke-dasharray:none, stroke:#999999, fill:#EEEEEE, color:#000000

CreateDiagnosis -- create --> CDCI_DD1
CreateDiagnosis -- create --> CD_DD1
CreateDiagnosis -- create --> CD_DD2
```

### 13. Healthprofessional establishes a new single Diagnosis A and no Symptoms are recorded (there are no previous diagnoses).

```mermaid
flowchart TB

CreateDiagnosis["`Create new single diagnosis`"]

    CD_A["`
            **Condition**
            (zib-ConditionAndDiagnosis)
            --------------------
            .id = _13CD_A_
        `"] 
    CDCI_A["`
        **ClinicalImpression**
        (zib-ConditionAndDiagnosis-ClinicalImpression)
        --------------------
        .id = _13CDCI_A_
        `"] 

   
    CD_A:::Ash
    CDCI_A:::Ash
    classDef Ash stroke-width:1px, stroke-dasharray:none, stroke:#999999, fill:#EEEEEE, color:#000000

CreateDiagnosis -- create --> CD_A
CreateDiagnosis -- create --> CDCI_A
```

### 14. Healthprofessional establishes a new DD E and no Symptoms are recorded (there are no related DD).

```mermaid
flowchart TB

CreateDiagnosis["`Create new differential diagnosis`"]

    CD_E["`
            **Condition**
            (zib-ConditionAndDiagnosis)
            --------------------
            .id = _14CD_E_
            .verificationStatus = _differential_ 
        `"] 
    CDCI_E["`
            **ClinicalImpression**
            (zib-ConditionAndDiagnosis-ClinicalImpression)
            --------------------
            .id = _14CDCI_E_
        `"] 

   
    CD_E:::Ash
    CDCI_E:::Ash
    classDef Ash stroke-width:1px, stroke-dasharray:none, stroke:#999999, fill:#EEEEEE, color:#000000

CreateDiagnosis -- create --> CD_E
CreateDiagnosis -- create --> CDCI_E
```

### 15. Healthprofessional establishes a new single Diagnosis for a Condition with existing Symptoms.

TODO

### 16. Healthprofessional establishes a new DD  diagnosis for a Condition with existing Symptoms (this is the first DD of senario 12).

### 17. Healthprofessional modifies a existing single Diagnosis (the anatomical location).

### 18. Healthprofessional modifies a existing single Diagnosis (the comment).

### 19. Healthprofessional modifies a existing DD  diagnosis (the anatomical location) without changing the number of Diagnoses or the Diagnosis Name.

### 20. Healthprofessional modifies a existing DD  diagnosis (the coment) without changing the number of Diagnoses or the Diagnosis Name.

### 21. Healthprofessional adds a DD  diagnosis to a existing Diagnosis (other DD disagnoses already exist).


### 23. Scneario's of Astrid (pp)

