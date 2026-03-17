# HDP Inpatient Care Segment - ER Evaluation (Example)
This example models the emergency department segment that precedes admission to the inpatient ward.

## Key points
- **Profile**: `ILHDPEncounterInpatientCareSegment`.
- **Class and type**: `class` is `EMER` and `type[inpatient-care-segment]` is fixed to `il-core-encounter-type#inpatient-care-segment-hdp`.
- **Status and class history**: `statusHistory` and `classHistory` capture the segment timeline.
- **Part of hospitalization**: `partOf` links to the top-level hospitalization encounter.
- **Participants**: Includes a primary performer (physician) and a secondary performer (nurse).
- **Service provider**: ER organizational unit is the `serviceProvider`.
- **Location**: Uses `location[nursing-unit]` to indicate the ER nursing unit with a defined period.
- **Reason and diagnosis**: `reasonReference` and `diagnosis[admission]` point to the pneumonia condition.

## References in this example
- **Parent encounter**: `Encounter/hdp-hospitalization-hospital1`
- **Patient**: `Patient/il-hdp-patient`
- **Practitioner**: `Practitioner/practitioner-md`, `Practitioner/practitioner-nurse`
- **Organization**: `Organization/hospital1-er`
- **Location**: `Location/hospital1-er-nu`
- **Condition**: `Condition/hdp-pneumonia`
