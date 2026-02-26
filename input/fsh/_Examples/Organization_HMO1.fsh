Instance: HMO1
InstanceOf: ILHDPOrganization
Title: "HDP Organization - HMO1"
Description: "Example HMO organization used by HDP encounter examples."
Usage: #example

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">HMO1</div>"

* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #organization

* identifier[+].system = $legal-entity
* identifier[=].value = "515555555"
* identifier[=].use = #official
* active = true
* name = "HMO1"
* type[moh-institute-type] = $institution-type-moh#73
