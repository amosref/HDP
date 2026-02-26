Instance: hdp-segment-ward-a
InstanceOf: ILHDPEncounterInpatientCareSegment
Title: "HDP Inpatient Care Segment - Internal Ward A"
Description: "Ward A segment covering inpatient treatment, with a transfer to a Ward B nursing unit and bed location during the stay."
Usage: #example

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>Segment:</b> Internal Ward A inpatient care.</p><p>Shows a transfer to a Ward B nursing unit and physical bed location during the stay.</p></div>"

* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #encounterInformation
* meta.security[HDP].display = "Encounter information"

* identifier[+].system = "http://hospital1.example.org/encounters"
* identifier[=].value = "HOSP1-WARDA-2024-0001"

* status = #finished
* statusHistory[+].status = #in-progress
* statusHistory[=].period.start = "2024-11-28T15:30:00+02:00"
* statusHistory[=].period.end = "2024-12-02T12:00:00+02:00"
* statusHistory[+].status = #finished
* statusHistory[=].period.start = "2024-12-02T12:00:00+02:00"
* statusHistory[=].period.end = "2024-12-02T12:00:00+02:00"
* class = $v3-ActCode#IMP "inpatient encounter"
* classHistory[+].class = $v3-ActCode#IMP "inpatient encounter"
* classHistory[=].period.start = "2024-11-28T15:30:00+02:00"
* classHistory[=].period.end = "2024-12-02T12:00:00+02:00"
* type[inpatient-care-segment].coding[+] = $il-core-encounter-type#inpatient-care-segment-hdp "Inpatient care segment (HDP encounter type)"
* type[face-to-face].coding[+] = $sct#1258986006 "Face-to-face encounter"
* serviceType = $sct#700232004 "General medical service"

* subject.reference = "Patient/il-hdp-patient"
* subject.display = "ILHDP Patient"

* participant[primary-performer].type.coding[+].system = "http://terminology.hl7.org/CodeSystem/v3-ParticipationType"
* participant[primary-performer].type.coding[=].code = #PPRF
* participant[primary-performer].type.coding[=].display = "primary performer"
* participant[primary-performer].individual.reference = "Practitioner/practitioner-md-ward-a"
* participant[primary-performer].individual.display = "Dr. Cohen Yael"
* participant[+].type.coding[+].system = "http://terminology.hl7.org/CodeSystem/v3-ParticipationType"
* participant[=].type.coding[=].code = #SPRF
* participant[=].type.coding[=].display = "secondary performer"
* participant[=].individual.reference = "Practitioner/practitioner-nurse-ward-a"
* participant[=].individual.display = "Registered Nurse Leah Katz"

* period.start = "2024-11-28T15:30:00+02:00"
* period.end = "2024-12-02T12:00:00+02:00"

* serviceProvider.reference = "Organization/hospital1-ward-a"
* serviceProvider.display = "Hospital1 Internal Ward A"

* partOf.reference = "Encounter/hdp-hospitalization-hospital1"
* partOf.display = "Hospital1 Hospitalization"

//nursing units
* location[+].location.reference = "Location/hospital1-ward-a-nu1"
* location[=].location.display = "Hospital1 Ward A Nursing Unit 1"
* location[=].status = #completed
* location[=].period.start = "2024-11-28T15:30:00+02:00"
* location[=].period.end = "2024-11-30T09:00:00+02:00"
* location[+].location.reference = "Location/hospital1-ward-b-nu1"
* location[=].location.display = "Hospital1 Ward B Nursing Unit 1"
* location[=].status = #completed
* location[=].period.start = "2024-11-30T09:00:00+02:00"
* location[=].period.end = "2024-12-02T12:00:00+02:00"
//physical bed locations
* location[+].location.reference = "Location/hospital1-ward-a-room-12-bed-2"
* location[=].location.display = "Ward A Room 12 Bed 2"
* location[=].status = #completed
* location[=].period.start = "2024-11-28T15:30:00+02:00"
* location[=].period.end = "2024-11-29T12:00:00+02:00"
* location[=].physicalType.coding[+].system = "http://terminology.hl7.org/CodeSystem/location-physical-type"
* location[=].physicalType.coding[=].code = #bd
* location[=].physicalType.coding[=].display = "Bed"
* location[+].location.reference = "Location/hospital1-ward-b-room-05-bed-1"
* location[=].location.display = "Ward B Room 05 Bed 1"
* location[=].status = #completed
* location[=].period.start = "2024-11-29T12:00:00+02:00"
* location[=].period.end = "2024-12-02T12:00:00+02:00"
* location[=].physicalType.coding[+].system = "http://terminology.hl7.org/CodeSystem/location-physical-type"
* location[=].physicalType.coding[=].code = #bd
* location[=].physicalType.coding[=].display = "Bed"

* reasonReference[+].reference = "Condition/hdp-pneumonia"
* reasonReference[=].display = "Community acquired pneumonia"

* diagnosis[comorbidity].condition.reference = "Condition/hdp-type-2-diabetes"
* diagnosis[comorbidity].condition.display = "Type 2 diabetes mellitus"
* diagnosis[comorbidity].rank = 2
