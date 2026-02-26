Instance: hospital1-ward-b-nu1
InstanceOf: ILHDPLocationNursingUnit
Title: "HDP Location - Hospital1 Ward B Nursing Unit 1"
Description: "Nursing unit location for the Ward B portion of the stay."
Usage: #example

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Hospital1 Ward B - Nursing Unit 1</div>"

* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #organization
* meta.security[HDP].display = "Organization"

* status = #active
* name = "Hospital1 Ward B Nursing Unit 1"
* type = $il-core-hospital-nursing-unit#il-core-hospital-nursing-unit "Hospital nursing unit"
* mode = #instance
* managingOrganization.reference = "Organization/hospital1-ward-b"
