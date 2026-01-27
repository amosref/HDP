
Instance: hdp-diagnostic-pathology-study
InstanceOf: ILHDPDiagnosticReport
Usage: #example
* meta.security[HDP] = $info-buckets#pathology "פתולוגיה"
* meta.profile = "http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-diagnostic-report"
* identifier.id = "pathology-study"
* identifier.value = "PATH-2024-0002"
* identifier.system = "http://goodcare.org/reports/id"
* status = #final
* code = $loinc#11526-1 "Pathology study"
* code.text = "Pathology study"
* subject = Reference(Patient/patient-with-israeli-id) "תמר כהן"
* encounter = Reference(Encounter/skin-biopsy) "Encounter with Dr. Smith"
* effectiveDateTime = "2024-11-05T14:30:00Z"
* issued = "2024-11-05T15:00:00Z"
* performer[0] = Reference(Organization/acme-labs) "Acme Laboratory Services"
* performer[+] = Reference(Practitioner/practitioner-md) "דר גרינפלד דיאנה"
* result = Reference(Observation/skin-biopsy-result) "Microscopic examination of skin biopsy"
* conclusion = "The skin biopsy reveals superficial basal cell carcinoma. Margins are clear."
* conclusionCode = $sct#1338007 "Basal cell carcinoma (morphologic abnormality)"