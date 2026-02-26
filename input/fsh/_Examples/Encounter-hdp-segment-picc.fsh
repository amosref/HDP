Instance: hdp-segment-picc
InstanceOf: ILHDPEncounterInpatientCareSegment
Title: "HDP Inpatient Care Segment - PICC Line Insertion"
Description: "Short segment representing a PICC line insertion procedure during the Ward A stay."
Usage: #example

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>Segment:</b> PICC line insertion during inpatient care.</p><p>Linked as a child event to the Ward A segment.</p><p>A Procedure resource for the PICC insertion can be linked via reasonReference when available.</p></div>"

* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #encounterInformation
* meta.security[HDP].display = "Encounter information"

* identifier[+].system = "http://hospital1.example.org/encounters"
* identifier[=].value = "HOSP1-PICC-2024-0001"

* status = #finished
* statusHistory[+].status = #in-progress
* statusHistory[=].period.start = "2024-11-30T10:00:00+02:00"
* statusHistory[=].period.end = "2024-11-30T10:45:00+02:00"
* statusHistory[+].status = #finished
* statusHistory[=].period.start = "2024-11-30T10:45:00+02:00"
* statusHistory[=].period.end = "2024-11-30T10:45:00+02:00"
* class = $v3-ActCode#IMP "inpatient encounter"
* classHistory[+].class = $v3-ActCode#IMP "inpatient encounter"
* classHistory[=].period.start = "2024-11-30T10:00:00+02:00"
* classHistory[=].period.end = "2024-11-30T10:45:00+02:00"
* type[inpatient-care-segment].coding[+] = $il-core-encounter-type#inpatient-care-segment-hdp "Inpatient care segment (HDP encounter type)"
* type[face-to-face].coding[+] = $sct#1258986006 "Face-to-face encounter"
* serviceType = $sct#708170008 "Nursing service"

* subject.reference = "Patient/il-hdp-patient"
* subject.display = "ILHDP Patient"

* participant[primary-performer].type.coding[+].system = "http://terminology.hl7.org/CodeSystem/v3-ParticipationType"
* participant[primary-performer].type.coding[=].code = #PPRF
* participant[primary-performer].type.coding[=].display = "primary performer"
* participant[primary-performer].individual.reference = "Practitioner/practitioner-nurse-picc"
* participant[primary-performer].individual.display = "Registered Nurse Maya Levi"
* participant[+].type.coding[+].system = "http://terminology.hl7.org/CodeSystem/v3-ParticipationType"
* participant[=].type.coding[=].code = #SPRF
* participant[=].type.coding[=].display = "secondary performer"
* participant[=].individual.reference = "Practitioner/practitioner-md-picc"
* participant[=].individual.display = "Dr. Amir Feldman"

* period.start = "2024-11-30T10:00:00+02:00"
* period.end = "2024-11-30T10:45:00+02:00"

* serviceProvider.reference = "Organization/hospital1-ward-a"
* serviceProvider.display = "Hospital1 Internal Ward A"

* partOf.reference = "Encounter/hdp-segment-ward-a"
* partOf.display = "Ward A Inpatient Care Segment"

// nursing unit
* location[+].location.reference = "Location/hospital1-ward-a-nu2"
* location[=].location.display = "Hospital1 Ward A Nursing Unit 2"
* location[=].status = #completed
* location[=].period.start = "2024-11-30T10:00:00+02:00"
* location[=].period.end = "2024-11-30T10:45:00+02:00"
* location[=].physicalType.coding[+].system = "http://terminology.hl7.org/CodeSystem/location-physical-type"
* location[=].physicalType.coding[=].code = #wa
* location[=].physicalType.coding[=].display = "Ward"

* reasonCode[+].coding[+] = $sct#425196008 "Insertion of peripherally inserted central catheter (procedure)"
* reasonCode[=].text = "PICC line insertion procedure"
