# Practitioner Role for PCM Assisted Consent

**Artifact:** StructureDefinition/il-hdp-pcm-assisted-practitioner-role
**Canonical URL:** http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-pcm-assisted-practitioner-role
**Simplifier:** [ILHDPPCMPractitionerRoleAssisted](https://simplifier.net/il-hdp/ILHDPPCMPractitionerRoleAssisted)

## Overview
Profile used to retrieve PractitionerRole details provided by healthcare organizations for assisted consent flows, so PCM can authenticate the assisting practitioner before assisted consent actions.

## Usage Guidance
- Use this profile when a healthcare organization needs to expose practitioner assisted-consent authentication details via `PractitionerRole`.
- Identifier usage: exactly one identifier is allowed. It is the practitioner's internal healthcare-organization identifier (`identifier.system` + `identifier.value`), where `identifier.system` is organization-defined. `identifier.type` is mandatory and fixed to `strong-id` from `http://fhir.health.gov.il/cs/il-core-identifier-type`, aligning to the strong identifier definition from regulation.
- Uniqueness rule: the HO SHALL NOT expose more than one active assisted-consent `PractitionerRole` with the same `identifier.value`.
- Role classification: `PractitionerRole.code` is mandatory and fixed to `system = http://fhir.health.gov.il/cs/il-core-practitioner-role`, `code = consent-assistant`, so this role can be distinguished from other PractitionerRole records.
- `organization` reference is mandatory.
- Telecom usage: exactly one SMS telecom is allowed and used for OTP delivery. The telecom must include `contactpoint-purpose` with code `OTP` from `http://fhir.health.gov.il/cs/il-core-contact-point-purpose` to explicitly mark it as the OTP channel.
- `meta.security` must include an `informationBucket` label with `system = http://fhir.health.gov.il/cs/hdp-information-buckets` and `code = practitioner`. Additional security labels are allowed.
- Retrieval rule: PCM SHALL search with `active=true` when resolving assisted-consent practitioner roles.
- Scope rule: only `PractitionerRole` resources with `code=http://fhir.health.gov.il/cs/il-core-practitioner-role|consent-assistant` are in scope for assisted-consent authentication.
- Identity overlap rule: the same natural person MAY appear in other `Practitioner` or `PractitionerRole` resources.
- Practitioner linkage rule: the healthcare organization MAY include `PractitionerRole.practitioner` to link this assisted-consent role to an existing `Practitioner` resource. PCM SHALL NOT require this reference for authentication; the authoritative resource for assisted-consent authentication is the `PractitionerRole` itself.

## Referenced Profiles and Extensions
- [contactpoint-purpose](https://simplifier.net/pcm-il/contactpoint-purpose)

## Key Constraints
- PractitionerRole.identifier (cardinality 1..1)
- PractitionerRole.identifier.use (cardinality 1..1; fixed code = official)
- PractitionerRole.identifier.system (cardinality 1..1)
- PractitionerRole.identifier.value (cardinality 1..1)
- PractitionerRole.identifier.type.coding.system (cardinality 1..1; fixed uri = http://fhir.health.gov.il/cs/il-core-identifier-type)
- PractitionerRole.identifier.type.coding.code (cardinality 1..1; fixed code = strong-id)
- PractitionerRole.code (cardinality 1..1)
- PractitionerRole.code.coding.system (cardinality 1..1; fixed uri = http://fhir.health.gov.il/cs/il-core-practitioner-role)
- PractitionerRole.code.coding.code (cardinality 1..1; fixed code = consent-assistant)
- PractitionerRole.practitioner (cardinality 0..1; optional link to a Practitioner resource, not required by PCM for authentication)
- PractitionerRole.organization (cardinality 1..1)
- PractitionerRole.active (cardinality 1..1)
- PractitionerRole.telecom (cardinality 1..1)
- PractitionerRole.telecom.system (cardinality 1..1; fixed code = sms)
- PractitionerRole.telecom.value (cardinality 1..1)
- PractitionerRole.telecom.extension:purpose (cardinality 1..1)
- PractitionerRole.telecom.extension:purpose.valueCodeableConcept.coding.system (cardinality 1..1; fixed uri = http://fhir.health.gov.il/cs/il-core-contact-point-purpose)
- PractitionerRole.telecom.extension:purpose.valueCodeableConcept.coding.code (cardinality 1..1; fixed code = OTP)
- PractitionerRole.meta.security (cardinality 1..*)
- PractitionerRole.meta.security:informationBucket (cardinality 1..1)
- PractitionerRole.meta.security:informationBucket.system (fixed uri = http://fhir.health.gov.il/cs/hdp-information-buckets)
- PractitionerRole.meta.security:informationBucket.code (fixed code = practitioner)

## FHIR REST Search Example
Search PractitionerRole by identifier value and assisted-consent role (search parameter `role`, token on `PractitionerRole.code`), filtered to active roles:

```http
GET [base]/PractitionerRole?identifier=PRAC-123456&role=http://fhir.health.gov.il/cs/il-core-practitioner-role|consent-assistant&active=true
```

This returns PractitionerRole resources matching the identifier, expected to conform to [ILHDPPCMPractitionerRoleAssisted](https://simplifier.net/il-hdp/ILHDPPCMPractitionerRoleAssisted).
