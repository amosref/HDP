# ILHDP Encounter Inpatient Care Segment
Child encounter representing a unit-based segment or a significant event within hospitalization.

## Canonical
[http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-encounter-inpatient-care-segment](http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-encounter-inpatient-care-segment)

## See also
- [ILHDP Encounter IG](./ILHDP-Encounter-IG.md), especially section 2 on hospitalization and hierarchical encounter flows.

## Guidance
- Required type slice: `type[inpatient-care-segment]` with code `il-core-encounter-type#inpatient-care-segment-hdp`.
- `partOf` is required and should point to the top-level hospitalization or another segment for events.
- `participant` SHOULD include the practitioners or practitioner roles directly involved in care during that segment. If class is ambulatory (AMB), at least one `participant` SHALL be present.
- `location[nursing-unit]` is required; it is identified by encounter-level `location.physicalType = il-core-location-physical-type#hospital-nursing-unit` and must reference a nursing-unit location profile.
- This is distinct from the Location profile itself: the referenced nursing-unit Location is identified by `Location.type`, which carries both `il-core-location-physical-type#hospital-nursing-unit` and `v3-RoleCode#HU`, while the Encounter slice is identified by `Encounter.location.physicalType`.
- Create a new segment when `serviceProvider` changes; update `location` periods for bed changes.
- Hospitalization details belong on the top-level encounter; `hospitalization.dischargeDisposition` is bound to [http://fhir.health.gov.il/ValueSet/patient-release-type-moh](http://fhir.health.gov.il/ValueSet/patient-release-type-moh) (extensible).
- `diagnosis.use` is bound to [http://fhir.health.gov.il/ValueSet/il-core-diagnosis-role](http://fhir.health.gov.il/ValueSet/il-core-diagnosis-role) (extensible).
- `reasonReference` allows ILCore Condition/Procedure/Observation/ImmunizationRecommendation and ILHDP Condition/Observation references; `ILHDPProcedure` and `ILHDPImmunizationRecommendation` are planned. The patient-reported chief complaint uses `ILHDPPatientReportedChiefComplaint`.
- `type[face-to-face]` SHALL NOT be combined with `type[virtual-encounters]` or `type[without-patient-present]`.
- Participant slices for `consultant` and `reffering-practitioner` are inherited from ILCoreEncounter; `participant.individual` allows ILCore + HDP practitioner/practitionerRole/relatedPerson references.
- `subject` references only the HDP Patient profile.

## Related profiles and artifacts
- [ILHDP Location Nursing Unit](./StructureDefinition-il-hdp-location-nursing-unit.doc.md)
- [ILCore Location Nursing Unit](./StructureDefinition-il-core-location-nursing-unit.doc.md)
- [Ext: Resource Role Context](./StructureDefinition-ext-resource-role-context.doc.md)

## Related examples
- [ER segment example](./Encounter-hdp-segment-er.doc.md)
- [Ward A segment example](./Encounter-hdp-segment-ward-a.doc.md)
- [PICC event segment example](./Encounter-hdp-segment-picc.doc.md)
