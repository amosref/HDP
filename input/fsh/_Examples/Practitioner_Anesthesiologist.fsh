Instance: anesthesiologist-with-expertise
InstanceOf: ILHDPPractitioner
Usage: #example

* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">anesthesiologist with expertise</div>"
* text.status = #generated
* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #practitioner
* meta.security[HDP].display = "מטפל"
* identifier[enc-il-id].system = "http://fhir.health.gov.il/identifier/encrypted-id-primary-moh"
* identifier[enc-il-id].value = "gH45*&@1a"
* active = true
* name.prefix = "דר'"
* name.family = "ברקוביץ"
* name.given = "ליאת"
* name.text = "דר' ליאת ברקוביץ"
* name.extension[language].valueCode = #he
* telecom[0].system = #phone
* telecom[0].value = "04-6421420"
* telecom[0].use = #work
* telecom[1].system = #email
* telecom[1].value = "DG@example.com"
* gender = #female
* birthDate = "1977-04-01"

* qualification[+].identifier[0].system = "http://practitioners.health.gov.il/Practitioners"
* qualification[=].identifier[0].value = "1-1234"
* qualification[=].identifier[0].period.start = "2012-09-06"
* qualification[=].code = http://fhir.health.gov.il/cs/practitioner-certificate-type-moh#2 "רשיון קבוע"
* qualification[=].extension[0].url = $ext-qualification-practice
* qualification[=].extension[0].valueCodeableConcept = http://fhir.health.gov.il/cs/practitioner-profession-moh#1 "רפואה"

* qualification[+].identifier[0].system = "http://fhir.health.gov.il/cs/practitioner-expertise-moh"
* qualification[=].identifier[0].value = "123445"
* qualification[=].code = http://fhir.health.gov.il/cs/practitioner-certificate-type-moh#5 "תעודת מומחה"
* qualification[=].extension[0].url = $ext-qualification-practice
* qualification[=].extension[0].valueCodeableConcept = http://fhir.health.gov.il/cs/practitioner-expertise-moh#21 "הרדמה"

