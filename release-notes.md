##Admission (zib-Admission, nl-core-Admission)
*New profile of zib Admission on StructureDefinition Encounter.
* `.status` ; Added mapping of StartDateTime and EndDateTime ; ZIB-1104
* `.serviceType` ; mapping ; Added mapping of CareType ; ZIB-1104
* `.participant:responsibleHealthProfessional.individual` ; mapping ; Added mapping of ResponsibleHealthProfessional::HealthProfessional ; ZIB-1104
* `.period.start` ; mapping ; Added mapping of StartDateTime ; ZIB-1104
* `.period.end` ; mapping ; Added mapping of EndDateTime ; ZIB-1104
* `.reasonCode`; mapping ; Added mapping of TriggerForAdmission ; ZIB-1104

* `.reasonCode.text` ; mapping ; Added mapping of CommentAdmissionReason ; ZIB-1104
* `.reasonCode.extension:commentAdmissionReason` ; mapping ; Added mapping of CommentAdmissionReason ; ZIB-1104

* `.reasonReference`; mapping ; Added mapping of Problem ; ZIB-1104
* `.hospitalization.admitSource` ; mapping ; Added mapping of Origin ; ZIB-1104
* `.hospitalization.dischargeDisposition` ; Added mapping of Destination ; ZIB-1104
* `.extension:AdmissionScope` ; Added mapping of AdmissionScope ; ZIB-1104
* `.location.location` ; mapping ; Added mapping of CareFacility::HealthcareProvider ; ZIB-1104

