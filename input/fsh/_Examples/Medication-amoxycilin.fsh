
Instance: amoxicillin
InstanceOf: ILHDPMedication
Title: "Example ILHDP Medication Amoxicillin"
Description: "Demonstrates ILHDP Medication profile with meta, identifiers, code, manufacturer, form, and ingredient"

* text.status = #generated
* text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p>Amoxicillin 500mg capsule, manufactured by Example Pharma.</p>
</div>
"""

* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #medications
* meta.security[HDP].display = "תרופות"

* identifier[0].system = "http://hospital.hospitalia.org/medications"
* identifier[0].value = "MED-2025-0001"
* identifier[0].assigner = Reference(Organization/example)

* code.coding[0].system = $sct
* code.coding[0].code = #374646004
* code.coding[0].display = "Product containing precisely amoxicillin 500 milligram/1 each conventional release oral tablet (clinical drug)"

* status = #active

* manufacturer = Reference(Organization/example)

* form.coding[0].system = $sct
* form.coding[0].code = #420692007
* form.coding[0].display = "Oral capsule"

* ingredient[0].itemReference = Reference(Substance/example)
* ingredient[0].strength.numerator.value = 500
* ingredient[0].strength.numerator.unit = "mg"
* ingredient[0].strength.numerator.system = $ucum
* ingredient[0].strength.numerator.code = #mg
* ingredient[0].strength.denominator.value = 1
* ingredient[0].strength.denominator.unit = "capsule"
* ingredient[0].strength.denominator.system = $ucum
* ingredient[0].strength.denominator.code = #1
