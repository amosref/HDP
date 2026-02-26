Instance: hdp-hospitalization-hospital1
InstanceOf: ILHDPEncounterHospitalization
Title: "HDP Hospitalization Encounter - Hospital1"
Description: "Top-level hospitalization encounter for a patient admitted with pneumonia, covering ER evaluation and subsequent ward care."
Usage: #example

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>Hospitalization:</b> Admission via ER for fever, cough, and dyspnea.</p><p>Child encounters represent ER care, internal ward A stay, and a PICC line procedure performed during the ward stay.</p><p>Admission and comorbidity diagnoses are recorded as encounter diagnoses, while the detailed clinical data is stored in referenced Condition resources.</p></div>"

* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #encounterInformation
* meta.security[HDP].display = "Encounter information"

* identifier[+].system = "http://hospital1.example.org/encounters"
* identifier[=].value = "HOSP1-ADM-2024-0001"

* status = #finished
* statusHistory[+].status = #in-progress
* statusHistory[=].period.start = "2024-11-28T08:15:00+02:00"
* statusHistory[=].period.end = "2024-12-02T14:00:00+02:00"
* statusHistory[+].status = #finished
* statusHistory[=].period.start = "2024-12-02T14:00:00+02:00"
* statusHistory[=].period.end = "2024-12-02T14:00:00+02:00"
* class = $v3-ActCode#IMP "inpatient encounter"
* classHistory[+].class = $v3-ActCode#EMER "emergency"
* classHistory[=].period.start = "2024-11-28T08:15:00+02:00"
* classHistory[=].period.end = "2024-11-28T15:30:00+02:00"
* classHistory[+].class = $v3-ActCode#IMP "inpatient encounter"
* classHistory[=].period.start = "2024-11-28T15:30:00+02:00"
* classHistory[=].period.end = "2024-12-02T14:00:00+02:00"
* type[hospitalization].coding[+] = $il-core-encounter-type#hospitalization-hdp "Hospitalization (HDP encounter type)"
* type[face-to-face].coding[+] = $sct#1258986006 "Face-to-face encounter"
* serviceType = $sct#700232004 "General medical service"

* subject.reference = "Patient/il-hdp-patient"
* subject.display = "ILHDP Patient"

* participant[+].type.coding[+].system = "http://terminology.hl7.org/CodeSystem/v3-ParticipationType"
* participant[=].type.coding[=].code = #PPRF
* participant[=].type.coding[=].display = "primary performer"
* participant[=].individual.reference = "Practitioner/practitioner-md"
* participant[=].individual.display = "Dr. Greenfeld Diana"
* participant[+].type.coding[+].system = "http://terminology.hl7.org/CodeSystem/v3-ParticipationType"
* participant[=].type.coding[=].code = #SPRF
* participant[=].type.coding[=].display = "secondary performer"
* participant[=].individual.reference = "Practitioner/practitioner-nurse"
* participant[=].individual.display = "Registered Nurse"
* participant[+].type.coding[+].system = "http://terminology.hl7.org/CodeSystem/v3-ParticipationType"
* participant[=].type.coding[=].code = #PPRF
* participant[=].type.coding[=].display = "primary performer"
* participant[=].individual.reference = "Practitioner/practitioner-md-ward-a"
* participant[=].individual.display = "Dr. Cohen Yael"
* participant[+].type.coding[+].system = "http://terminology.hl7.org/CodeSystem/v3-ParticipationType"
* participant[=].type.coding[=].code = #SPRF
* participant[=].type.coding[=].display = "secondary performer"
* participant[=].individual.reference = "Practitioner/practitioner-nurse-ward-a"
* participant[=].individual.display = "Registered Nurse Leah Katz"
* participant[+].type.coding[+].system = "http://terminology.hl7.org/CodeSystem/v3-ParticipationType"
* participant[=].type.coding[=].code = #PPRF
* participant[=].type.coding[=].display = "primary performer"
* participant[=].individual.reference = "Practitioner/practitioner-nurse-picc"
* participant[=].individual.display = "Registered Nurse Maya Levi"
* participant[+].type.coding[+].system = "http://terminology.hl7.org/CodeSystem/v3-ParticipationType"
* participant[=].type.coding[=].code = #SPRF
* participant[=].type.coding[=].display = "secondary performer"
* participant[=].individual.reference = "Practitioner/practitioner-md-picc"
* participant[=].individual.display = "Dr. Amir Feldman"

* period.start = "2024-11-28T08:15:00+02:00"
* period.end = "2024-12-02T14:00:00+02:00"

* serviceProvider.reference = "Organization/hospital1"
* serviceProvider.display = "Hospital1"

* reasonCode[+] = $patient-visit-reason-moh#10 "מחלה"
* reasonReference[+].reference = "Condition/hdp-pneumonia"
* reasonReference[=].display = "Community acquired pneumonia"
* reasonReference[patient-reported-chief-complaint].reference = "Observation/hdp-chief-complaint-hospitalization"
* reasonReference[patient-reported-chief-complaint].display = "Patient-reported chief complaint"

* diagnosis[admission].condition.reference = "Condition/hdp-pneumonia"
* diagnosis[admission].condition.display = "Community acquired pneumonia"
* diagnosis[admission].rank = 1
* diagnosis[+].use = $il-core-diagnosis-role#primary-diagnosis "Primary diagnosis"
* diagnosis[=].condition.reference = "Condition/hdp-pneumonia"
* diagnosis[=].condition.display = "Community acquired pneumonia"
* diagnosis[=].rank = 1
* diagnosis[comorbidity].condition.reference = "Condition/hdp-type-2-diabetes"
* diagnosis[comorbidity].condition.display = "Type 2 diabetes mellitus"
* diagnosis[comorbidity].rank = 1

* hospitalization.dischargeDisposition = $patient-release-type-moh#2 "שחרור הביתה"
