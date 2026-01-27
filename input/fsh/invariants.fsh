Invariant: prac-ident-enc
Description: "identifier must contain at least one member with either: 1.system = http://fhir.health.gov.il/identifier/encrypted-id-primary-moh; OR a value from PassportEncUri"
Expression: "identifier.where(value.memberOf('http://fhir.health.gov.il/ValueSet/passport-enc-uri') or system='http://fhir.health.gov.il/identifier/encrypted-id-primary-moh').exists()"
Severity: #error

Invariant: prac-role-code-specialty 
Description: "Must contain at least 'code' or 'specialty'"
Expression: "code.exists() or specialty.exists()"
Severity: #error

Invariant: effective-start-end
Description: "effectivePeriod.start and effectivePeriod.end SHALL have a value if extension:courseOfTherapyType is 'continuous' and status is 'stopped'"
Expression: "status = 'stopped' and extension('http://fhir.health.gov.il/StructureDefinition/ext-medication-course-of-therapy-type').value.ofType(CodeableConcept).coding.where(system = 'http://terminology.hl7.org/CodeSystem/medicationrequest-course-of-therapy' and code = 'continuous').exists() implies (effectivePeriod.start.exists() and effectivePeriod.end.exists())"
Severity: #warning

Invariant: check-identifiers
Description: "Must have at least one identifier from slices 'il-id' or 'ppn'"
Expression: "identifier.where(system = 'http://fhir.health.gov.il/identifier/il-national-id' or system.memberOf('http://fhir.health.gov.il/ValueSet/passport-uri')).exists()"
Severity: #warning

Invariant: statuses-exist
Description: "The elements clinicalStatus and verificationStatus SHOULD exist, if possible"
Expression: "verificationStatus.exists() and clinicalStatus.exists()"
Severity: #warning

Invariant: obs-lab-value-absent
Description: "Either Observation.value or Observation.dataAbsentReason must be present, but not both."
Expression: "(value.exists() xor dataAbsentReason.exists())"
Severity: #error

Invariant: medication-dose-rate-1
Description: "If this element is present, then at least one of its subelemnts: ['dose' or 'rate'] must be present."
Expression: "dose.exists() or rate.exists()"
Severity: #error

Invariant: one-strong-identifier
Description: "Every resource SHALL have exactly one (1) strong identifier, as defined by the Israeli HDP law"
// Severity: #error
Severity: #warning  // will change back to Error in the future, once decided. Kippi 11/11/25
Expression: "identifier.where(type.coding.where(system='http://fhir.health.gov.il/cs/il-core-identifier-type' and code='strong-id').exists()).count() = 1"

Invariant: one-strong-identifier-warning
Description: "Every resource SHOULD have exactly one (1) strong identifier, as defined by the Israeli HDP law"
Severity: #warning
Expression: "identifier.where(type.coding.where(system='http://fhir.health.gov.il/cs/il-core-identifier-type' and code='strong-id').exists()).count() = 1"

// Invariant: medication-dose-rate-2
// Description: "If dosage element is present, then at least one of its subelemnts: ['dose' or 'rate'] must be present."
// Expression: "dose.exists() or rate.exists()"
// Severity: #error
