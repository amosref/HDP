// Instance: allergy-category-clause-c
// InstanceOf: ILHDPAllergyIntolerance
// Title: "AllergyIntolerance - invariant clause C (code.text only, no coding)"
// Description: "Exercises ilhdp-allergy-category-required clause C: code.text has a value and code.coding has no entries, category absent."

// * meta.profile = "http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-allergy-intolerance"
// * meta.security[HDP].system = $info-buckets
// * meta.security[HDP].code = #allergiesAndIntolerances
// * meta.security[HDP].display = "רגישויות"

// * identifier.system = "urn:ietf:rfc:3986"
// * identifier.value = "urn:uuid:33333333-3333-3333-3333-333333333333"
// * identifier.type = http://fhir.health.gov.il/cs/il-core-identifier-type#strong-id

// * clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active
// * verificationStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification#confirmed
// * type = #allergy

// * code.text = "Unspecified allergy, reported by patient without a coded diagnosis"
// * recordedDate = "2024-01-10"

// * patient = Reference(Patient/patient-with-israeli-id)
// * recorder = Reference(Practitioner/practitioner-with-encrypted-israeli-id)
