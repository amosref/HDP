# HDP Patient Reported Chief Complaint - Hospital Admission (Example)
This example captures the patient-reported chief complaint at admission, linked to the hospitalization encounter.

## Key points
- **Profile**: `ILHDPPatientReportedChiefComplaint`.
- **Code**: LOINC `8661-1` (Chief complaint - Reported).
- **Encounter context**: Linked to the top-level hospitalization encounter.
- **Value**: `valueString` captures the reported symptoms.
- **Performer**: Recorded by the admitting physician.

## References in this example
- **Patient**: `Patient/il-hdp-patient`
- **Encounter**: `Encounter/hdp-hospitalization-hospital1`
- **Practitioner**: `Practitioner/practitioner-md`
