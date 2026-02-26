Instance: hdp-type-2-diabetes
InstanceOf: ILHDPCondition
Title: "HDP Condition - Type 2 Diabetes Mellitus"
Description: "Comorbidity diagnosis referenced during hospitalization and ward stay."
Usage: #example

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Type 2 diabetes mellitus</div>"

* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #diagnoses

* identifier[+].system = "http://hospital1.example.org/conditions"
* identifier[=].value = "HOSP1-COND-0002"
* recordedDate = "2024-11-28"

* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
* category[+].coding[+] = $condition-category#problem-list-item "Problem List Item"
* code = $sct#44054006 "Type 2 diabetes mellitus"
* subject.reference = "Patient/il-hdp-patient"
* recorder.reference = "Practitioner/practitioner-md"
* asserter.reference = "Practitioner/practitioner-md"
* onsetDateTime = "2015-06-01"
