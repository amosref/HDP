# HDP Hospitalization Encounter - Hospital1 (Example)
This example represents the top-level hospitalization encounter for a patient admitted with pneumonia. It anchors ER and ward segments via child encounters.

## Key points
- **Profile**: `ILHDPEncounterHospitalization`.
- **Encounter identity**: `identifier` represents the admission encounter ID in the hospital system.
- **Class and type**: `class` is inpatient (`IMP`), and `type[hospitalization]` is fixed to `il-core-encounter-type#hospitalization-hdp`. A `face-to-face` type is also present.
- **Status and class history**: `statusHistory` and `classHistory` show the transition from ER (`EMER`) to inpatient (`IMP`) and the final finished state.
- **Participants**: Includes primary and secondary performers across ER, Ward A, and PICC care team members.
- **Period**: Start and end cover the full hospitalization window.
- **Service provider**: The hospital organization is referenced as the service provider.
- **Reason and diagnoses**:
  - `reasonCode` uses the MoH visit reason value set.
  - `reasonReference` points to the pneumonia condition and the patient-reported chief complaint.
  - `diagnosis` includes admission, primary diagnosis, and comorbidity entries with ranks.
- **Hospitalization details**: `hospitalization.dischargeDisposition` uses the MoH discharge disposition code `2` ("שחרור הביתה").

## References in this example
- **Patient**: `Patient/il-hdp-patient`
- **Practitioner**: `Practitioner/practitioner-md`, `Practitioner/practitioner-nurse`, `Practitioner/practitioner-md-ward-a`, `Practitioner/practitioner-nurse-ward-a`, `Practitioner/practitioner-nurse-picc`, `Practitioner/practitioner-md-picc`
- **Organization**: `Organization/hospital1`
- **Conditions**: `Condition/hdp-pneumonia`, `Condition/hdp-type-2-diabetes`
- **Chief complaint**: `Observation/hdp-chief-complaint-hospitalization`

## Related child encounters
- ER evaluation segment: `Encounter/hdp-segment-er`
- Ward A inpatient segment: `Encounter/hdp-segment-ward-a`
- PICC procedure segment: `Encounter/hdp-segment-picc`
