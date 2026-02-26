Instance: hdp-segment-er
InstanceOf: ILHDPEncounterInpatientCareSegment
Title: "HDP Inpatient Care Segment - ER Evaluation"
Description: "ER segment for the initial evaluation and stabilization before admission to internal ward A."
Usage: #example

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>Segment:</b> Emergency department evaluation.</p><p>Includes triage, initial assessment, and stabilization prior to transfer to the ward.</p></div>"

* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #encounterInformation
* meta.security[HDP].display = "Encounter information"

* identifier[+].system = "http://hospital1.example.org/encounters"
* identifier[=].value = "HOSP1-ER-2024-0001"

* status = #finished
* statusHistory[+].status = #in-progress
* statusHistory[=].period.start = "2024-11-28T08:15:00+02:00"
* statusHistory[=].period.end = "2024-11-28T12:30:00+02:00"
* statusHistory[+].status = #finished
* statusHistory[=].period.start = "2024-11-28T12:30:00+02:00"
* statusHistory[=].period.end = "2024-11-28T12:30:00+02:00"
* class = $v3-ActCode#EMER "emergency"
* classHistory[+].class = $v3-ActCode#EMER "emergency"
* classHistory[=].period.start = "2024-11-28T08:15:00+02:00"
* classHistory[=].period.end = "2024-11-28T12:30:00+02:00"
* type[inpatient-care-segment].coding[+] = $il-core-encounter-type#inpatient-care-segment-hdp "Inpatient care segment (HDP encounter type)"
* type[face-to-face].coding[+] = $sct#1258986006 "Face-to-face encounter"
* serviceType = $sct#409971007 "Emergency medical services"

* subject.reference = "Patient/il-hdp-patient"
* subject.display = "ILHDP Patient"

* participant[primary-performer].type.coding[+].system = "http://terminology.hl7.org/CodeSystem/v3-ParticipationType"
* participant[primary-performer].type.coding[=].code = #PPRF
* participant[primary-performer].type.coding[=].display = "primary performer"
* participant[primary-performer].individual.reference = "Practitioner/practitioner-md"
* participant[primary-performer].individual.display = "Dr. Greenfeld Diana"
* participant[+].type.coding[+].system = "http://terminology.hl7.org/CodeSystem/v3-ParticipationType"
* participant[=].type.coding[=].code = #SPRF
* participant[=].type.coding[=].display = "secondary performer"
* participant[=].individual.reference = "Practitioner/practitioner-nurse"
* participant[=].individual.display = "Registered Nurse"

* period.start = "2024-11-28T08:15:00+02:00"
* period.end = "2024-11-28T12:30:00+02:00"

* serviceProvider.reference = "Organization/hospital1-er"
* serviceProvider.display = "Hospital1 Emergency Department"

* partOf.reference = "Encounter/hdp-hospitalization-hospital1"
* partOf.display = "Hospital1 Hospitalization"

// nursing unit
* location[+].location.reference = "Location/hospital1-er-nu"
* location[=].location.display = "Hospital1 ER Nursing Unit"
* location[=].status = #completed
* location[=].period.start = "2024-11-28T08:15:00+02:00"
* location[=].period.end = "2024-11-28T12:30:00+02:00"

//* reasonCode[+] = $sct#32485007 "Hospital admission (procedure)"
* reasonReference[+].reference = "Condition/hdp-pneumonia"
* reasonReference[=].display = "Community acquired pneumonia"

* diagnosis[admission].condition.reference = "Condition/hdp-pneumonia"
* diagnosis[admission].condition.display = "Community acquired pneumonia"
* diagnosis[admission].rank = 1
