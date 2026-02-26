Instance: hospital1-er-nu
InstanceOf: ILHDPLocationNursingUnit
Title: "HDP Location - Hospital1 ER Nursing Unit"
Description: "Nursing unit location for the ER segment."
Usage: #example

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Hospital1 ER Nursing Unit</div>"

* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #organization
* meta.security[HDP].display = "Organization"

* status = #active
* name = "Hospital1 ER Nursing Unit"
* type = $il-core-hospital-nursing-unit#il-core-hospital-nursing-unit "Hospital nursing unit"
* mode = #instance
* managingOrganization.reference = "Organization/hospital1-er"
