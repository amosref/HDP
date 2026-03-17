# HDP Inpatient Care Segment - Internal Ward A (Example)
This example represents the inpatient ward segment, including a nursing-unit transfer and bed-level location history.

## Key points
- **Profile**: `ILHDPEncounterInpatientCareSegment`.
- **Class and type**: Inpatient class (`IMP`) with required `type[inpatient-care-segment]`.
- **Part of hospitalization**: `partOf` links to the top-level hospitalization encounter.
- **Participants**: Primary performer and secondary performer roles are present for Ward A staff.
- **Service provider**: Ward A organizational unit is the `serviceProvider`.
- **Nursing-unit history**:
  - `location[nursing-unit][0]` records Ward A nursing unit.
  - `location[nursing-unit][1]` records the transfer to Ward B nursing unit.
- **Physical bed history**:
  - `location` entries reference specific beds/rooms with periods.
  - Demonstrates how bed moves are modeled without creating new segment encounters.
- **Physical type**: `location.physicalType` uses HL7 physical type codes for bed locations.
- **Reason and diagnoses**:
  - `reasonReference` points to pneumonia.
  - `diagnosis[comorbidity]` references diabetes.

## References in this example
- **Parent encounter**: `Encounter/hdp-hospitalization-hospital1`
- **Patient**: `Patient/il-hdp-patient`
- **Practitioner**: `Practitioner/practitioner-md-ward-a`, `Practitioner/practitioner-nurse-ward-a`
- **Organization**: `Organization/hospital1-ward-a`
- **Locations**:
  - Nursing units: `Location/hospital1-ward-a-nu1`, `Location/hospital1-ward-b-nu1`
  - Beds: `Location/hospital1-ward-a-room-12-bed-2`, `Location/hospital1-ward-b-room-05-bed-1`
- **Conditions**: `Condition/hdp-pneumonia`, `Condition/hdp-type-2-diabetes`
