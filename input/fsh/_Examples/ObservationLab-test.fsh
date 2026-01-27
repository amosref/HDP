Instance: hemoglobin-lab-test
InstanceOf: ILHDPObservationLab
Title: "Example of HDP Observation Lab"
Description: "An example instance of an HDP Observation Lab - hemoglobin"
Usage: #example
* meta.security[HDP] = $info-buckets#laboratoryTests "בדיקות מעבדה"
* status = #final
* identifier.id = "hemoglobin-lab-test"
* identifier.value = "LAB-2024-0002"
* identifier.system = "http://goodcare.org/lab-test/id"
* category[il-core].coding.system = "http://snomed.info/sct"
* category[il-core].coding.code = #108252007
* category[il-core].coding.display = "Laboratory procedure"
* code.coding[0].system = "http://loinc.org"
* code.coding[0].code = #718-7
* code.coding[0].display = "Hemoglobin [Mass/volume] in Blood"
* subject = Reference(Patient/patient-with-israeli-id)
* subject.identifier.system = $il-id
* subject.identifier.value = "000000018"
* performer.reference = "Practitioner/practitioner-nurse-no-expertise-with-advanced-courses"
// * performer[organization] = Reference(Organization/hospital-department)
* effectiveDateTime = "2024-11-27T10:30:00Z"
* valueQuantity = 13.5 'g/dL' "g/dL"
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#N "Normal"
* specimen = Reference(Specimen/hdp-specimen-pathology-biopsy-1)
* referenceRange.low = 13.2 'g/dL' "g/dL"
* referenceRange.high = 16.6 'g/dL' "g/dL"