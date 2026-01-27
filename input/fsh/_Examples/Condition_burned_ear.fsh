Instance: burnt-ear
InstanceOf: ILHDPCondition
Usage: #example
* meta.security[HDP].system = $info-buckets (exactly)
* meta.security[HDP].code = #diagnoses
* meta.security[HDP].display = "אבחנות"
* identifier.value = "burned-ear"
* identifier.system = "http://goodcare.org/conditions/id"

// * type = #diagnosis
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active "Active"
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed "Confirmed"
* category[0].coding[0] = http://terminology.hl7.org/CodeSystem/condition-category#encounter-diagnosis "Encounter Diagnosis"
* category[0].coding[1] = $sct#439401001 "Diagnosis"
* severity = $sct#24484000 "Severe"
* code = $sct#39065001 "Burn of ear"
* code.text = "Burnt Ear"
* bodySite[0] = $sct#49521004 "Left external ear structure"
* bodySite[0].text = "Left Ear"
* subject.reference = "Patient/patient-with-israeli-id"
* onsetDateTime = "2012-05-24"
* recordedDate = "2012"
* recorder.reference = "Patient/patient-with-israeli-id"
