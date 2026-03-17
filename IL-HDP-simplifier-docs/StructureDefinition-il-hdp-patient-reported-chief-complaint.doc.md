# ILHDP Patient Reported Chief Complaint
HDP wrapper for the patient-reported chief complaint observation.

## Canonical
[http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-patient-reported-chief-complaint](http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-patient-reported-chief-complaint)

## Guidance
- Adds required HDP security labeling.
- Inherits the fixed LOINC code `8661-1` from the ILCore profile.
- Use for `Encounter.reasonReference[patient-reported-chief-complaint]`.
- `subject` references only the HDP Patient profile; other references allow ILCore + HDP targets where available.
