Alias: $v3-RoleCode = http://terminology.hl7.org/CodeSystem/v3-RoleCode

Instance: hospital-unit
InstanceOf: ILHDPLocation
Usage: #example
* meta.profile = "http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-location"
* meta.security[HDP] = $info-buckets#organization "יחידה ארגונית"
* address.line = "העליה השנייה 8"
* address.line.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address.line.extension[=].valueString = "העליה השנייה"
* address.line.extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address.line.extension[=].valueString = "8"
* address.extension.url = "http://fhir.health.gov.il/StructureDefinition/ext-statistical-area"
* address.extension.valueIdentifier.system = "http://fhir.health.gov.il/identifier/cbs-statistical-area"
* address.extension.valueIdentifier.value = "4000416"
* address.use = #work
* address.type = #physical
* address.text = "העליה השנייה 8 חיפה"
* address.city = "חיפה"
* address.city.extension.url = "http://fhir.health.gov.il/StructureDefinition/ext-city-code"
* address.city.extension.valueCodeableConcept = $city-symbol#4000
* address.postalCode = "3109601"
* address.country = "IL"
* identifier.system = "http://rambam.co.il/department"
* identifier.value = "010011"
* status = #active
* name = "פנימית א' בית חולים רמב\"ם"
* type = $v3-RoleCode#HU
* description = "Second floor of the old south wing"
* telecom.system = #phone
* telecom.value = "04-7772518"
* telecom.use = #work
* hoursOfOperation.allDay = true
* managingOrganization = Reference(Organization/ministry-of-health)
* position.longitude = 32.232325
* position.latitude = 34.253251