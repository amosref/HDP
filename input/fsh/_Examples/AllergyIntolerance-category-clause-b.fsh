Instance: allergy-category-clause-b
InstanceOf: ILHDPAllergyIntolerance
Title: "AllergyIntolerance - invariant clause B (no known allergy coding)"
Description: "Exercises ilhdp-allergy-category-required clause B: code.coding contains SNOMED CT 716186003 (No known allergy), category absent."

* meta.profile = "http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-allergy-intolerance"
* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #allergiesAndIntolerances
* meta.security[HDP].display = "רגישויות"

* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:22222222-2222-2222-2222-222222222222"
* identifier.type = http://fhir.health.gov.il/cs/il-core-identifier-type#strong-id

* clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification#confirmed
* type = #allergy

* code.coding.system = $sct
* code.coding.code = #716186003
* code.coding.display = "No known allergy (situation)"
* recordedDate = "2024-01-10"

* patient = Reference(Patient/patient-with-israeli-id)
* recorder = Reference(Practitioner/practitioner-with-encrypted-israeli-id)
