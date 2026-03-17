Instance: hdp-recurring-daily-hospitalization-program1
InstanceOf: ILHDPEpisodeOfCareRecurringDailyHospitalization
Title: "HDP EpisodeOfCare - Recurring Daily Hospitalization Program"
Description: "Recurring day-hospitalization program represented as an EpisodeOfCare, with admission/comorbidity/discharge diagnoses."
Usage: #example

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>EpisodeOfCare:</b> Recurring day-hospitalization program with repeated daily treatment sessions.</p></div>"

* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #encounterInformation
* meta.security[HDP].display = "Encounter information"

* identifier[+].system = "http://hospital1.example.org/episodes"
* identifier[=].value = "HOSP1-RDH-2024-0001"

* status = #finished
* statusHistory[+].status = #active
* statusHistory[=].period.start = "2024-10-01"
* statusHistory[=].period.end = "2024-12-31"
* statusHistory[+].status = #finished
* statusHistory[=].period.start = "2024-12-31"
* statusHistory[=].period.end = "2024-12-31"

* type[recurring-daily-hospitalization].coding[+] = http://fhir.health.gov.il/cs/il-core-episode-of-care-type#recurring-daily-hospitalization "Recurring daily hospitalization"
* type[serviceType].coding[+] = $sct#310129007 "Rehabilitation service"

* patient.reference = "Patient/il-hdp-patient"
* patient.display = "ILHDP Patient"

* managingOrganization.reference = "Organization/hospital1-ward-a"
* managingOrganization.display = "Hospital1 Internal Ward A"

* period.start = "2024-10-01"
* period.end = "2024-12-31"

* careManager.reference = "Practitioner/practitioner-md-ward-a"
* careManager.display = "Dr. Cohen Yael"

* diagnosis[admission].condition.reference = "Condition/hdp-pneumonia"
* diagnosis[admission].condition.display = "Community acquired pneumonia"
* diagnosis[admission].rank = 1
* diagnosis[comorbidity].condition.reference = "Condition/hdp-type-2-diabetes"
* diagnosis[comorbidity].condition.display = "Type 2 diabetes mellitus"
* diagnosis[comorbidity].rank = 1
* diagnosis[discharge].condition.reference = "Condition/hdp-pneumonia"
* diagnosis[discharge].condition.display = "Community acquired pneumonia"
* diagnosis[discharge].rank = 1
