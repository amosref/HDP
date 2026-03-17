# ILHDP Encounter Supplemental
Supplemental encounter profile used to capture additional encounter context in HDP flows.

## Canonical
[http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-encounter-supplemental](http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-encounter-supplemental)

## Guidance
- Add `meta.security[HDP]` with `system` [http://fhir.health.gov.il/cs/il-hdp-information-buckets](http://fhir.health.gov.il/cs/il-hdp-information-buckets).
- `type[supplemental-encounter]` is required with code `il-core-encounter-type#supplemental-encounter-hdp`.
- `type[hospitalization]`, `type[inpatient-care-segment]`, and `type[community-hmo-ambulatory]` are disallowed.
