# ILHDP EpisodeOfCare
HDP wrapper for EpisodeOfCare with required security labeling.

## Canonical
[http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-episode-of-care](http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-episode-of-care)

## Guidance
- Add `meta.security[HDP]` with `system` [http://fhir.health.gov.il/cs/il-hdp-information-buckets](http://fhir.health.gov.il/cs/il-hdp-information-buckets).
- Use `meta.security[HDP].code` for the appropriate information bucket.
- References allow ILCore + HDP targets (organization, service request, care team).
- `patient` references only the HDP Patient profile.
