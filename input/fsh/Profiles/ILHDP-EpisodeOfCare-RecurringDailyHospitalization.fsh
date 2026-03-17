Profile: ILHDPEpisodeOfCareRecurringDailyHospitalization
Parent: ILHDPEpisodeOfCare
Id: il-hdp-episode-of-care-recurring-daily-hospitalization
Title: "ILHDP EpisodeOfCare Recurring Daily Hospitalization"
Description: "EpisodeOfCare profile for recurring day-hospitalization programs, where each treatment day may include multiple clinical encounters and the patient leaves the hospital at the end of the day."

* ^url = "http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-episode-of-care-recurring-daily-hospitalization"
* insert ConformanceMetadata
* ^status = #draft

* type 1..*
* type[recurring-daily-hospitalization] 1..1
* type[serviceType] 1..1
* period 1..1
* managingOrganization 1..1
* diagnosis 1..*

* diagnosis ^slicing.discriminator.type = #pattern
* diagnosis ^slicing.discriminator.path = "role"
* diagnosis ^slicing.rules = #open
* diagnosis contains
    admission 0..* and
    comorbidity 0..* and
    discharge 0..*
* diagnosis[admission] ^short = "Admission diagnosis"
* diagnosis[admission] ^definition = "Diagnosis recorded at the beginning of the recurring daily hospitalization program."
* diagnosis[admission].role = $diagnosis-role#AD
* diagnosis[comorbidity] ^short = "Comorbidity diagnosis"
* diagnosis[comorbidity] ^definition = "Background/comorbidity diagnosis associated with the recurring daily hospitalization program."
* diagnosis[comorbidity].role = $diagnosis-role#CM
* diagnosis[discharge] ^short = "Discharge diagnosis"
* diagnosis[discharge] ^definition = "Diagnosis recorded at completion/closure of the recurring daily hospitalization program."
* diagnosis[discharge].role = $diagnosis-role#DD

* diagnosis.role from $vs-il-core-diagnosis-role (extensible)
* diagnosis.role ^comment = "SHOULD be used to indicate diagnosis role for the episode context."
* diagnosis.rank ^comment = "SHOULD be used to indicate relative rank of diagnosis within each diagnosis role."

* type[recurring-daily-hospitalization] ^short = "Recurring daily hospitalization episode type"
* type[recurring-daily-hospitalization] ^definition = "Category marker for recurring day-hospitalization episodes."
* type[serviceType] ^short = "Service type for the recurring daily hospitalization program"
* type[serviceType] ^definition = "Service type/specialty context for the episode, analogous to Encounter.serviceType."

* identifier ^alias[0] = "מזהה ביקור"
* status ^alias[0] = "סטאטוס"
* statusHistory ^alias[0] = "היסטוריית סטטוסים"
* patient ^alias[0] = "מזהה מטופל/ת"
* period ^alias[0] = "תאריך, שעה"
* careManager ^alias[0] = "גורם מטפל/ צוות"
* managingOrganization ^alias[0] = "יחידה ארגונית/ספק שירות"
* referralRequest ^alias[0] = "מזהה ההפניה לביקור"
* diagnosis ^alias[0] = "אבחנות בביקור/אשפוז"
* diagnosis[admission] ^alias[0] = "אבחנת בקבלה"
* diagnosis[comorbidity] ^alias[0] = "אבחנת רקע"
* diagnosis[discharge] ^alias[0] = "אבחנת בשחרור"
* diagnosis.role ^alias[0] = "מומלץ - סוג אבחנה"
* type ^alias[0] = "סוג ביקור/תחום השירות"
* type[serviceType] ^alias[0] = "סוג ביקור/תחום השירות"
* type[recurring-daily-hospitalization] ^alias[0] = "קטגוריה"
