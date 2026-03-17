# IL-HDP Encounter Hierarchy Implementation Guide

This document explains how to apply the IL-HDP Encounter profiles in this IG. It is written for FHIR implementers and is aligned with the constraints and examples in this project. The guide separates community/HMO ambulatory encounters (simple, flat) from hospital encounters (hierarchical) so that implementers apply consistent rules. The community/HMO model is described first because it is simpler.

## 1. Profiles at a glance

Community/HMO encounters:

| Profile&nbsp;&nbsp; | Purpose&nbsp;&nbsp; | Key requirements&nbsp;&nbsp; | Simplifier link&nbsp;&nbsp; | Canonical&nbsp;&nbsp; |
| --- | --- | --- | --- | --- |
| ILHDPEncounterCommunityHMOAmbulatory&nbsp;&nbsp; | Community/HMO ambulatory encounter&nbsp;&nbsp; | type[community-hmo-ambulatory] 1..1; partOf 0..0; participant 1..*&nbsp;&nbsp; | [ILHDP Encounter Community/HMO Ambulatory](https://simplifier.net/tmp1-enct-reg-p/ilhdpencountercommunityhmoambulatory)&nbsp;&nbsp; | [http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-encounter-community-hmo-ambulatory](http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-encounter-community-hmo-ambulatory)&nbsp;&nbsp; |



Hospital encounters:

| Profile&nbsp;&nbsp; | Purpose&nbsp;&nbsp; | Key requirements&nbsp;&nbsp; | Simplifier link&nbsp;&nbsp; | Canonical&nbsp;&nbsp; |
| --- | --- | --- | --- | --- |
| ILHDPEncounterHospitalization&nbsp;&nbsp; | Top-level hospitalization encounter&nbsp;&nbsp; | type[hospitalization] 1..1; partOf 0..0; serviceProvider 1..1&nbsp;&nbsp; | [ILHDP Encounter Hospitalization](https://simplifier.net/tmp1-enct-reg-p/ilhdpencounterhospitalization)&nbsp;&nbsp; | [http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-encounter-hospitalization](http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-encounter-hospitalization)&nbsp;&nbsp; |
| ILHDPEncounterInpatientCareSegment&nbsp;&nbsp; | Hospital segment or significant event during hospitalization&nbsp;&nbsp; | type[inpatient-care-segment] 1..1; partOf 1..1; location[nursing-unit] 1..*; participant 1..*&nbsp;&nbsp; | [ILHDP Encounter Inpatient Care Segment](https://simplifier.net/tmp1-enct-reg-p/ilhdpencounterinpatientcaresegment)&nbsp;&nbsp; | [http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-encounter-inpatient-care-segment](http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-encounter-inpatient-care-segment)&nbsp;&nbsp; |



Supplemental encounters:

| Profile&nbsp;&nbsp; | Purpose&nbsp;&nbsp; | Key requirements&nbsp;&nbsp; | Simplifier link&nbsp;&nbsp; | Canonical&nbsp;&nbsp; |
| --- | --- | --- | --- | --- |
| ILHDPEncounterSupplemental&nbsp;&nbsp; | Supplemental encounter for local workflow context&nbsp;&nbsp; | type[supplemental-encounter] 1..1; other HDP encounter type slices 0..0&nbsp;&nbsp; | [ILHDP Encounter Supplemental](https://simplifier.net/tmp1-enct-reg-p/ilhdpencountersupplemental)&nbsp;&nbsp; | [http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-encounter-supplemental](http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-encounter-supplemental)&nbsp;&nbsp; |

Related supporting profiles:
- [ILHDP Location Nursing Unit](https://simplifier.net/tmp1-enct-reg-p/ilhdplocationnursingunit)
- [ILHDP Patient Reported Chief Complaint](https://simplifier.net/tmp1-enct-reg-p/ilhdppatientreportedchiefcomplaint)
- [ILHDP Episode Of Care](https://simplifier.net/tmp1-enct-reg-p/ilhdpepisodeofcare)

## 2. Community/HMO ambulatory encounters

Use **ILHDPEncounterCommunityHMOAmbulatory** for non-admission care in the community or HMO setting:
- The encounter is self-contained and **SHALL NOT use `partOf`**.
- Use **EpisodeOfCare** to connect a series of related ambulatory visits (for example, dialysis or recurring follow-ups).
- Period is typically short (minutes to hours). At least one of `period.start` or `period.end` must be present.
- `class` SHOULD be COMMUNITY-OR-HMO for most cases. If the encounter is virtual and a virtual type is used, `class` must be VR.
- `hospitalization` MAY be present when ambulatory encounters need to capture details such as `specialArrangement` or `dietPreference`. It is typically omitted for routine community/HMO visits.

Example: [HDP Community/HMO Ambulatory GP Visit](https://simplifier.net/tmp1-enct-reg-p/hdp-community-hmo-ambulatory-gp-visit)

## 3. Hospital encounter hierarchy model

Hospital encounters are modeled as a hierarchy. The top-level hospitalization is the anchor. Each inpatient care segment represents care by a specific clinical unit or a significant event. Supplemental encounters represent local workflow sub-encounters and can be linked to the relevant segment.

```
Encounter: Hospitalization (top-level)
  |
  +-- Encounter: Inpatient Care Segment (ER)
  |
  +-- Encounter: Inpatient Care Segment (Ward A)
        |
        +-- Encounter: Inpatient Care Segment (Event, e.g., PICC)
        |
        +-- Encounter: Supplemental (Admission workflow)
```

Key points:
- Use **ILHDPEncounterHospitalization** for the overall admission episode.
- Use **ILHDPEncounterInpatientCareSegment** for each clinical unit segment (ER, ward, ICU) and for clinically significant events that should carry their own participants and artifacts.
- Use **ILHDPEncounterSupplemental** for local workflow context (admission sheet, discharge workflow, etc.).
- For a significant event that occurs within a ward, link the event segment to the ward segment via `partOf`.

## 4. Clinical responsibility vs location

This IG treats **clinical responsibility** and **physical/operational location** as separate concepts. Implementers must map them consistently using the elements below.

| Term&nbsp;&nbsp; | Encounter element&nbsp;&nbsp; | Mapping&nbsp;&nbsp; |
| --- | --- | --- |
| Clinical responsibility&nbsp;&nbsp; | `Encounter.serviceProvider` (Organization)&nbsp;&nbsp; | The clinical unit **accountable for care** during the segment. A change here **drives a new segment**.&nbsp;&nbsp; |
| Nursing unit (physical/operational location context)&nbsp;&nbsp; | `Encounter.location[nursing-unit]` (Location)&nbsp;&nbsp; | The patient’s **care location context** (nursing unit/ward as a Location). **May change without** a change in clinical responsibility. Track transfers by **keeping history** using `location.period` and `location.status`.&nbsp;&nbsp; |
| Bed/room/building history&nbsp;&nbsp; | Additional `Encounter.location` entries&nbsp;&nbsp; | Physical location details (e.g., bed/room). Keep history using `location.period` and `location.status`.&nbsp;&nbsp; |

**Segmentation rules:**
- Create a new InpatientCareSegment when clinical responsibility changes (i.e., `serviceProvider` changes).
- Do NOT create a new segment when only nursing-unit changes, or when only bed/room changes.
- For nursing-unit / bed/room moves: keep the same segment and **append new `Encounter.location` entries** (do not overwrite), closing prior entries via `location.period` and updating `location.status` accordingly. This includes updating the `location[nursing-unit]` slice by adding a new entry when the nursing-unit location changes.

**Location modeling:**
- Inpatient segments require `location` and specifically `location[nursing-unit]`.
- `location[nursing-unit].location` must reference a Location that conforms to ILCoreLocationNursingUnit or ILHDPLocationNursingUnit.
- The nursing unit location type is fixed to `il-core-hospital-nursing-unit` via the ILCoreLocationNursingUnit profile.
- Include physical bed/room history as additional `location` entries when relevant.
- Maintain `location.status` and `location.period` when patients transfer so history can be reconstructed.

Related profile links:
- [ILCore Location Nursing Unit](https://simplifier.net/tmp1-enct-reg-p/ilcorelocationnursingunit)
- [ILHDP Location Nursing Unit](https://simplifier.net/tmp1-enct-reg-p/ilhdplocationnursingunit)

## 5. When to create an event Encounter

Use the following decision matrix to determine whether to create a separate event Encounter:

| Decision factor&nbsp;&nbsp; | Create event Encounter?&nbsp;&nbsp; |
| --- | --- |
| Needs its own lifecycle (status/period) distinct from the segment&nbsp;&nbsp; | Yes&nbsp;&nbsp; |
| Needs distinct clinical responsibility or participants (different team)&nbsp;&nbsp; | Yes&nbsp;&nbsp; |
| You want consumers to query it as a unit of work (e.g., "give me all artifacts for the event")&nbsp;&nbsp; | Yes&nbsp;&nbsp; |

If none of the above apply, represent the event as a Procedure/Observation/ImagingStudy/etc. and link it via `resource.encounter` to the segment (or hospitalization).

Hard rule on linkage:
- Event Encounters MUST have `partOf` pointing to the relevant InpatientCareSegment, if known.
- If the relevant segment is not known, `partOf` MUST point to the top-level Hospitalization.

Worked examples: 
- PICC line insertion should be modeled as an event Encounter, with a Procedure pointing to that event Encounter.
- Routine daily rounds notes should not become an Encounter and should be represented with the appropriate clinical resource linked to the segment.
- External consults or resuscitation events should be represented as event Encounters.

## 6. Supplemental encounters

Supplemental encounters provide local, workflow-specific context without changing the core encounter hierarchy.

Rules from the profile:
- `type[supplemental-encounter]` is required and fixed to `il-core-encounter-type#supplemental-encounter-hdp`.
- `type[hospitalization]`, `type[inpatient-care-segment]`, and `type[community-hmo-ambulatory]` are disallowed (0..0).

The profile does not constrain `partOf`, but the example links a supplemental encounter to the Ward A segment, which is a recommended pattern when the supplemental context is specific to one segment.

Example: [HDP Supplemental Admission Ward A](https://simplifier.net/tmp1-enct-reg-p/hdp-supplemental-admission-ward-a)

## 7. Common rules across IL-HDP Encounter profiles

These rules come from `ILHDPEncounterCommon` and the relevant invariants:

- **Subject**: Must reference ILHDP Patient ([http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-patient](http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-patient)).
- **Identifiers**: `identifier` is required (1..*).
- **Period**:
  - `period.start` must be present when status is not `planned`.
  - If status is `finished`, `period.end` or `length` must be present.
  - For community/HMO encounters, at least one of `period.start` or `period.end` must be present.
- **Reason**: Each encounter must have `reasonCode` or `reasonReference`.
- **Encounter type**: `type` is required and sliced by pattern using `il-core-encounter-type` codes.
- **Participants**: `participant.individual` is required for each participant and must be a Practitioner/PractitionerRole/RelatedPerson profile from IL Core or IL HDP.
- **Face-to-face vs virtual**: `type[face-to-face]` cannot be combined with virtual encounter types or `without-patient-present`.

Security labeling (meta.security) per encounter profile:
- ILHDPEncounterCommunityHMOAmbulatory: MUST include `meta.security` with system `http://fhir.health.gov.il/cs/il-hdp-information-buckets`; use code `encounterInformation`.
- ILHDPEncounterHospitalization: MUST include `meta.security` with system `http://fhir.health.gov.il/cs/il-hdp-information-buckets`; use code `encounterInformation`.
- ILHDPEncounterInpatientCareSegment: MUST include `meta.security` with system `http://fhir.health.gov.il/cs/il-hdp-information-buckets`; use code `encounterInformation`.
- ILHDPEncounterSupplemental: MUST include `meta.security` with system `http://fhir.health.gov.il/cs/il-hdp-information-buckets`; use code `encounterInformation`.

## 8. Participants and roles

`Encounter.participant` is sliced in IL Core and inherited by IL-HDP profiles:
- `participant[primary-performer]` is fixed to `v3-ParticipationType#PPRF`.
- `participant[consultant]` is fixed to `v3-ParticipationType#CON`.
- `participant[reffering-practitioner]` is fixed to `v3-ParticipationType#REF`.

Because the slicing is **open**, additional participants can be added using `participant[+]` with other v3 ParticipationType codes (for example, `SPRF` for secondary performer).

Profile-specific expectations:
- **Hospitalization**: participants are optional; can include clinicians not tied to a specific segment.
- **Inpatient care segment**: participants are required and should include all clinicians (either directly or via PractitionerRole) involved in the segment.
- **Community/HMO**: participants are required; typically include the primary performer (e.g., GP).

## 9. Linking other resources to encounters

Resources should be linked to the most specific encounter that represents the clinical context.

Common linking patterns:
- **Condition / Procedure / Observation**:
  - Use `Resource.encounter` to point to the relevant encounter (segment or hospitalization).
  - Use `Encounter.reasonReference` to list conditions or procedures that justify the encounter or segment.
  - Use `Encounter.diagnosis` for coded diagnosis roles.
- **Workflow stage and operational context**:
  - Use `ext-resource-role-context` to associate resources with internal workflow stages and operational identifiers.
  - The value set currently includes admission, hospitalization, and discharge codes, but the binding is extensible to allow organization-specific stages and hierarchy levels.
  - Use `roleOperationalContext` for local business identifiers and `roleEncounterContext` when a distinct context Encounter is needed.
  - Example: [Admission BP observation](https://simplifier.net/tmp1-enct-reg-p/hdp-bp-admission-ward-a) links to a supplemental admission encounter using `roleEncounterContext`.

Relevant extension:
- [ext-resource-role-context](http://fhir.health.gov.il/StructureDefinition/ext-resource-role-context) (IL Core)

## 10. Terminology summary

Key code systems and value sets used by the IL-HDP Encounter profiles:

| Artifact&nbsp;&nbsp; | Usage&nbsp;&nbsp; | Link&nbsp;&nbsp; |
| --- | --- | --- |
| CodeSystem: il-core-encounter-type&nbsp;&nbsp; | Sliced codes for Encounter.type&nbsp;&nbsp; | [il-core-encounter-type](https://simplifier.net/tmp1-enct-reg-p/il-core-encounter-type)&nbsp;&nbsp; |
| CodeSystem: il-core-encounter-class&nbsp;&nbsp; | Encounter.class codes&nbsp;&nbsp; | [il-core-encounter-class](https://simplifier.net/tmp1-enct-reg-p/il-core-encounter-class)&nbsp;&nbsp; |
| CodeSystem: il-core-diagnosis-role&nbsp;&nbsp; | Primary and secondary diagnosis roles&nbsp;&nbsp; | [il-core-diagnosis-role](https://simplifier.net/tmp1-enct-reg-p/il-core-diagnosis-role)&nbsp;&nbsp; |
| CodeSystem: il-core-hospital-nursing-unit&nbsp;&nbsp; | Location.type for nursing units&nbsp;&nbsp; | [il-core-hospital-nursing-unit](https://simplifier.net/tmp1-enct-reg-p/il-core-hospital-nursing-unit)&nbsp;&nbsp; |
| ValueSet: il-core-encounter-type&nbsp;&nbsp; | Encounter.type binding&nbsp;&nbsp; | [il-core-encounter-type](https://simplifier.net/tmp1-enct-reg-p/il-core-encounter-type)&nbsp;&nbsp; |
| ValueSet: il-core-encounter-reason-codes&nbsp;&nbsp; | Encounter.reasonCode binding&nbsp;&nbsp; | [il-core-encounter-reason-codes](https://simplifier.net/tmp1-enct-reg-p/il-core-encounter-reason-codes)&nbsp;&nbsp; |
| ValueSet: il-core-diagnosis-role&nbsp;&nbsp; | Encounter.diagnosis.use binding&nbsp;&nbsp; | [il-core-diagnosis-role](https://simplifier.net/tmp1-enct-reg-p/il-core-diagnosis-role)&nbsp;&nbsp; |
| ValueSet: patient-release-type-moh&nbsp;&nbsp; | hospitalization.dischargeDisposition&nbsp;&nbsp; | [patient-release-type-moh](https://simplifier.net/tmp1-enct-reg-p/patient-release-type-moh)&nbsp;&nbsp; |

Encounter.type codes (from `il-core-encounter-type`) used in this IG:
- `hospitalization-hdp`
- `inpatient-care-segment-hdp`
- `community-hmo-ambulatory-hdp`
- `supplemental-encounter-hdp`
- `without-patient-present` (when applicable)

The `il-core-diagnosis-role` value set combines HL7 diagnosis-role codes with IL Core additions. IL Core adds:
- `primary-diagnosis`
- `secondary-diagnosis`

Participant type codes use HL7 v3 ParticipationType:
- `PPRF` (primary performer)
- `CON` (consultant)
- `REF` (referring practitioner)
- `SPRF` (secondary performer)

## 11. Examples

Hospital hierarchy:
- [Hospitalization](https://simplifier.net/tmp1-enct-reg-p/hdp-hospitalization-hospital1)
- [ER segment](https://simplifier.net/tmp1-enct-reg-p/hdp-segment-er)
- [Ward A segment](https://simplifier.net/tmp1-enct-reg-p/hdp-segment-ward-a)
- [PICC event segment](https://simplifier.net/tmp1-enct-reg-p/hdp-segment-picc)
- [Supplemental admission](https://simplifier.net/tmp1-enct-reg-p/hdp-supplemental-admission-ward-a)

Community/HMO:
- [GP visit](https://simplifier.net/tmp1-enct-reg-p/hdp-community-hmo-ambulatory-gp-visit)

Supporting observations:
- [Chief complaint (hospitalization)](https://simplifier.net/tmp1-enct-reg-p/hdp-chief-complaint-hospitalization)
- [Chief complaint (GP visit)](https://simplifier.net/tmp1-enct-reg-p/hdp-chief-complaint-gp-visit)
- [Admission BP (Ward A)](https://simplifier.net/tmp1-enct-reg-p/hdp-bp-admission-ward-a)
