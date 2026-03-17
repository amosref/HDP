# ILHDP Encounter Inpatient Care Segment
Child encounter representing a unit-based segment or a significant event within hospitalization.

## Canonical
[http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-encounter-inpatient-care-segment](http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-encounter-inpatient-care-segment)

## Guidance
- Required type slice: `type[inpatient-care-segment]` with code `il-core-encounter-type#inpatient-care-segment-hdp`.
- `partOf` is required and should point to the top-level hospitalization or another segment for events.
- At least one `participant` is required.
- `location[nursing-unit]` is required and must reference a nursing-unit location profile.
- Create a new segment when `serviceProvider` changes; update `location` periods for bed changes.
- Hospitalization details belong on the top-level encounter; `hospitalization.dischargeDisposition` is bound to [http://fhir.health.gov.il/ValueSet/patient-release-type-moh](http://fhir.health.gov.il/ValueSet/patient-release-type-moh) (extensible).
- `diagnosis.use` is bound to [http://fhir.health.gov.il/ValueSet/il-core-diagnosis-role](http://fhir.health.gov.il/ValueSet/il-core-diagnosis-role) (extensible).
- `reasonReference` allows ILCore Condition/Procedure/Observation/ImmunizationRecommendation and ILHDP Condition/Observation references; `ILHDPProcedure` and `ILHDPImmunizationRecommendation` are planned. The patient-reported chief complaint uses `ILHDPPatientReportedChiefComplaint`.
- `type[face-to-face]` SHALL NOT be combined with `type[virtual-encounters]` or `type[without-patient-present]`.
- Participant slices for `consultant` and `reffering-practitioner` are inherited from ILCoreEncounter; `participant.individual` allows ILCore + HDP practitioner/practitionerRole/relatedPerson references.
- `subject` references only the HDP Patient profile.
