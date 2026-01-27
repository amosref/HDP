Instance: blood-sample
InstanceOf: ILHDPSubstance
Title: "Example ILHDP Substance Blood Sample"
Description: "Demonstrates ILHDP Substance profile"

* text.status = #generated
* text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p>Blood sample substance entry with HDP meta.</p>
</div>
"""

* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #laboratoryTests
* meta.security[HDP].display = "בדיקות מעבדה"

* identifier[0].system = "http://hospital.exsystem.org/substances"
* identifier[0].value = "SUB-2025-0002"

* status = #active
* code.coding[0].system = $sct
* code.coding[0].code = #87612001 
* code.coding[0].display = "Blood (substance)"
