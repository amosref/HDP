Instance: hdp-medication-dispense
InstanceOf: ILHDPMedicationDispense
Title: "HDP Medication Dispense Example"
Description: "Example of a medication dispense conforming to the HDP profile"

* meta.profile = "http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-medication-dispense"
* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #medications
* meta.security[HDP].display = "תרופות"

* extension[recorded].valueDateTime = "2024-05-21T14:00:00Z"
* identifier.value = "dispense-001"
* identifier.system = "http://goodcare.org/dispenses/id"

* status = #completed
* category.coding = http://fhir.health.gov.il/cs/il-core-medication-request-category#community-hmo "Community Care/HMO"
* medicationReference = Reference(Medication/paracetamol)
* subject = Reference(Patient/patient-israeli-with-statistical-area)

* performer.actor = Reference(Practitioner/practitioner-md)

* authorizingPrescription = Reference(MedicationRequest/metamizole-for-gangreenous-tonsolitis)
* type.coding = http://terminology.hl7.org/CodeSystem/v3-ActCode#RFP "Refill - Part Fill"

* quantity.value = 10
* quantity.unit = "Tablet"
* quantity.system = "http://snomed.info/sct"
* quantity.code = #428673006

* whenHandedOver = "2024-05-21T14:30:00Z"

* dosageInstruction.sequence = 1
* dosageInstruction.text = "Take one tablet daily"
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.route.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* dosageInstruction.route.extension.valueCode = #unknown
* dosageInstruction.site.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* dosageInstruction.site.extension.valueCode = #unknown
* dosageInstruction.method.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* dosageInstruction.method.extension.valueCode = #unknown
* dosageInstruction.doseAndRate.doseQuantity.value = 1
* dosageInstruction.doseAndRate.doseQuantity.unit = "Tablet"
* dosageInstruction.doseAndRate.doseQuantity.system = "http://snomed.info/sct"
* dosageInstruction.doseAndRate.doseQuantity.code = #428673006
* dosageInstruction.doseAndRate.rateQuantity.value = 1
* dosageInstruction.doseAndRate.rateQuantity.unit = "Tablet"
* dosageInstruction.doseAndRate.rateQuantity.system = "http://snomed.info/sct"
* dosageInstruction.doseAndRate.rateQuantity.code = #428673006
* identifier.value = "dispense-001"