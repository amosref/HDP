Instance: allergy-category-clause-a
InstanceOf: ILHDPAllergyIntolerance
Title: "AllergyIntolerance - invariant clause A (category present)"
Description: "Exercises ilhdp-allergy-category-required clause A: category is present."

* meta.profile = "http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-allergy-intolerance"
* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #allergiesAndIntolerances
* meta.security[HDP].display = "רגישויות"

* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:11111111-1111-1111-1111-111111111111"
* identifier.type = http://fhir.health.gov.il/cs/il-core-identifier-type#strong-id

* clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification#confirmed
* type = #allergy
* category = #food

* code = http://snomed.info/sct#91935009 "Allergy to peanuts"
* recordedDate = "2024-01-10"

* patient = Reference(Patient/patient-with-israeli-id)
* recorder = Reference(Practitioner/practitioner-with-encrypted-israeli-id)
