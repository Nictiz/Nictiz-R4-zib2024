##Encounter (zib-Encounter, nl-core-Encounter)
* Zib Encounter has been refined and several concepts have been moved to the new zib Admission ; ZIB-1545, ZIB-1104
*`.status` ; textual ; Refined guidance for DateTime ; ZIB-1545, ZIB-1104
*`.class` ; textual ; Renamed from ContactType to EncounterType ; ZIB-1428
*`.class` ; terminology ; Changed codes in EncounterTypeCodelist ; ZIB-1906
*`.type` ; mapping; Added mapping of EncounterSetting ; ZIB-1545, ZIB-1104
*`.participant:responsibleHealthProfessional.individual` ; slicing ; Added ResponsableHealthProfessional to a slice ; ZIB-1545, ZIB-1104
*`.period.start` ; textual ; Renamed from StartDateTime to DateTime ; ZIB-1545, ZIB-1104
*`.period.end` ; mapping ; Removed mapping of EndDateTime ; ZIB-1545, ZIB-1104
*`.reasonCode` ; mapping ; Added mapping of Reason ; ZIB-1545, ZIB-1104
*`.reasonCode:deviatingResult` ; mapping ; Removed mapping of DeviatingResult ; ZIB-1545, ZIB-1104
*`.reasonCode.extension:commentEncounterReason` ; mapping ; Moved mapping of CommentEncounterReason from `.reasonCode:deviatingResult.ZIB-1104extension:commentEncounterReason` ; ZIB-1545, ZIB-1104
*`.reasonReference:procedure` ; mapping ; Removed mapping of Procedure ; ZIB-1545, ZIB-1104
*`.hospitalization.admitSource` ; mapping ; Removed mapping of Origin ; ZIB-1545, ZIB-1104
*`.hospitalization.dischargeDisposition` ; mapping ; Removed mapping of Destination ; ZIB-1545, ZIB-1104, ZIB-1824