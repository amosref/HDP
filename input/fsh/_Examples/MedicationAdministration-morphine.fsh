Instance: morphine
InstanceOf: ILHDPMedicationAdministration
Title: "HDP Medication Administration Example - Morphine"
Description: "Example of a medication administration conforming to the HDP profile"

* meta.profile = "http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-medication-administration"
* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #medications
* meta.security[HDP].display = "תרופות"

// * extension[narcoticMedication].valueBoolean = true
* extension[recorded].valueDateTime = "2022-10-11"

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Example of a MedicationAdministration - morphine administered during hospitalization. Completed inpatient administration of 15mg of oral morphine every 4 hours as needed by a practitioner to a patient due to a procedure.</div>"

* status = #completed
* category.coding = http://fhir.health.gov.il/cs/il-core-medication-request-category#inpatient "Inpatient"
* medicationCodeableConcept.coding = http://snomed.info/sct#373529000 "Morphine (substance)"
* subject = Reference(Patient/patient-with-israeli-id)
* context = Reference(Encounter/home-visit)
* effectivePeriod.start = "2022-10-05"
* effectivePeriod.end = "2022-10-10"
* identifier.id = "med-admin"
* performer.actor = Reference(Practitioner/practitioner-md)

* dosage.text = "15mg every 4 hours"
* dosage.route.coding = http://snomed.info/sct#26643006 "Oral route"
* dosage.method.coding = http://snomed.info/sct#738995006 "Swallow (administration method)"
* dosage.site.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* dosage.site.extension.valueCode = #unknown
* dosage.dose.value = 15
* dosage.dose.unit = "mg"
* dosage.dose.code = #mg
* dosage.dose.system = "http://unitsofmeasure.org"
* dosage.rateRatio.numerator.value = 15
* dosage.rateRatio.numerator.unit = "mg"
* dosage.rateRatio.numerator.system = "http://snomed.info/sct"
* dosage.rateRatio.denominator.value = 4
* dosage.rateRatio.denominator.unit = "h"
* dosage.rateRatio.denominator.system = "http://unitsofmeasure.org"
* identifier.value = "med-admin-001"
* identifier.system = "http://goodcare.org/meds/id"