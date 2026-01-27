ValueSet: ILHDPOrganizationTypes
Id: il-hdp-organization-types
Title: "ILHDP Organization Types"
Description: "List of organization types for ILHDP"
* insert ConformanceMetadata
* ^url = $vs-il-hdp-organization-types
* ^status = #active
* ^experimental = false
* include codes from system http://fhir.health.gov.il/cs/institution-type-moh
* include codes from system http://fhir.health.gov.il/cs/department-type-moh
* include codes from system http://fhir.health.gov.il/cs/il-core-community-unit-type