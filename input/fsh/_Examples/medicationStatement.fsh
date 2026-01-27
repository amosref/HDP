Instance: hdp-medication-statement-fluoxetine-20mg
InstanceOf: ILHDPMedicationStatement
Title: "HDP Medication Statement Example - Fluoxetine"
Description: "Example of a medication statement conforming to the HDP profile"

* meta.profile = "http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-medication-statement"
* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #medications
* meta.security[HDP].display = "תרופות"

* extension[courseOfTherapyType].url = "http://fhir.health.gov.il/StructureDefinition/ext-medication-course-of-therapy-type"
* extension[courseOfTherapyType].valueCodeableConcept.coding.system = "http://terminology.hl7.org/CodeSystem/medicationrequest-course-of-therapy"
* extension[courseOfTherapyType].valueCodeableConcept.coding.code = #continuous
* extension[courseOfTherapyType].valueCodeableConcept.coding.display = "Continuous long term therapy"

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Active medication statement reported by a practitioner regarding a patient in a long term care facility for long-term, continuous use of 20mg/day Prozac (Fluoxetine) taken each morning.</div>"
* identifier.id = "med-statement"
* identifier.system = "http://goodcare.org/med-stat/id"
* status = #active
* category.coding = http://fhir.health.gov.il/cs/medication-category#community-other "Community Care/Long Term Care/Home"
* medicationCodeableConcept.coding = http://snomed.info/sct#372767007 "Fluoxetine (substance)"

* informationSource = Reference(Practitioner/1)
* effectivePeriod.start = "2022-10-05"
* effectivePeriod.end = "2022-10-10"
* dateAsserted = "2022-07-30"
* subject = Reference(Patient/patient-with-israeli-id)
* context = Reference(Encounter/123)

* dosage.text = "20mg per day every morning"
* dosage.site.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* dosage.site.extension.valueCode = #unknown
* dosage.route.coding = http://snomed.info/sct#26643006 "Oral route"
* dosage.method.coding = http://snomed.info/sct#738995006 "Swallow (administration method)"
* dosage.doseAndRate.doseQuantity.value = 20
* dosage.doseAndRate.doseQuantity.unit = "mg"
* dosage.doseAndRate.doseQuantity.system = "http://unitsofmeasure.org"
* dosage.doseAndRate.doseQuantity.code = #mg
* dosage.doseAndRate.rateRatio.numerator.value = 15
* dosage.doseAndRate.rateRatio.numerator.unit = "mg"
* dosage.doseAndRate.rateRatio.numerator.system = "http://snomed.info/sct"
* dosage.doseAndRate.rateRatio.denominator.value = 4
* dosage.doseAndRate.rateRatio.denominator.unit = "hour"
* dosage.timing.repeat.when = #MORN
* identifier.value = "med-statement-001"