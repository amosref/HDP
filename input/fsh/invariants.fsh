Invariant: prac-ident-enc
Description: "identifier must contain at least one member with either: 1.system = http://fhir.health.gov.il/identifier/encrypted-id-primary-moh; OR a value from PassportEncUri"
Expression: "identifier.where(value.memberOf('http://fhir.health.gov.il/ValueSet/passport-enc-uri') or system='http://fhir.health.gov.il/identifier/encrypted-id-primary-moh').exists()"
Severity: #error

Invariant: prac-role-code-specialty 
Description: "Must contain at lease 'code' or 'specialty'"
Expression: "code.exists() or specialty.exists()"
Severity: #error

Invariant: effective-start-end
Description: "effectivePeriod.start and effectivePeriod.end SHALL have a value if extension:courseOfTherapyType is 'continuous' and status is 'stopped'"
Expression: "status = 'stopped' and extension('http://fhir.health.gov.il/StructureDefinition/ext-medication-course-of-therapy-type').value.ofType(CodeableConcept).coding.where(system = 'http://terminology.hl7.org/CodeSystem/medicationrequest-course-of-therapy' and code = 'continuous').exists() implies (effectivePeriod.start.exists() and effectivePeriod.end.exists())"
Severity: #warning
