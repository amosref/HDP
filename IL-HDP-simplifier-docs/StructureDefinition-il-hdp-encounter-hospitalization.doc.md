# ILHDP Encounter Hospitalization
Top-level hospitalization encounter representing the patient's overall stay, capturing high-level clinical and administrative information. It MAY be used for ambulatory visits if they are managed as a hierarchy in the source system, however, use of ILHDPEncounterCommunityHMOAmbulatory is preferred for simplicity. The combination of ILHDPEncounterHospitalization and ILHDPEncounterInpatientCareSegment SHALL cover all hospitalization scenarios, including general inpatient care, home hospitalization, geriatric, and psychiatric settings. Visits to HMO-operated/community emergency centers MAY be represented either with the hospitalization + inpatient-segment combination (for structured flows) or with ILHDPEncounterCommunityHMOAmbulatory when a simpler, 'flat' representation better reflects the source system. SHALL have type:hospitalization (fixed code).

## Canonical
[http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-encounter-hospitalization](http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-encounter-hospitalization)

## Guidance
- Use for the aggregated hospitalization stay. It MAY be used for ambulatory visits when they are modeled as a hierarchy in the source system; ILHDPEncounterCommunityHMOAmbulatory is preferred for simpler ambulatory flows.
- Required type slice: `type[hospitalization]` with code `il-core-encounter-type#hospitalization-hdp`.
- `partOf` must be absent; segment encounters link to this via `partOf`.
- `location[nursing-unit]` must be absent; nursing units belong on segments.
- `hospitalization.dischargeDisposition` is bound to [http://fhir.health.gov.il/ValueSet/patient-release-type-moh](http://fhir.health.gov.il/ValueSet/patient-release-type-moh) (extensible).
- `diagnosis.use` is bound to [http://fhir.health.gov.il/ValueSet/il-core-diagnosis-role](http://fhir.health.gov.il/ValueSet/il-core-diagnosis-role) (extensible).
- `reasonReference` allows ILCore Condition/Procedure/Observation/ImmunizationRecommendation and ILHDP Condition/Observation references; `ILHDPProcedure` and `ILHDPImmunizationRecommendation` are planned. The patient-reported chief complaint uses `ILHDPPatientReportedChiefComplaint`.
- Enforce encounter reason and period invariants from ILHDP encounter rules.
- `type[face-to-face]` SHALL NOT be combined with `type[virtual-encounters]` or `type[without-patient-present]`.
- Participant slices for `consultant` and `reffering-practitioner` are inherited from ILCoreEncounter; `participant.individual` allows ILCore + HDP practitioner/practitionerRole/relatedPerson references.
- `subject` references only the HDP Patient profile.
