Instance: hospital1-ward-b
InstanceOf: ILHDPOrganization
Title: "HDP Organization - Hospital1 Internal Ward B"
Description: "Internal medicine ward B organizational unit under Hospital1."
Usage: #example

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Hospital1 Internal Ward B</div>"

* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #organization

* identifier[+].system = $legal-entity
* identifier[=].value = "514444444"
* identifier[=].use = #official
* active = true
* name = "Hospital1 Internal Ward B"
* partOf.reference = "Organization/hospital1"
* type[moh-department-type] = $department-type-moh#10000
