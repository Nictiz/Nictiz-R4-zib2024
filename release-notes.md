##Encounter (zib-Encounter, nl-core-Encounter)
* Zib Encounter has been refined and several concepts have been moved to the new zib Admission ; ZIB-1545, ZIB-1104
*`.status` ; textual ; Refined guidance for DateTime 
*`.class` ; textual ; Renamed from ContactType to EncounterType ; ZIB-1428
*`.class` ; terminology ; Changed codes in EncounterTypeCodelist ; ZIB-1906
*`.type` ; mapping; Added mapping of EncounterSetting 
*`.participant:responsibleHealthProfessional.individual` ; slicing ; Added ResponsableHealthProfessional to a slice 
*`.period.start` ; textual ; Renamed from StartDateTime to DateTime 
*`.period.end` ; mapping ; Removed mapping of EndDateTime 
*`.reasonCode` ; mapping ; Added mapping of Reason 
*`.reasonCode:deviatingResult` ; mapping ; Removed mapping of DeviatingResult
*`.reasonCode.extension:commentEncounterReason` ; mapping ; Moved mapping of CommentEncounterReason from `.reasonCode:deviatingResult.extension:commentEncounterReason` 
*`.reasonReference:procedure` ; mapping ; Removed mapping of Procedure 
*`.hospitalization.admitSource` ; mapping ; Removed mapping of Origin 
*`.hospitalization.dischargeDisposition` ; mapping ; Removed mapping of Destination 