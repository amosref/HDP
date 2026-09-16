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
* identifier[enc-il-id].system = "http://fhir.health.gov.il/identifier/encrypted-id-primary-moh"
* identifier[enc-il-id].value = "qR7z*&@2f"
* identifier[enc-il-id].type = http://fhir.health.gov.il/cs/il-core-identifier-type#strong-id
* identifier[+].system = "http://fhir.health.gov.il/identifier/encrypted-id-primary-moh"
* identifier[=].value = "gH45*&@5a"

* active = true
* name[English].family = "Feldman"
* name[English].given[+] = "Amir"
* name[English].prefix[+] = "Dr."
* name[English].extension[language].valueCode = #en