Instance:   ministry-of-health
InstanceOf: ILHDPOrganization

* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">משרד הבריאות</div>"
* text.status = #generated
* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #organization
* meta.security[HDP].display = "יחידה ארגונית"
* identifier[legal-entity].value = "500100904"
* identifier.use = #official
* active = true
* name = "משרד הבריאות"

//telecom
* telecom.system = #phone
* telecom.value = "08-6241010"
* telecom.use = #work

//address 
* address.use = #work
* address.type = #physical
* address.text = "ירמיהו 39 ירושלים"
* address.line = "ירמיהו 39"
* address.city = "ירושלים"
* address.city.extension[cityCode].valueCodeableConcept = $city-code#3000
// TODO - add extension[cityCode].system

* address.line.extension[streetName].valueString = "ירמיהו"
* address.line.extension[houseNumber].valueString = "39"
* address.postalCode = "9446724"  
* address.country = "IL"

* type[moh-institute-type] = http://fhir.health.gov.il/cs/institution-type-moh#76 "משרדי ממשלה"
 