Profile: ILHDPEncounterCommunityHMOAmbulatory
Parent: ILCoreEncounter
Id: il-hdp-encounter-community-hmo-ambulatory
Title: "ILHDP Encounter Community/HMO Ambulatory Profile"
Description: "Encounter for care delivered in the community/HMO setting or for hospital ambulatory visits that do not involve admission. The encounter is typically self-contained. It MAY be linked to other encounters via EpisodeOfCare to represent a series of visits for chronic care (e.g., dialysis) or other relationships (e.g., a nurse ECG performed following a physician visit in the same HMO appointment). It SHALL NOT use partOf to link to other encounters. Duration is expected to be short (minutes to hours); the exact start or end time MAY be unknown and not recorded, but at least one SHALL be present. Visits to HMO-operated/community emergency centers MAY be modeled with this profile, however, if more structured representation is required using ILHDPEncounterHospitalization/ILHDPEncounterInpatientCareSegment might be more appropriate."

* ^url = "http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-encounter-community-hmo-ambulatory"
* insert ConformanceMetadata
* ^status = #draft

* insert ILHDPEncounterCommon
* obeys ilhdp-enc-ambulatory-period
* obeys ilhdp-community-virtual-class

* type[hospitalization] 0..0
* type[inpatient-care-segment] 0..0
* type[community-hmo-ambulatory] 1..1
* type[virtual-encounters] 0..*
* type[doctor-to-doctor-consultation] 0..1
* type[without-patient-present] 0..1
* type[face-to-face] 0..1
* type[face-to-face] ^comment = "To be used for for regular face to face encounters with patient present in the same physical location as practitioner."

* participant 1..*
* participant[primary-performer] ^comment = "SHOULD be used to indicate primary performer on the encounter - i.e. - GP at HMO visit, nurse at immunisation encounter, etc."
* participant[consultant] ^comment = "SHOULD be used to indicate consulting practitioner on doctor to doctor consultation without patient present."
* participant[reffering-practitioner] ^comment = "SHOULD be used to indicate referring practitioner on the referral encounters and on doctor to doctor consultation without patient present."
* location[nursing-unit] 0..0
* partOf 0..0
* serviceProvider 1..1
* serviceProvider ^comment = "SHALL represent org-unit if service provided by the organization itself or external vendor if outsourced."

//* class ^short = "Encounter class"
* class ^comment = "SHOULD be COMMUNITY-OR-HMO in most cases, but could also be EMER for emergency centers operated in the community. For virtual encounters it SHALL be VR and the type of virtual encounter SHALL be indicated by Encounter.type."
//* hospitalization ^short = "Hospitalization details (ambulatory only)"
* hospitalization ^comment = "MAY be present for ambulatory encounters when needed to capture details (e.g., specialArrangement, dietPreference). In routine community/HMO visits it is typically omitted."
* episodeOfCare ^comment = "To tie together multiple similar recurring encounters for treatment of a particular condition (e.g. - dialysis) - it is recommended (i.e. SHOULD) to use EpisodeOfCare."
* episodeOfCare ^alias[0] = "מומלץ - סדרת ביקורים/פרק טיפול"
* participant.type ^alias[0] = "מומלץ - תפקיד של המטפל"
* reasonCode ^alias[0] = "סיבת ביקור"
* reasonReference ^alias[0] = "סיבת ביקור"
* reasonReference ^comment = "References to Conditions to be addressed and/or Procedures to be performed during this visit SHOULD be populated if known"
* reasonReference[patient-reported-chief-complaint] ^alias[0] = "סיבת ביקור/תלונות מטופל/ת"
* diagnosis ^alias[0] = "אבחנות בביקור"
* diagnosis.use ^alias[0] = "מומלץ - סוג אבחנה"

* hospitalization 0..1

* period ^comment = "At least one of period.start or period.end SHALL be present. If exact time is not known only the date component SHOULD be populated."
