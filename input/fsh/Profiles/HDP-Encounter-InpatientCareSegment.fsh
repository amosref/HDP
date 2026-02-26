Profile: ILHDPEncounterInpatientCareSegment
Parent: ILCoreEncounter
Id: il-hdp-encounter-inpatient-care-segment
Title: "ILHDP Encounter Inpatient Care Segment Profile"
Description: "Child encounter representing a distinct period or event within the overall hospitalization. In most cases it denotes care by a specific clinical unit (e.g., ER, internal medicine ward, orthopedics), but it MAY also represent a significant event during care (e.g., emergency surgical intervention, resuscitation, specialist consultation, imaging procedure). When representing care by a clinical unit, this encounter SHALL reference the top-level ILHDPEncounterHospitalization via partOf. When representing a significant event, this encounter SHALL reference either the top-level ILHDPEncounterHospitalization or the relevant ILHDPEncounterInpatientCareSegment via partOf. It is recommended to link significant-event encounters to the segment representing the responsible clinical unit. This profile captures both the clinical unit providing care (serviceProvider) and the nursing unit/physical location (location). A new segment encounter SHALL be created when the clinical unit (serviceProvider) changes (e.g., transfer). If only the nursing unit/bed changes, a new encounter SHALL NOT be created; update location and/or location:nursing-unit instead. The choice of what constitutes a 'significant event' is left to the organization; however, to avoid overwhelming consumers, create event segments only for clinically meaningful events where associating participants and artifacts (Conditions, Observations, Medications, Procedures, etc.) to that event is important."

* ^url = "http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-encounter-inpatient-care-segment"
* insert ConformanceMetadata
* ^status = #draft

* insert ILHDPEncounterCommon
* obeys ilhdp-enc-period-start
* obeys ilhdp-enc-finished-period

* status ^comment = "Status of child encounters SHALL be harmonized with the status of parent encounter (e.g. - child encounter cannot be in-progress when parent encounter is finished, etc.)"
* statusHistory ^comment = "חשוב למימוש. If status history is managed for Inpatient Care Segment encounters it SHOULD be reflected here."

* class ^comment = "Usually will inherit from parent ILHDPEncounterHospitalization, but can also have different codes (e.g. - EMER segment for overall IMP episode)."
* classHistory ^comment = "חשוב למימוש. In most scenarios class SHOULD NOT be changed for Inpatient Care Segment. Change of class on Inpatient Care Segment encounter usually indicates that another Inpatient Care Segment SHOULD be created."

* type[hospitalization] 0..0
* type[inpatient-care-segment] 1..1
* type[community-hmo-ambulatory] 0..0
* type[virtual-encounters] 0..*
* type[doctor-to-doctor-consultation] 0..1
* type[without-patient-present] 0..1
* type[face-to-face] 0..1

* serviceType ^comment = "If there are no better options - SHOULD be inferred from the clinical type of the ward. For specialist consultation - if there are no better options infer from practitioner specialization or ward they are assigned to. SHOULD NOT change for this type of encounter."

* participant 1..*
* participant ^comment = "Care segment encounter SHALL include all participating practitioners or practitioner roles directly involved in care during that segment."

* reasonCode[moh-reason-code] 0..0
* hospitalization 0..0
* hospitalization.dischargeDisposition from $vs-patient-release-type-moh (extensible)
* location 1..*
* location[nursing-unit] 1..*
* location[nursing-unit].location 1..1
* partOf 1..1
* partOf only Reference(ILHDPEncounterHospitalization or ILHDPEncounterInpatientCareSegment)
* partOf ^comment = "SHALL reference top level ILHDPEncounterHospitalization or segment level ILHDPEncounterInpatientCareSegment encounter for significant events/consultations."
* serviceProvider 1..1

* statusHistory ^alias[0] = "היסטוריית סטטוסים"
* classHistory ^alias[0] = "היסטוריית קטגוריות"
* episodeOfCare ^alias[0] = "סדרת ביקורים/פרק טיפול"
* episodeOfCare ^comment = "חשוב למימוש"
* reasonCode ^alias[0] = "סיבת ביקור/סיבה לאשפוז"
* reasonReference ^alias[0] = "סיבת ביקור/סיבה לאשפוז"
* reasonReference ^comment = "References to Conditions to be addressed and/or Procedures to be performed during this segment SHOULD be populated if known"
* reasonReference[patient-reported-chief-complaint] ^alias[0] = "סיבת ביקור/סיבה לאשפוז/תלונות בקבלה"
* diagnosis ^alias[0] = "אבחנות בביקור/אשפוז"
* diagnosis[admission] ^alias[0] = "אבחנת בקבלה"
* diagnosis[admission] ^comment = "עבור אשפוזים"
* diagnosis[admission].condition ^alias[0] = "אבחנת בקבלה"
* diagnosis[admission].condition ^comment = "עבור אשפוזים"
* diagnosis[comorbidity] ^alias[0] = "אבחנת רקע"
* diagnosis[comorbidity] ^comment = "עבור אשפוזים"
* diagnosis[comorbidity].condition ^alias[0] = "אבחנת רקע"
* diagnosis[comorbidity].condition ^comment = "עבור אשפוזים"
* diagnosis[discharge] ^alias[0] = "אבחנת בשחרור"
* diagnosis[discharge] ^comment = "עבור אשפוזים"
* diagnosis[discharge].condition ^alias[0] = "אבחנת בשחרור"
* diagnosis[discharge].condition ^comment = "עבור אשפוזים"
* hospitalization ^comment = "General information related to hospitalization (e.g. - dietPreferences, specialCourtesy, admitSource, dischargeDisposition, etc.) SHALL be maintained on the top level Encounter (ILHDPEncounterHospitalization)."
* hospitalization.specialArrangement ^alias[0] = "אמצעי נגישות"
* hospitalization.specialArrangement ^comment = "חשוב למימוש"
* hospitalization.destination ^alias[0] = "לאן שוחרר המטופל"
* hospitalization.destination ^comment = "חשוב למימוש"
* hospitalization.dischargeDisposition ^alias[0] = "לאן שוחרר המטופל"
* hospitalization.dischargeDisposition ^comment = "חשוב למימוש"
* location ^alias[0] = "מיקום הביקור"
* location ^comment = "SHALL include nursing unit. SHOULD include physical location (building/floor/room/bed/etc.) - as detailed as possible. MAY include references to multiple locations (e.g. - building, floor, room and nursing unit) If transferred between locations - history SHALL be kept (i.e.- status, period)"
* location.status ^comment = "SHOULD be populated."
* location.physicalType ^comment = "SHOULD be populated for physical location types."
* location[nursing-unit] ^alias[0] = "מעברים בין מחלקות/יחידת סיעוד"
* location[nursing-unit] ^comment = "עבור אשפוזים - SHALL be nursing org unit providing care during this segment."
* location[nursing-unit].status ^comment = "SHALL be populated if transferred between locations, SHOULD be populated otherwise. SHALL have only one nursing unit with status=active at any time."
* location[nursing-unit].period ^comment = "SHALL be populated if transferred between locations, SHOULD be populated otherwise
SHALL be consistent with Encounter.period."

* period ^comment = "If status is finished then either period.end or Encounter.length SHALL be populated. If exact time is not known only the date component SHOULD be populated. Times SHALL be harmonized with parent encounter (i.e. - cannot start after parent end or start before parent start, etc.)"
* period.start ^comment = "SHALL be populated if status is not planned."

* serviceProvider ^comment = "SHALL be clinical org unit. If transferred to another clinical unit new segment encounter SHALL be created."
