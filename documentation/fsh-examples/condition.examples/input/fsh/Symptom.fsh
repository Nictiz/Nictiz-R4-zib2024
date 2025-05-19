// T1 HOEST
Instance: nl-core-Symptom-HoestT1
InstanceOf: Condition
Usage: #example
* meta.profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-Symptom"
* extension[+].url = "http://nictiz.nl/fhir/StructureDefinition/ext-Condition.StatusDate"
* extension[=].valueDateTime = "2023-03-01"
* extension[+].url = "http://nictiz.nl/fhir/StructureDefinition/ext-Symptom.PeriodDuration"
* extension[=].valueQuantity.value = 7
* extension[=].valueQuantity.unit = "dagen"
* category = $sct#162408000 "Algemene symptoombeschrijving"
* code = $sct#49727002 "Cough (finding)"
* code.text = "Droge hoest"
* bodySite = $sct#89187006 "Airway structure (body structure)"
* onsetDateTime = "2023-02-22"
* subject = Reference(Patient/nl-core-Patient-alt-1) "Patient, Peter Jan (PeJe) Jansen"
* subject.type = "Patient"
* asserter = Reference(PractitionerRole/nl-core-HealthProfessional-PractitionerRole-zib-1) "Health professional (role), J.H.R. Peters, Neuroloog"
* asserter.type = "PractitionerRole"
* evidence[0].detail[0] = Reference(Observation/nl-core-Symptom.Characteristics-HoestT1) "Symptom characteristics - Hoest1"
* note[0].text = "Dit is het toelichtings veld van de zib."


Instance: nl-core-Symptom.Characteristics-HoestT1
InstanceOf: Observation
Usage: #example
* meta.profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-Symptom.Characteristics"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#exam "Exam"
* code = $sct#162408000 "Algemene symptoombeschrijving"
* valueCodeableConcept = $sct#49727002 "Cough (finding)"
* valueCodeableConcept.text = "Droge hoest"
* subject = Reference(Patient/nl-core-Patient-alt-1) "Patient, Peter Jan (PeJe) Jansen"
* subject.type = "Patient"
* effectiveDateTime = "2023-03-01"
* component[+].code = $sct#TODO "onset"
* component[=].valueCodeableConcept = $sct#61751001 "Gradual onset (qualifier value)"
* component[+].code = $sct#288524001 "Courses (qualifier value)"
* component[=].valueCodeableConcept = $sct#26593000 "Paroxysmal (qualifier value)"
// symptomCourse - there is no definition code for this concept and is in the next observation
* component[+].code = $sct#246112005 "Severity (attribute)"
* component[=].valueCodeableConcept = $sct#255604002 "Mild (qualifier value)"
* component[+].code = $sct#162442009 "Time symptom lasts (observable entity)"
* component[=].valueRange.low.value = 30
* component[=].valueRange.low.unit = "min"
* component[=].valueRange.high.value = 90
* component[=].valueRange.high.unit = "min"
* component[+].code = $sct#TODO "InfluencingFactors"
* component[=].valueString = "Neemt toe bij beweging en neemt af in rust."

// T2 RHONCHI
Instance: nl-core-Symptom-RhonchiT2
InstanceOf: Condition
Usage: #example
* meta.profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-Symptom"
* extension[+].url = "http://nictiz.nl/fhir/StructureDefinition/ext-Condition.StatusDate"
* extension[=].valueDateTime = "2023-03-05"
* category = $sct#162408000 "Algemene symptoombeschrijving"
* code = $sct#9763007 "expiratoire piepende ademhaling (bevinding)"
* bodySite = $sct#89187006 "Airway structure (body structure)"
* onsetDateTime = "2023-03-01"
* subject = Reference(Patient/nl-core-Patient-alt-1) "Patient, Peter Jan (PeJe) Jansen"
* evidence[0].detail[0] = Reference(Observation/nl-core-Symptom.Characteristics-RhonchiT2) "Symptom characteristics - RhonchiT2"


Instance: nl-core-Symptom.Characteristics-RhonchiT2
InstanceOf: Observation
Usage: #example
* meta.profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-Symptom.Characteristics"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#exam "Exam"
* code = $sct#162408000 "Algemene symptoombeschrijving"
* valueCodeableConcept = $sct#9763007 "expiratoire piepende ademhaling (bevinding)"
* subject = Reference(Patient/nl-core-Patient-alt-1) "Patient, Peter Jan (PeJe) Jansen"
* effectiveDateTime = "2023-03-01"
* component[+].code = $sct#246112005 "Severity (attribute)"
* component[=].valueCodeableConcept = $sct#255604002 "Mild (qualifier value)"

// T3 KOORTS
Instance: nl-core-Symptom-KoortsT3
InstanceOf: Condition
Usage: #example
* meta.profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-Symptom"
* extension[+].url = "http://nictiz.nl/fhir/StructureDefinition/ext-Condition.StatusDate"
* extension[=].valueDateTime = "2023-03-06"
* category = $sct#386661006 "Algemene symptoombeschrijving"
* code = $sct#9763007 "Fever (finding)"
* onsetDateTime = "2023-03-05"
* subject = Reference(Patient/nl-core-Patient-alt-1) "Patient, Peter Jan (PeJe) Jansen"
* evidence[0].detail[0] = Reference(Observation/nl-core-Symptom.Characteristics-KoortsT3) "Symptom characteristics - KoortsT3"

Instance: nl-core-Symptom.Characteristics-KoortsT3
InstanceOf: Observation
Usage: #example
* meta.profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-Symptom.Characteristics"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#exam "Exam"
* code = $sct#162408000 "Algemene symptoombeschrijving"
* valueCodeableConcept = $sct#9763007 "Fever (finding)"
* subject = Reference(Patient/nl-core-Patient-alt-1) "Patient, Peter Jan (PeJe) Jansen"
* effectiveDateTime = "2023-03-05"
* component[+].code = $sct#246112005 "Severity (attribute)"
* component[=].valueCodeableConcept = $sct#255604002 "Mild (qualifier value)"




// HOEST T2
// Need to update this Condition T1 to T2
Instance: nl-core-Symptom-HoestT2
InstanceOf: Condition
Usage: #example
* meta.profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-Symptom"
* extension[+].url = "http://nictiz.nl/fhir/StructureDefinition/ext-Condition.StatusDate"
* extension[=].valueDateTime = "2023-03-05"
* extension[+].url = "http://nictiz.nl/fhir/StructureDefinition/ext-Symptom.PeriodDuration"
* extension[=].valueQuantity.value = 11
* extension[=].valueQuantity.unit = "dagen"
* category = $sct#162408000 "Algemene symptoombeschrijving"
* code = $sct#49727002 "Cough (finding)"
* code.text = "Droge hoest"
* bodySite = $sct#89187006 "Airway structure (body structure)"
* onsetDateTime = "2023-02-22"
* subject = Reference(Patient/nl-core-Patient-alt-1) "Patient, Peter Jan (PeJe) Jansen"
* subject.type = "Patient"
* asserter = Reference(PractitionerRole/nl-core-HealthProfessional-PractitionerRole-zib-1) "Health professional (role), J.H.R. Peters, Neuroloog"
* asserter.type = "PractitionerRole"
* evidence[0].detail[0] = Reference(Observation/nl-core-Symptom.Characteristics-HoestT1) "Symptom characteristics - Hoest1"
* evidence[1].detail[0] = Reference(Observation/nl-core-Symptom.Characteristics-HoestT2) "Symptom characteristics - Hoest2"
* note[0].text = "Dit is het toelichtings veld van de zib."


Instance: nl-core-Symptom.Characteristics-HoestT2
InstanceOf: Observation
Usage: #example
* meta.profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-Symptom.Characteristics"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#exam "Exam"
* code = $sct#162408000 "Algemene symptoombeschrijving"
* valueCodeableConcept = $sct#49727002 "Cough (finding)"
* valueCodeableConcept.text = "Productieve hoest"
* subject = Reference(Patient/nl-core-Patient-alt-1) "Patient, Peter Jan (PeJe) Jansen"
* subject.type = "Patient"
* effectiveDateTime = "2023-05-01"
* component[+].code = $sct#288524001 "Courses (qualifier value)"
* component[=].valueCodeableConcept = $sct#26593000 "Paroxysmal (qualifier value)"
* component[+].code = $sct#TODO "SymptomCourse"
* component[=].valueCodeableConcept = $sct#231877006 "Worse (qualifier value)"
* component[+].code = $sct#246112005 "Severity (attribute)"
* component[=].valueCodeableConcept = $sct#6736007 "Moderate severity (qualifier value)"

