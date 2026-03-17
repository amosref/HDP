# ILHDP Location Nursing Unit
HDP wrapper for nursing unit locations with security labeling.

## Canonical
[http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-location-nursing-unit](http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-location-nursing-unit)

## Guidance
- Add `meta.security[HDP]` with `system` [http://fhir.health.gov.il/cs/il-hdp-information-buckets](http://fhir.health.gov.il/cs/il-hdp-information-buckets).
- Use this profile for nursing-unit locations referenced by inpatient care segments.
- `managingOrganization` and `partOf` accept ILCore and ILHDP references.
- Inherits `type` fixed to `il-core-hospital-nursing-unit` from ILCore.
