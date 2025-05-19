Alias: $sct = http://snomed.info/sct

// T2 Bronchitis
Instance: nl-core-ConditionAndDiagnosis-BronchitisT2
InstanceOf: Condition
Usage: #example
* meta.profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-ConditionAndDiagnosis"
* extension[0].url = "http://nictiz.nl/fhir/StructureDefinition/ext-Condition.StatusDate"
* extension[=].valueDateTime = "2023-03-01"
* severity = $sct#255604002 "Licht"
* code = $sct#32398004 "Bronchitis (disorder)"
* subject = Reference(Patient/nl-core-Patient-alt-1) "Patient, Peter Jan (PeJe) Jansen"
* subject.type = "Patient"
* asserter = Reference(PractitionerRole/nl-core-HealthProfessional-PractitionerRole-zib-1) "Health professional (role), J.H.R. Peters, Neuroloog"
* asserter.type = "PractitionerRole"

Instance: nl-core-ConditionAndDiagnosis-ClinicalImpression-BronchitisT2
InstanceOf: ClinicalImpression
Usage: #example
* meta.profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-ConditionAndDiagnosis-ClinicalImpression"
* status = #completed
* subject = Reference(Patient/nl-core-Patient-alt-1) "Patient, Peter Jan (PeJe) Jansen"
* subject.type = "Patient"
* effectiveDateTime = "2023-03-01"
* assessor = Reference(PractitionerRole/nl-core-HealthProfessional-PractitionerRole-zib-1) "Health professional (role), J.H.R. Peters, Neuroloog"
* assessor.type = "PractitionerRole"
* investigation.code = $sct#63332003 "Anamnese en lichamelijk onderzoek"
* finding.itemCodeableConcept = $sct#32398004 "Bronchitis (disorder)"
* prognosisCodeableConcept = $sct#415684004 "Vermoedelijk"

// T4 Longonsteking
Instance: nl-core-ConditionAndDiagnosis-LongonstekingT4
InstanceOf: Condition
Usage: #example
* meta.profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-ConditionAndDiagnosis"
* extension[0].url = "http://nictiz.nl/fhir/StructureDefinition/ext-Condition.StatusDate"
* extension[=].valueDateTime = "2023-03-05"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/condition-diseaseCourse"
* extension[=].valueCodeableConcept = $sct#231877006 "Verslechterd"
* severity = $sct#6736007 "Matig"
* code = $sct#205237003 "Pneumonitis (disorder)"
* bodySite.extension.url = "http://hl7.org/fhir/StructureDefinition/bodySite"
* bodySite.extension.valueReference = Reference(BodyStructure/nl-core-ConditionAndDiagnosis-zib-2-AnatomicalLocation-1) "Anatomical location, Structure of parenchyma of lung (body structure), Links"
* bodySite.extension.valueReference.type = "BodyStructure"
* bodySite = $sct#113255004 "Structure of parenchyma of lung (body structure)"
* subject = Reference(Patient/nl-core-Patient-alt-1) "Patient, Peter Jan (PeJe) Jansen"
* subject.type = "Patient"
* asserter = Reference(PractitionerRole/nl-core-HealthProfessional-PractitionerRole-zib-1) "Health professional (role), J.H.R. Peters, Neuroloog"
* asserter.type = "PractitionerRole"

Instance: nl-core-ConditionAndDiagnosis-ClinicalImpression-LongonstekingT4
InstanceOf: ClinicalImpression
Usage: #example
* meta.profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-ConditionAndDiagnosis-ClinicalImpression"
* status = #completed
* subject = Reference(Patient/nl-core-Patient-alt-1) "Patient, Peter Jan (PeJe) Jansen"
* subject.type = "Patient"
* effectiveDateTime = "2023-03-05"
* assessor = Reference(PractitionerRole/nl-core-HealthProfessional-PractitionerRole-zib-1) "Health professional (role), J.H.R. Peters, Neuroloog"
* assessor.type = "PractitionerRole"
* investigation.code = $sct#63332003 "Anamnese en lichamelijk onderzoek"
* finding.itemCodeableConcept = $sct#32398004 "Bronchitis (disorder)"
* prognosisCodeableConcept = $sct#415684004 "Vermoedelijk"