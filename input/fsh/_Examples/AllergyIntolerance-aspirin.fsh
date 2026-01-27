Instance: aspirin-intolerance
InstanceOf: ILHDPAllergyIntolerance
Title: "Aspirin Intolerance Example"
Description: "Example of an aspirin intolerance with reaction details"

* meta.profile = "http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-allergy-intolerance"
* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #allergiesAndIntolerances
* meta.security[HDP].display = "רגישויות"

* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:a76d9bbf-f293-4fb7-ad4c-2851bac77162"
* identifier.type = http://fhir.health.gov.il/cs/il-core-identifier-type#strong-id

* extension[AllergyIntoleranceEnd].url = "http://fhir.health.gov.il/StructureDefinition/ext-allergy-intolerance-end"
* extension[AllergyIntoleranceEnd].extension[endDate].url = "endDate"
* extension[AllergyIntoleranceEnd].extension[endDate].valueDateTime = "2022-03-14"

* clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification#confirmed
* type = #intolerance
* category = #medication
* criticality = #low

* code = http://snomed.info/sct#292044008 "Aspirin adverse reaction"
* onsetDateTime = "2004"

* patient = Reference(Patient/patient-with-israeli-id)
* recorder = Reference(Practitioner/practitioner-with-encrypted-israeli-id)
* asserter = Reference(Patient/patient-with-israeli-id)
* encounter = Reference(Encounter/allergy-encounter)

* reaction.extension[duration].url = "http://fhir.health.gov.il/StructureDefinition/ext-reaction-duration"
* reaction.extension[duration].valueDuration.value = 3
* reaction.extension[duration].valueDuration.code = #h
* reaction.extension[duration].valueDuration.system = "http://unitsofmeasure.org"

* reaction.substance.coding = http://snomed.info/sct#387458008 "Aspirin (substance)"
* reaction.manifestation.coding = http://snomed.info/sct#60862001 "Tinnitus (finding)"
* reaction.severity = #mild
* reaction.exposureRoute.coding = http://snomed.info/sct#26643006 "Oral route (qualifier value)"
