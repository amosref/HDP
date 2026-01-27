Instance: chest-xray
InstanceOf: ILHDPServiceRequest
Usage: #example
* status = #active
* intent = #order
* identifier.value = "SR12345"
* identifier.system = "http://goodcare.org/service-req/id"
* meta.security[HDP] = $info-buckets#diagnosticImaging "בדיקות דימות"
* category[il-core].coding = $sct#363679005 "Imaging (procedure)"
* category[il-core].text = "Imaging Order"
* code = $loinc#30746-2 "Portable XR Chest Views"
* code.text = "Portable XR Chest Views"
* subject = Reference(Patient/patient-israeli) "Amy Shaw"
* encounter = Reference(Encounter/home-visit)
* occurrenceDateTime = "2024-10-13"
* authoredOn = "2024-10-13T10:59:38-08:00"
* requester = Reference(Practitioner/md)
* reasonCode.coding = $sct#386663009 "Bicycle accident (event)"
* reasonCode.text = "Bicycle accident"
* priority = #routine
* performer = Reference(Organization/radiology-dept)
* reasonReference = Reference(Condition/burnt-ear)
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Chest X-Ray for Amy Shaw</div>"
* text.status = #generated
* supportingInfo = Reference(Observation/hemoglobin-lab-test)
* note.text = "Patient is claustrophobic, please use sedation if needed."