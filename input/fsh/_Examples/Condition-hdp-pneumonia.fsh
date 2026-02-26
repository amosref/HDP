Instance: hdp-pneumonia
InstanceOf: ILHDPCondition
Title: "HDP Condition - Community Acquired Pneumonia"
Description: "Primary admission diagnosis for the hospitalization example."
Usage: #example

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Community acquired pneumonia</div>"

* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #diagnoses

* identifier[+].system = "http://hospital1.example.org/conditions"
* identifier[=].value = "HOSP1-COND-0001"
* recordedDate = "2024-11-28"

* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
* category[+].coding[+] = $condition-category#encounter-diagnosis "Encounter Diagnosis"
* code = $sct#233604007 "Pneumonia (disorder)"
* subject.reference = "Patient/il-hdp-patient"
* encounter.reference = "Encounter/hdp-hospitalization-hospital1"
* onsetDateTime = "2024-11-28"
* recorder.reference = "Practitioner/practitioner-md"
* asserter.reference = "Practitioner/practitioner-md"
