Instance: ExampleILHDPBP
InstanceOf: ILHDPBP
Title: "Example ILHDP Blood Pressure"
Description: "Demonstrates ILHDP BP profile with required meta, identifiers, subject, encounter, performer, and device"

* text.status = #generated
* text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p>Blood pressure measurement: 120/80 mmHg</p>
</div>
"""

* status = #final
* effectiveDateTime = "2025-09-07T10:30:00+02:00"

* code.coding[ilcore].system = $loinc
* code.coding[ilcore].code = #85354-9
* code.coding[ilcore].display = "Blood pressure panel with all children optional"

* subject = Reference(Patient/example)
* encounter = Reference(Encounter/example)
* performer[0] = Reference(Practitioner/example)
* device = Reference(Device/example)

* identifier[0].system = "http://hospital.somethinghealth.org/observation"
* identifier[0].value = "BP-2025-0001"
* identifier[0].type = http://fhir.health.gov.il/cs/il-core-identifier-type#strong-id

* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #measurements
* meta.security[HDP].display = "מדדים"

* component[SystolicBP].code.coding[SBPCode].system = $loinc
* component[SystolicBP].code.coding[SBPCode].code = #8480-6
* component[SystolicBP].code.coding[SBPCode].display = "Systolic blood pressure"
* component[SystolicBP].valueQuantity.value = 120
* component[SystolicBP].valueQuantity.unit = "mmHg"
* component[SystolicBP].valueQuantity.system = $ucum
* component[SystolicBP].valueQuantity.code = #mm[Hg]

* component[DiastolicBP].code.coding[DBPCode].system = $loinc
* component[DiastolicBP].code.coding[DBPCode].code = #8462-4
* component[DiastolicBP].code.coding[DBPCode].display = "Diastolic blood pressure"
* component[DiastolicBP].valueQuantity.value = 80
* component[DiastolicBP].valueQuantity.unit = "mmHg"
* component[DiastolicBP].valueQuantity.system = $ucum
* component[DiastolicBP].valueQuantity.code = #mm[Hg]
