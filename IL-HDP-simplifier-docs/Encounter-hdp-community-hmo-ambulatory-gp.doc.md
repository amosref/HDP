# HDP Community/HMO Ambulatory Encounter - GP Visit (Example)
This example demonstrates a simple, face-to-face GP visit in a community/HMO clinic using the ILHDP community/ambulatory encounter profile.

## Key points
- **Profile**: `ILHDPEncounterCommunityHMOAmbulatory`.
- **Encounter identity**: `identifier` is populated with an HMO-specific system/value for traceability.
- **Class and type**: `class` is `COMMUNITY-OR-HMO`, and `type[community-hmo-ambulatory]` uses `il-core-encounter-type#community-hmo-ambulatory-hdp`. A `face-to-face` type is also present.
- **Participants**: Includes a `primary-performer` (the GP), showing how clinician participation is represented.
- **Period**: Short visit with start and end times; aligns with ambulatory guidance.
- **Service provider**: HMO organization referenced, including an identifier for the legal entity.
- **Reason and diagnosis**:
  - `reasonCode` uses a SNOMED code for routine check-up.
  - `reasonReference` points to a condition and the patient-reported chief complaint observation.
  - `diagnosis` uses the ILCore diagnosis role value set with a primary diagnosis and rank.

## References in this example
- **Patient**: `Patient/il-hdp-patient`
- **Practitioner**: `Practitioner/practitioner-md`
- **Organization**: `Organization/HMO1`
- **Condition**: `Condition/type-1-diabetes`
- **Chief complaint**: `Observation/hdp-chief-complaint-gp-visit`
