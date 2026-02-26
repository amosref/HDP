Instance: practitioner-md-picc
InstanceOf: ILHDPPractitioner
Title: "HDP Practitioner - PICC Physician"
Description: "Example physician supporting the PICC line insertion segment."
Usage: #example

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Dr. Amir Feldman</div>"

* meta.profile[+] = "http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-practitioner"
* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #practitioner
* meta.security[HDP].display = "מטפל"

* identifier[+].system = $practitioner-license-moh
* identifier[=].value = "1-23456"

* active = true
* name[+].family = "Feldman"
* name[=].given[+] = "Amir"
* name[=].prefix[+] = "Dr."
