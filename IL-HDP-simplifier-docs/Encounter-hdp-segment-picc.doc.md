# HDP Inpatient Care Segment - PICC Line Insertion (Example)
This example models a short, event-based segment for a PICC line insertion during the inpatient stay.

## Key points
- **Profile**: `ILHDPEncounterInpatientCareSegment`.
- **Class and type**: Inpatient class (`IMP`) with required `type[inpatient-care-segment]`.
- **Event segment**: Linked to the Ward A segment using `partOf`, illustrating a significant event during care.
- **Participants**: Primary performer is a nurse; secondary performer physician is also recorded.
- **Service provider**: Ward A organizational unit remains the service provider for the event.
- **Location**: Uses a single nursing-unit entry (Ward A Nursing Unit 2) with a short period.
- **Physical type**: `location[nursing-unit].physicalType` is set to ward (`wa`).
- **Reason**: `reasonCode` uses SNOMED CT `425196008` for PICC insertion.

## References in this example
- **Parent encounter**: `Encounter/hdp-segment-ward-a`
- **Patient**: `Patient/il-hdp-patient`
- **Practitioner**: `Practitioner/practitioner-nurse-picc`, `Practitioner/practitioner-md-picc`
- **Organization**: `Organization/hospital1-ward-a`
- **Location**: `Location/hospital1-ward-a-nu2`
