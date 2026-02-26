Instance: practitioner-md-ward-a
InstanceOf: ILHDPPractitioner
Title: "HDP Practitioner - Ward A Physician"
Description: "Example physician assigned to the Ward A inpatient care segment."
Usage: #example

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Dr. Cohen Yael</div>"

* meta.profile[+] = "http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-practitioner"
* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #practitioner
* meta.security[HDP].display = "מטפל"

* identifier[+].system = $practitioner-license-moh
* identifier[=].value = "1-12345"

* active = true
* name[+].family = "Cohen"
* name[=].given[+] = "Yael"
* name[=].prefix[+] = "Dr."
