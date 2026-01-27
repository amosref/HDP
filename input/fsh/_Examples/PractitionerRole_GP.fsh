Instance: gp
InstanceOf: ILHDPPractitionerRole
Usage: #example

* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">רופאת משפחה</div>"
* text.status = #generated
* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #practitioner
* meta.security[HDP].display = "מטפל"
* identifier.system = "http://practitioners.health.gov.il/Practitioners"
* identifier.value = "1-1234"
* active = true
* practitioner.reference = "Practitioner/practitioner-md"
* location.reference = "Location/hospital-unit"
* telecom[0].system = #phone
* telecom[0].value = "04-6421420"
* telecom[0].use = #work
* telecom[1].system = #email
* telecom[1].value = "DG@example.com"
* availableTime.availableStartTime = "09:00:00"
* availableTime.availableEndTime = "17:00:00"
* organization.reference = "Organization/ministry-of-health"
* code = http://fhir.health.gov.il/cs/practitioner-role-moh#1 "רופא"
