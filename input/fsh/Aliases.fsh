// extensions
Alias: $effective =    http://hl7.org/fhir/StructureDefinition/codesystem-effectiveDate
Alias: $ext-processing-practitioner =  http://fhir.health.gov.il/StructureDefinition/ext-processing-practitioner
// Alias: $ext-processing-practitioner =  http://fhir.health.gov.il/StructureDefinition/ext-hdp-processing-practitioner
Alias: $ext-processing-location =  http://fhir.health.gov.il/StructureDefinition/ext-processing-location
Alias: $ext-specimen-collector-reference =  http://fhir.health.gov.il/StructureDefinition/ext-hdp-specimen-collector-reference
Alias: $ext-qualification-practice =  http://fhir.health.gov.il/StructureDefinition/ext-qualification-practice
// Codesystems
Alias: $info-buckets = http://fhir.health.gov.il/cs/il-hdp-information-buckets
Alias: $ucum =         http://unitsofmeasure.org
Alias: $obs-cat =      http://terminology.hl7.org/CodeSystem/observation-category
Alias: $city-code =                     http://fhir.health.gov.il/cs/city-symbol

// VSs
Alias: $vs-info-buckets =  http://fhir.health.gov.il/ValueSet/il-hdp-information-buckets
Alias: $vs-il-hdp-condition-code =  http://hdp.fhir.health.gov.il/ValueSet/il-hdp-condition-code
Alias: $vs-observation-meta =  http://hdp.fhir.health.gov.il/ValueSet/il-hdp-observation-information-buckets
Alias: $vs-observation-lab-meta =  http://hdp.fhir.health.gov.il/ValueSet/il-hdp-observation-lab-information-buckets
Alias: $vs-service-request-meta =  http://hdp.fhir.health.gov.il/ValueSet/il-hdp-service-request-information-buckets
Alias: $vs-specimen-meta =  http://hdp.fhir.health.gov.il/ValueSet/il-hdp-specimen-information-buckets
Alias: $vs-substance-meta =  http://hdp.fhir.health.gov.il/ValueSet/il-hdp-substance-information-buckets
Alias: $vs-diagnostic-report-meta =  http://hdp.fhir.health.gov.il/ValueSet/il-hdp-diagnostic-report-information-buckets
Alias: $vs-document-reference-meta =  http://hdp.fhir.health.gov.il/ValueSet/il-hdp-document-reference-information-buckets
Alias: $vs-hdp-document-types = http://hdp.fhir.health.gov.il/ValueSet/il-hdp-document-types
Alias: $vs-il-hdp-organization-types = http://hdp.fhir.health.gov.il/ValueSet/il-hdp-organization-types

Alias: $sct = http://snomed.info/sct
Alias: $loinc =                         http://loinc.org
Alias: $data-absent-reason =            http://hl7.org/fhir/StructureDefinition/data-absent-reason
Alias: $DAB-CS =                        http://terminology.hl7.org/CodeSystem/data-absent-reason
Alias: $il-id =                         http://fhir.health.gov.il/identifier/il-national-id
Alias: $payer =                         http://fhir.health.gov.il/cs/paying-entity-moh
Alias: $city-symbol =                     http://fhir.health.gov.il/cs/city-symbol
Alias: $alternet-reference =            http://hl7.org/fhir/StructureDefinition/alternate-reference

// IL-HDP profiles
Alias: $ILHDPPatient =                  http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-patient
Alias: $ILHDPPractitioner =             http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-practitioner
Alias: $ILHDPPractitionerRole =         http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-practitioner-role
Alias: $ILHDPOrganization =             http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-organization
Alias: $ILHDPServiceRequest =           http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-service-request
Alias: $ILHDPCareTeam =                 http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-care-team
Alias: $ILHDPCondition =                http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-condition
Alias: $ILHDPObservation =              http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-observation
Alias: $ILHDPLocation =                 http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-location
Alias: $ILHDPRelatedPerson =            http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-related-person
Alias: $ILHDPLocationNursingUnit =      http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-location-nursing-unit
Alias: $ILHDPPatientReportedChiefComplaint = http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-patient-reported-chief-complaint

// Profiles
Alias: $ILLocation                                   = http://fhir.health.gov.il/StructureDefinition/il-core-location
Alias: $ILLocationNursingUnit                        = http://fhir.health.gov.il/StructureDefinition/il-core-location-nursing-unit
Alias: $ILOrganization                               = http://fhir.health.gov.il/StructureDefinition/il-core-organization
Alias: $ext-resource-role-context                    = http://fhir.health.gov.il/StructureDefinition/ext-resource-role-context

// Identifiers
Alias: $legal-entity                                 = http://fhir.health.gov.il/identifier/legal-entity

// CodeSystems
Alias: $condition-category                           = http://terminology.hl7.org/CodeSystem/condition-category
Alias: $condition-clinical                           = http://terminology.hl7.org/CodeSystem/condition-clinical
Alias: $condition-ver-status                         = http://terminology.hl7.org/CodeSystem/condition-ver-status
Alias: $department-type-moh                          = http://fhir.health.gov.il/cs/department-type-moh
Alias: $diagnosis-role                               = http://terminology.hl7.org/CodeSystem/diagnosis-role
Alias: $il-core-encounter-class                      = http://fhir.health.gov.il/cs/il-core-encounter-class
Alias: $il-core-encounter-type                       = http://fhir.health.gov.il/cs/il-core-encounter-type
Alias: $il-core-hospital-nursing-unit                = http://fhir.health.gov.il/cs/il-core-hospital-nursing-unit
Alias: $il-core-resource-role-context                = http://fhir.health.gov.il/cs/il-core-resource-role-context
Alias: $institution-type-moh                         = http://fhir.health.gov.il/cs/institution-type-moh
Alias: $patient-release-type-moh                     = http://fhir.health.gov.il/cs/patient-release-type-moh
Alias: $patient-visit-reason-moh                     = http://fhir.health.gov.il/cs/patient-visit-reason-moh
Alias: $v3-ActCode                                   = http://terminology.hl7.org/CodeSystem/v3-ActCode

// ValueSets
Alias: $vs-il-core-diagnosis-role                    = http://fhir.health.gov.il/ValueSet/il-core-diagnosis-role
Alias: $vs-il-hdp-information-buckets                = http://fhir.health.gov.il/ValueSet/il-hdp-information-buckets
Alias: $vs-patient-release-type-moh                  = http://fhir.health.gov.il/ValueSet/patient-release-type-moh


Alias: $il-core-diagnosis-role       = http://fhir.health.gov.il/cs/il-core-diagnosis-role
Alias: $nurse-license-moh            = http://practitioners.health.gov.il/Nurses
Alias: $practitioner-license-moh     = http://practitioners.health.gov.il/Practitioners

// to DELETE
Alias: $ext-device-dispense-when-handed-over = http://fhir.health.gov.il/StructureDefinition/ext-device-dispense-when-handed-over
