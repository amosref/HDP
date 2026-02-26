Instance: hospital1
InstanceOf: ILHDPOrganization
Title: "HDP Organization - Hospital1"
Description: "Example hospital organization used as the service provider for HDP hospitalization encounters."
Usage: #example

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Hospital1</div>"

* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #organization

* identifier[+].system = $legal-entity
* identifier[=].value = "514444444"
* identifier[=].use = #official
* active = true
* name = "Hospital1"
* type[moh-institute-type] = $institution-type-moh#1
