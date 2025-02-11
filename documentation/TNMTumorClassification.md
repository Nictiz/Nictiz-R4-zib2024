# TNMTumorClassification

Several concepts of zib TNMTumorClassification are represented using distinct Observation resources. These are grouped using the current resource and are referenced on `Observation.hasMember` as shown in the diagram below.


```mermaid
---
title: zib TNMTumorClassification in FHIR
---
classDiagram
    class TNMTumorClassification {
        + code = SCT#399390009
        + DateOfTNMClassification
        + IntegratedTNMValue
        + Explanation
        + TNMVersion
    }
    class AnatomicalStage {
        + code = SCT#399390009 !!
        + AnatomicalStage
    }
    class DistantMetastasis_AnatomicalLocation {
        + code = SCT#385421009
        + AnatomicalLocation
    }
    class DistantMetastasis {
        + code = SCT#27708005
        + M_DistantMetastasis
    }
    class L_LymphaticInvasion {
        + code = SCT#395715009
        + L_LymphaticInvasion
    }
    class Pn_PerineuralInvasion {
        + code = SCT#371513001
        + Pn_PerineuralInvasion
    }
    class PrimaryTumor_Abnormality_G_HistopathologicalGrade {
        + code = SCT#371469007
        + G_HistopathologicalGrading
    }
    class PrimaryTumor_Abnormality_AnatomicalLocation {
        + BodyStructure
        + AnatomicalLocation
        + Morphology
    }
    class PrimaryTumor_Abnormality {
        + code = SCT#372087000
        + IsPrimaryTumor
        + AbnormalityNumber
    }
    class PrimaryTumor_m_NumberOfPrimaryTumors {
        + code = SCT#133641000146103
        + m_NumberOfPrimaryTumors
    }
    class PrimaryTumor {
        + code = SCT#78873005
        + T_PrimaireTumor
    }
    class PrognosticStage {
        + code = SCT#399390009 !!
        + PrognosticStage
    }
    class R_ResidualTumor {
        + code = SCT#17964000
        + R_ResidualTumor
    }
    class RegionalLymphnodes {
        + code = SCT#301855007
        + N_RegionalLymphnodes
    }
    class RegionalLymphnodes_AnatomicalLocation {
        + code = SCT#397440000
        + AnatomicalLocation
        + Location
    }
    class V_VenousInvasion {
        + code = SCT#371493002
        + V_VenousInvasion
    }

    TNMTumorClassification --> DistantMetastasis : ".hasMember"
    TNMTumorClassification --> RegionalLymphnodes : ".hasMember"
    TNMTumorClassification --> PrimaryTumor : ".hasMember"
    TNMTumorClassification --> L_LymphaticInvasion : ".hasMember"
    TNMTumorClassification --> Pn_PerineuralInvasion : ".hasMember"
    TNMTumorClassification --> V_VenousInvasion : ".hasMember"
    TNMTumorClassification --> AnatomicalStage : ".hasMember"
    TNMTumorClassification --> PrognosticStage : ".hasMember"
    TNMTumorClassification --> R_ResidualTumor : ".hasMember"

    DistantMetastasis --> DistantMetastasis_AnatomicalLocation : ".hasMember"
    RegionalLymphnodes --> RegionalLymphnodes_AnatomicalLocation : ".hasMember"
    PrimaryTumor --> PrimaryTumor_Abnormality : ".hasMember"
    PrimaryTumor --> PrimaryTumor_m_NumberOfPrimaryTumors : ".hasMember"
    PrimaryTumor_Abnormality --> PrimaryTumor_Abnormality_AnatomicalLocation : ".bodysite.extension.bodyStructure"
    PrimaryTumor_Abnormality --> PrimaryTumor_Abnormality_G_HistopathologicalGrade : ".hasMember"
```


