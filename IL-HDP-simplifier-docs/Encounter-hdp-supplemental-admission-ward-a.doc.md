# HDP Supplemental Encounter - Ward A Admission (Example)
This example shows how to capture admission-stage workflow details using the supplemental encounter profile.

## Key points
- **Profile**: `ILHDPEncounterSupplemental`.
- **Type**: Uses the fixed `type[supplemental-encounter]` with `il-core-encounter-type#supplemental-encounter-hdp`.
- **Purpose**: Represents an admission sheet or operational sub-encounter that complements the main Ward A segment.
- **Period**: Short interval inside the Ward A segment.
- **Part of**: Linked to the Ward A inpatient segment using `partOf`.
- **Security tagging**: Uses the HDP encounter information bucket in `meta.security`.

## References in this example
- **Parent encounter**: `Encounter/hdp-segment-ward-a`
- **Patient**: `Patient/il-hdp-patient`
- **Organization**: `Organization/hospital1-ward-a`
