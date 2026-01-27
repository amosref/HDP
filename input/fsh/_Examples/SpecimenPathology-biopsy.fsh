Instance: specimen-pathology-biopsy-1
InstanceOf: ILHDPSpecimenPathology
Usage: #example
* meta.security[HDP] = $info-buckets#pathology "פתולוגיה"
* meta.profile = "http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-specimen-pathology"
* identifier.system = "http://specimen-ids.net/specimen-ids"  // this is an example
* identifier.value = "12345-biopsy-001"
* status = #available
* type = $sct#309506005 "Skin excision biopsy specimen (specimen)"
* type.text = "Skin excision biopsy specimen (specimen)"
* subject = Reference(Patient/patient-with-israeli-id)
* receivedTime = "2020-12-06T11:30:00+03:00"
* request = Reference(ServiceRequest/987)
// * collection.collector.extension.url = "http://fhir.health.gov.il/StructureDefinition/ext-specimen-collector-reference"
// * collection.collector.extension.valueReference = Reference(Practitioner/surgeon-dr-jones)
// * collection.collector.extension.valueReference.type = "Practitioner"
* collection.collector.type = "Practitioner"
* collection.collectedDateTime = "2020-12-06T06:30:00+03:00"
* collection.quantity.value = 15
* collection.quantity.unit = "g"
* processing.timeDateTime = "2020-12-06T12:35:00+03:00"
* container.specimenQuantity = 15 'g' "g"
* container.type = $sct#700855008 "Tissue/fluid collection bag, sterile (physical object)"
* container.type.text = "Tissue/fluid collection bag, sterile (physical object)"
* collection.bodySite = $sct#368209003 "Right upper arm structure (body structure)"
* collection.bodySite.text = "Right upper arm structure (body structure)"
* processing.extension[0].url = "http://fhir.health.gov.il/StructureDefinition/ext-processing-location"
* processing.extension[=].valueReference = Reference(Location/pathology-lab)
* processing.extension[+].url = "http://fhir.health.gov.il/StructureDefinition/ext-processing-practitioner"
* processing.extension[=].valueReference = Reference(Practitioner/pathologist)