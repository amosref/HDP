# ILHDP Encounter Community/HMO Ambulatory
Community or ambulatory encounter that is typically self-contained.

## Canonical
[http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-encounter-community-hmo-ambulatory](http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-encounter-community-hmo-ambulatory)

## Guidance
- Required type slice: `type[community-hmo-ambulatory]` with code `il-core-encounter-type#community-hmo-ambulatory-hdp`.
- `partOf` must be absent; use `EpisodeOfCare` to group related visits.
- At least one `participant` is required.
- Duration may be short; start or end time can be missing when unknown, but at least one must be present.
- Class SHOULD be `COMMUNITY-OR-HMO` in most cases; MAY be `EMER` for community emergency centers.
- For virtual encounters, class SHALL be `VR` and the virtual type SHALL be indicated by `Encounter.type`.
- `type[face-to-face]` SHALL NOT be combined with `type[virtual-encounters]` or `type[without-patient-present]`.
- `hospitalization` MAY be present for ambulatory encounters when needed (e.g., `specialArrangement`, `dietPreference`). It is typically omitted for routine community/HMO visits.
- `reasonReference` allows ILCore Condition/Procedure/Observation/ImmunizationRecommendation and ILHDP Condition/Observation references; `ILHDPProcedure` and `ILHDPImmunizationRecommendation` are planned. The patient-reported chief complaint uses `ILHDPPatientReportedChiefComplaint`.
- `diagnosis.use` is bound to [http://fhir.health.gov.il/ValueSet/il-core-diagnosis-role](http://fhir.health.gov.il/ValueSet/il-core-diagnosis-role) (extensible).
- Participant slices for `consultant` and `reffering-practitioner` are inherited from ILCoreEncounter; `participant.individual` allows ILCore + HDP practitioner/practitionerRole/relatedPerson references.
- `subject` references only the HDP Patient profile.
- Enforce encounter reason and period invariants from ILHDP encounter rules.
