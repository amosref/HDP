Instance: hdp-bp-admission-ward-a
InstanceOf: ILHDPBP
Title: "HDP Vital Signs - Admission Blood Pressure"
Description: "Admission blood pressure measurement captured during the Ward A inpatient segment, linked to the admission supplemental encounter via resource role context."
Usage: #example

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>Admission Vital Signs:</b> Blood pressure measured on admission to Ward A. Linked to the Ward A segment encounter and the admission supplemental encounter for operational context.</p></div>"

* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #measurements

* identifier[+].system = "http://hospital1.example.org/observations"
* identifier[=].value = "HOSP1-VS-BP-2024-0001"

* extension[+].url = $ext-resource-role-context
* extension[=].extension[+].url = "role"
* extension[=].extension[=].valueCodeableConcept = $il-core-resource-role-context#AD
* extension[=].extension[+].url = "roleOperationalContext"
* extension[=].extension[=].valueIdentifier.system = "http://hospital1.example.org/emr-sheet-id"
* extension[=].extension[=].valueIdentifier.value = "2f3a1d7e-9e38-4d47-9f49-0a7a59b7d04e"
* extension[=].extension[+].url = "roleEncounterContext"
* extension[=].extension[=].valueReference = Reference(Encounter/hdp-supplemental-admission-ward-a)
* extension[=].extension[=].valueReference.display = "Ward A Admission Supplemental Encounter"

* status = #final
* category[VSCat] = $obs-cat#vital-signs "Vital Signs"
* code = $loinc#85354-9 "Blood pressure panel with all children optional"
* subject.reference = "Patient/il-hdp-patient"
* subject.display = "HDP Patient with Israeli ID"
* encounter.reference = "Encounter/hdp-segment-ward-a"
* encounter.display = "Ward A Inpatient Care Segment"
* effectiveDateTime = "2024-11-28T15:40:00+02:00"
* performer.reference = "Practitioner/practitioner-nurse"
* performer.display = "Registered Nurse"
* component[SystolicBP].code = $loinc#8480-6 "Systolic blood pressure"
* component[SystolicBP].valueQuantity = 135 'mm[Hg]' "mmHg"
* component[DiastolicBP].code = $loinc#8462-4 "Diastolic blood pressure"
* component[DiastolicBP].valueQuantity = 82 'mm[Hg]' "mmHg"
