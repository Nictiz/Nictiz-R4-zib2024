# TNMTumorClassification

Several concepts of zib TNMTumorClassification are represented using distinct Observation resources. These are grouped using the current resource and are referenced on `Observation.hasMember` as shown in the diagram below.


```mermaid
---
title: zib TNMTumorClassification in FHIR
---
classDiagram
    class TNMTumorClassification ~Observation~ {
        + code = SCT#399390009
        + DateOfTNMClassification
        + IntegratedTNMValue
        + Explanation
        + TNMVersion
    }
    class AnatomicalStage ~Observation~ {
        + code = SCT#399390009 !!
        + AnatomicalStage
    }
    class DistantMetastasis_AnatomicalLocation ~Observation~ {
        + code = SCT#385421009
        + AnatomicalLocation
    }
    class DistantMetastasis ~Observation~ {
        + code = SCT#27708005
        + M_DistantMetastasis
    }
    class L_LymphaticInvasion ~Observation~ {
        + code = SCT#395715009
        + L_LymphaticInvasion
    }
    class Pn_PerineuralInvasion ~Observation~ {
        + code = SCT#371513001
        + Pn_PerineuralInvasion
    }
    class PrimaryTumor_Abnormality_AnatomicalLocation ~BodyStructure~ {
        + BodyStructure
        + AnatomicalLocation
        + Morphology
    }
    class PrimaryTumor_Abnormality ~Observation~ {
        + code = SCT#372087000
        + IsPrimaryTumor
        + AbnormalityNumber
        + G_HistopathologicalGrading
    }
    class PrimaryTumor_m_NumberOfPrimaryTumors ~Observation~ {
        + code = SCT#133641000146103
        + m_NumberOfPrimaryTumors
    }
    class PrimaryTumor ~Observation~ {
        + code = SCT#78873005
        + T_PrimaireTumor
    }
    class PrognosticStage ~Observation~ {
        + code = SCT#399390009 !!
        + PrognosticStage
    }
    class R_ResidualTumor ~Observation~ {
        + code = SCT#17964000
        + R_ResidualTumor
    }
    class RegionalLymphnodes ~Observation~ {
        + code = SCT#301855007
        + N_RegionalLymphnodes
    }
    class RegionalLymphnodes_AnatomicalLocation ~Observation~ {
        + code = SCT#397440000
        + AnatomicalLocation
        + Location
    }
    class V_VenousInvasion ~Observation~ {
        + code = SCT#371493002
        + V_VenousInvasion
    }

    TNMTumorClassification --> DistantMetastasis : .hasMember
    TNMTumorClassification --> RegionalLymphnodes : .hasMember
    TNMTumorClassification --> PrimaryTumor : .hasMember
    TNMTumorClassification --> L_LymphaticInvasion : .hasMember
    TNMTumorClassification --> Pn_PerineuralInvasion : .hasMember
    TNMTumorClassification --> V_VenousInvasion : .hasMember
    TNMTumorClassification --> AnatomicalStage : .hasMember
    TNMTumorClassification --> PrognosticStage : .hasMember
    TNMTumorClassification --> R_ResidualTumor : .hasMember

    DistantMetastasis --> DistantMetastasis_AnatomicalLocation : .hasMember
    RegionalLymphnodes --> RegionalLymphnodes_AnatomicalLocation : .hasMember
    PrimaryTumor --> PrimaryTumor_Abnormality : .hasMember
    PrimaryTumor --> PrimaryTumor_m_NumberOfPrimaryTumors : .hasMember
    PrimaryTumor_Abnormality --> PrimaryTumor_Abnormality_AnatomicalLocation : .bodysite.extension.bodyStructure
```


