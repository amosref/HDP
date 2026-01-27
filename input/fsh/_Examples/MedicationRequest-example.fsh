Instance: metamizole
InstanceOf: ILHDPMedicationRequest
Title: "HDP Medication Request Example - Metamizole"
Description: "Example of a medication request conforming to the HDP profile"

* meta.profile = "http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-medication-request"
* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #medications
* meta.security[HDP].display = "תרופות"

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">A request by a GP in an HMO setting for 10 drops of oral Optalgin (Metamizole) up to 3 times a day for the duration of two weeks due to a diagnosis of acute gangrenous tonsillitis.</div>"
* identifier.id = "medication-request-metamizole"
* identifier.system = "http://goodcare.org/med-req/id"
* status = #completed
* intent = #order
* category.coding = http://fhir.health.gov.il/cs/il-core-medication-request-category#community-hmo "Community Care/HMO"
* medicationCodeableConcept.coding = http://snomed.info/sct#22165008 "Metamizole sodium (substance)"
* subject = Reference(Patient/patient-immigrant)
* encounter = Reference(Encounter/community-consultation)
* authoredOn = "2022-12-10"
* requester = Reference(Practitioner/practitioner-md)
* supportingInformation = Reference(Observation/hight-measurement)
* recorder = Reference(Practitioner/practitioner-md)
* reasonCode.coding = http://snomed.info/sct#652005 "Gangrenous tonsillitis"

* courseOfTherapyType.coding.system = "http://terminology.hl7.org/CodeSystem/medicationrequest-course-of-therapy"
* courseOfTherapyType.coding.code = #acute
* courseOfTherapyType.coding.display = "Short course (acute) therapy"

* dosageInstruction.text = "10 טיפות כל 8 שעות עד 3 פעמים בבליעה דרך הפה"
* dosageInstruction.route.coding = http://snomed.info/sct#26643006 "Oral route"
* dosageInstruction.method.coding = http://snomed.info/sct#738995006 "Swallow (administration method)"
* dosageInstruction.site.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* dosageInstruction.site.extension.valueCode = #unknown
* dosageInstruction.doseAndRate.doseQuantity.value = 10
* dosageInstruction.doseAndRate.doseQuantity.unit = "drop"
* dosageInstruction.doseAndRate.doseQuantity.system = "http://unitsofmeasure.org"
* dosageInstruction.doseAndRate.rateRatio.numerator.value = 10
* dosageInstruction.doseAndRate.rateRatio.numerator.unit = "drop"
* dosageInstruction.doseAndRate.rateRatio.denominator.value = 8
* dosageInstruction.doseAndRate.rateRatio.denominator.unit = "hour"

* substitution.allowedBoolean = true
* identifier.value = "med-request-001"
