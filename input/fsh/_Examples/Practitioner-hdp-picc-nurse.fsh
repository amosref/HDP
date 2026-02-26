Instance: practitioner-nurse-picc
InstanceOf: ILHDPPractitioner
Title: "HDP Practitioner - PICC Nurse"
Description: "Example nurse performing the PICC line insertion segment."
Usage: #example

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Registered Nurse Maya Levi</div>"

* meta.profile[+] = "http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-practitioner"
* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #practitioner
* meta.security[HDP].display = "מטפל"

* identifier[+].system = $nurse-license-moh
* identifier[=].value = "22222"

* active = true
* name[+].family = "Levi"
* name[=].given[+] = "Maya"
* name[=].prefix[+] = "RN"
