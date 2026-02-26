Instance: practitioner-nurse-ward-a
InstanceOf: ILHDPPractitioner
Title: "HDP Practitioner - Ward A Nurse"
Description: "Example nurse assigned to the Ward A inpatient care segment."
Usage: #example

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Registered Nurse Leah Katz</div>"

* meta.profile[+] = "http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-practitioner"
* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #practitioner
* meta.security[HDP].display = "מטפל"

* identifier[+].system = $nurse-license-moh
* identifier[=].value = "11111"

* active = true
* name[+].family = "Katz"
* name[=].given[+] = "Leah"
* name[=].prefix[+] = "RN"
