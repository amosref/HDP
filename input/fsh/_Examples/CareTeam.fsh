Instance: hdp-careTeam
InstanceOf: ILHDPCareTeam
Title: "HDP Care Team Example"
Description: "Example of a care team conforming to the HDP profile"

* meta.profile = "http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-care-team"
* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #practitioner
* meta.security[HDP].display = "מטפל"
* identifier.type = http://fhir.health.gov.il/cs/il-core-identifier-type#strong-id
* identifier.system = "http://goodcare.org/careteams/id"
* identifier.value = "12345"

* contained[+] = pr1
* status = #active
* category.coding = http://loinc.org#LA27976-2 "Encounter-focused care team"
* name = "Peter James Charlmers Care Plan for Inpatient Encounter"

* subject = Reference(Patient/patient-immigrant)
* encounter = Reference(Encounter/community-consultation)
* period.end = "2013-01-01"

* participant[0].role.text = "responsiblePerson"
* participant[0].member = Reference(Patient/patient-immigrant)

* participant[1].role.text = "adviser"
* participant[1].member = Reference(pr1)
* participant[1].onBehalfOf = Reference(Organization/meir-hospital)
* participant[1].period.end = "2013-01-01"

* managingOrganization = Reference(Organization/meir-hospital)

Instance: pr1
InstanceOf: ILCorePractitioner
Usage: #inline
* meta.profile = "http://fhir.health.gov.il/StructureDefinition/il-core-practitioner"
* identifier.system = "http://practitioners.health.gov.il/Practitioners"
* identifier.value = "1-1234"
* name.family = "Dietician"
* name.given = "Dorothy"
