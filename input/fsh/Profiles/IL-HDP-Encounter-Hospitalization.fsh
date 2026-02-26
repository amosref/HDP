Profile: ILHDPEncounterHospitalization
Parent: ILCoreEncounter
Id: il-hdp-encounter-hospitalization
Title: "ILHDP Encounter Hospitalization Profile"
Description: "Top-level hospitalization encounter representing the patient's overall stay, capturing high-level clinical and administrative information. It MAY be used for ambulatory visits if they are managed as a hierarchy in the source system, however, use of ILHDPEncounterCommunityHMOAmbulatory is preferred for simplicity. The combination of ILHDPEncounterHospitalization and ILHDPEncounterInpatientCareSegment SHALL cover all hospitalization scenarios, including general inpatient care, home hospitalization, geriatric, and psychiatric settings. Visits to HMO-operated/community emergency centers MAY be represented either with the hospitalization + inpatient-segment combination (for structured flows) or with ILHDPEncounterCommunityHMOAmbulatory when a simpler, 'flat' representation better reflects the source system."

* ^url = "http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-encounter-hospitalization"
* insert ConformanceMetadata
* ^status = #draft

* insert ILHDPEncounterCommon
* obeys ilhdp-enc-period-start
* obeys ilhdp-enc-finished-period

* status ^comment = "SHALL be populated with appropriate status (including onleave in geriatric/psychiatric, etc.)"
* statusHistory ^comment = "חשוב למימוש. Hospitalization encounters may span a long time period so their status can change over time (e.g. - home leave, etc.) - it SHOULD be reflected in statusHistory element, including period for each status"

* class ^comment = "Use class appropriate for care location - most likely EMER, IMP, HH (in case of home hospitalization) or RALTCF, but others also possible. Note that ambulatory encounters SHOULD use ILHDPEncounterCommunityHMOAmbulatory instead."
* classHistory ^comment = "חשוב למימוש. It is possible that hospitalization encounter starts with one class and then changes to another. E.g. - encounter that starts from the visit to ER (EMER) and then subsequently patient is admitted (IMP). In such cases classHistory SHOULD be maintained including period for each class."

* type[hospitalization] 1..1
* type[inpatient-care-segment] 0..0
* type[community-hmo-ambulatory] 0..0
* type[virtual-encounters] 0..0
* type[virtual-encounters] ^comment = "Not applicable to top-level hospitalization encounter."
* type[doctor-to-doctor-consultation] 0..0
* type[doctor-to-doctor-consultation] ^comment = "Not applicable to top-level hospitalization encounter."
* type[without-patient-present] 0..0
* type[without-patient-present] ^comment = "Not applicable to top-level hospitalization encounter."
* type[face-to-face] 0..1

* serviceType ^comment = "SHOULD be inferred from the hospitalization reason - both for planned and unplanned hospitalization. MAY change for unplanned hospitalization, SHOULD NOT change for planned hospitalization."

* participant 0..*
* participant ^comment = "Top level Encounter MAY include participants not associated with specific care segment encounters."
* reasonCode[moh-reason-code] 0..*
* hospitalization 0..1
* hospitalization.dischargeDisposition from $vs-patient-release-type-moh (extensible)
 
* location 0..*
* location[nursing-unit] 0..0
* partOf 0..0
* serviceProvider 1..1

* episodeOfCare ^comment = "חשוב למימוש. To tie together multiple related hospital encounters (e.g. - pre-op ambulatory visit, procedure hospitalization and post-op checkup visit) EpisodeOfCare SHOULD be used."

* statusHistory ^alias[0] = "היסטוריית סטטוסים"
* classHistory ^alias[0] = "היסטוריית קטגוריות"
* episodeOfCare ^alias[0] = "סדרת ביקורים/פרק טיפול"
* reasonCode ^alias[0] = "סיבת ביקור/סיבה לאשפוז"
* reasonReference ^alias[0] = "סיבת ביקור/סיבה לאשפוז"
* reasonReference ^comment = "References to Conditions to be addressed and/or Procedures to be performed during this hospitalization SHOULD be populated if known"
* reasonReference[patient-reported-chief-complaint] ^alias[0] = "סיבת ביקור/סיבה לאשפוז/תלונות בקבלה"

//todo : add primary diagnosis slice!
* diagnosis ^alias[0] = "אבחנות בביקור/אשפוז"
* diagnosis[admission] ^alias[0] = "אבחנת בקבלה"
* diagnosis[admission] ^comment = "עבור אשפוזים - SHALL be referenced on top level encounter as well."
* diagnosis[admission].condition ^alias[0] = "אבחנת בקבלה"
* diagnosis[admission].condition ^comment = "עבור אשפוזים - SHALL be referenced on top level encounter as well."
* diagnosis[comorbidity] ^alias[0] = "אבחנת רקע"
* diagnosis[comorbidity] ^comment = "עבור אשפוזים - SHALL be referenced on top level encounter as well."
* diagnosis[comorbidity].condition ^alias[0] = "אבחנת רקע"
* diagnosis[comorbidity].condition ^comment = "עבור אשפוזים - SHALL be referenced on top level encounter as well."
* diagnosis[discharge] ^alias[0] = "אבחנת בשחרור"
* diagnosis[discharge] ^comment = "עבור אשפוזים - SHALL be referenced on top level encounter as well."
* diagnosis[discharge].condition ^alias[0] = "אבחנת בשחרור"
* diagnosis[discharge].condition ^comment = "עבור אשפוזים - SHALL be referenced on top level encounter as well."
* hospitalization.specialArrangement ^alias[0] = "אמצעי נגישות"
* hospitalization.specialArrangement ^comment = "חשוב למימוש"
* hospitalization.destination ^alias[0] = "לאן שוחרר המטופל"
* hospitalization.destination ^comment = "חשוב למימוש - Should be populated if known when discharged to another organization."
* hospitalization.dischargeDisposition ^alias[0] = "לאן שוחרר המטופל"
* hospitalization.dischargeDisposition ^comment = "חשוב למימוש - Should be populated if known when discharged to another organization."
* location ^alias[0] = "מיקום הביקור"
* location ^comment = "חשוב למימוש - MAY be populated on top level encounter."
* location.physicalType ^comment = "MAY be populated for physical location types (e.g. - for home hospitalization could be ho-House)."
* location[nursing-unit] ^alias[0] = "מעברים בין מחלקות/יחידת סיעוד"
* location[nursing-unit] ^comment = "SHALL NOT be populated on top level encounter"

* period ^comment = "If status is finished then either period.end or Encounter.length SHALL be populated. If exact time is not known only the date component SHOULD be populated."
* period.start ^comment = "SHALL be populated if status is not planned."

* serviceProvider ^comment = "SHALL be the hospital itself."
