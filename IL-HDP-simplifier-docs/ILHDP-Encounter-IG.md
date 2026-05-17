# IL-HDP Encounter Implementation Guide (Version 2)

This implementation guide defines two primary Encounter-sharing scenarios:

1. Community/HMO/ambulatory visits represented as short, self-contained encounters.
2. Hospitalization and other hierarchical care flows represented as a top-level encounter with child care segments.

In addition to these two primary scenarios, the IG also covers several important related patterns:

- emergency care centers
- hospital ambulatory clinics
- home hospitalization
- recurring daily hospitalization programs
- optional rich local encounter hierarchies shared side by side with the mandatory simplified model

The governing design principle is to provide data consumers with a clinically meaningful and reasonably uniform view of encounters without requiring them to understand the internal workflow structure of each healthcare organization. Where source systems are richer or more complex than the mandatory model, this IG provides optional mechanisms for expressing that additional detail without making consumers dependent on it.

## Quick Profile Inventory

The following table provides a compact profile reference for the main artifacts used by this IG.

| Profile | Purpose | Simplifier link | Canonical |
| --- | --- | --- | --- |
| `ILHDPEncounterCommunityHMOAmbulatory` | Community/HMO ambulatory encounter | [ILHDP Encounter Community/HMO Ambulatory](https://simplifier.net/hdp-il/ilhdpencountercommunityhmoambulatory) | [http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-encounter-community-hmo-ambulatory](http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-encounter-community-hmo-ambulatory) |
| `ILHDPEncounterHospitalization` | Top-level hospitalization encounter | [ILHDP Encounter Hospitalization](https://simplifier.net/hdp-il/ilhdpencounterhospitalization) | [http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-encounter-hospitalization](http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-encounter-hospitalization) |
| `ILHDPEncounterInpatientCareSegment` | Child segment or significant event within hospitalization | [ILHDP Encounter Inpatient Care Segment](https://simplifier.net/hdp-il/ilhdpencounterinpatientcaresegment) | [http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-encounter-inpatient-care-segment](http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-encounter-inpatient-care-segment) |
| `ILHDPEncounterSupplemental` | Supplemental encounter for local workflow context | [ILHDP Encounter Supplemental](https://simplifier.net/hdp-il/ilhdpencountersupplemental) | [http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-encounter-supplemental](http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-encounter-supplemental) |
| `ILHDPEpisodeOfCareRecurringDailyHospitalization` | Top-level recurring daily hospitalization program entity | [ILHDP EpisodeOfCare Recurring Daily Hospitalization](https://simplifier.net/hdp-il/ilhdpepisodeofcarerecurringdailyhospitalization) | [http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-episode-of-care-recurring-daily-hospitalization](http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-episode-of-care-recurring-daily-hospitalization) |

Additional supporting profiles and related artifacts are listed in [section 8.2](#82-supporting-profiles-and-related-artifacts).

## 1. Community/HMO/Ambulatory Visits

Primary profile: `ILHDPEncounterCommunityHMOAmbulatory`

The primary use case addressed by this scenario is a visit to an HMO GP or specialist in the community. The assumption is that such visits are generally short, typically lasting from minutes to a few hours, and are expected to be flat and self-contained rather than hierarchical in nature.

In some cases, multiple short visits are clinically related. For example, a patient may see a GP, then be sent to a nurse for ECG, and then return to the GP. In such cases, each visit will ordinarily be represented by a separate Encounter. If a relationship between those visits exists in the source systems, that relationship SHOULD be expressed through `episodeOfCare` and/or `basedOn`, not through `partOf`.

This profile MAY also be used for hospital ambulatory clinic visits when those visits can be expressed as short, self-contained encounters similar to HMO visits. In many hospitals, however, ambulatory visits are modeled hierarchically. In those cases, the hierarchical model described in [section 2](#2-hospitalization-and-other-hierarchical-encounter-flows) is more appropriate. The choice between the flat and hierarchical models is intentionally left to the healthcare organization and SHOULD reflect the way data is actually modeled in local operational systems.

This profile MAY also be used for emergency care center visits when those visits are operationally represented as short and self-contained. If emergency care center workflows are modeled as a hierarchy, the hierarchical model SHOULD be used instead.

### 1.1 Technical implementation rules

Community/HMO/ambulatory encounters SHALL follow these rules:

- `type[community-hmo-ambulatory]` SHALL be present.
- `partOf` SHALL NOT be used.
- `participant` SHALL be present.
- `serviceProvider` SHALL be present.
- `serviceType` SHALL be present.
- `subject` SHALL reference ILHDP Patient.
- `identifier` SHALL be present.
- `period` SHALL be present.
- At least one of `period.start` or `period.end` SHALL be present.
- `reasonCode` or `reasonReference` SHALL be present.
- `location[nursing-unit]` SHALL NOT be used.

Additional guidance:

- `class` SHOULD ordinarily represent community/HMO care (`COMMUNITY-OR-HMO`). When the encounter is virtual and a virtual encounter type is used, `class` SHALL be `VR`.
- `type[face-to-face]` MAY be used for regular in-person visits, but it SHALL NOT be combined with virtual encounter types or `type[without-patient-present]`.
- `hospitalization` MAY be populated when ambulatory encounters need to convey details such as `specialArrangement` or `dietPreference`, but it will generally be omitted for routine community/HMO visits.
- `episodeOfCare` SHOULD be used when several ambulatory encounters belong to a clinically meaningful series, such as dialysis, repeated therapy visits, or coordinated follow-up visits.

## 2. Hospitalization and Other Hierarchical Encounter Flows

Primary profiles: `ILHDPEncounterHospitalization`, `ILHDPEncounterInpatientCareSegment`

The primary use case addressed by this scenario is inpatient hospitalization. In most organizations, hospitalization is modeled internally as a top-level entity that captures high-level details and one or more child entities that capture clinical details, responsibility changes, and patient movement. This IG represents that structure using a single top-level `ILHDPEncounterHospitalization` resource and one or more child `ILHDPEncounterInpatientCareSegment` resources connected through `partOf`.

Clinical and administrative context is often separated in internal systems and may even be managed on different organizational platforms. However, because the primary purpose of this IG is clinical information sharing, the model intentionally avoids introducing a separate administrative encounter layer. Where necessary, administrative details are represented within the same Encounter resources rather than through an additional hierarchy level.

It is also common for EMR systems to separate hospitalization into admission, stay, and discharge stages, sometimes with separate forms or workflow entities for each. This IG intentionally does not mirror that structure in the mandatory encounter hierarchy. That source-system pattern is common, but it is not universal, and it may even vary between clinical units within the same organization.

For implementers, the key point is that the IG is not denying the existence of richer local workflow structures. Rather, it is avoiding a model that would make consumers dependent on the internal business-process design of each source organization. Mirroring admission, stay, and discharge structures directly would require consumers to understand each organization's local workflow model and would substantially increase the size and complexity of the shared encounter graph without clear clinical benefit.

Accordingly, the mandatory model collapses admission, stay, and discharge into a simpler encounter hierarchy. Workflow-stage details may still be expressed on related resources through the optional mechanisms described in [section 5](#5-optional-rich-encounter-hierarchy) and [section 6](#6-association-of-additional-related-data-using-ext-resource-role-context).

### 2.1 Core hierarchy model

The resulting mandatory hierarchy consists of:

- one top-level `ILHDPEncounterHospitalization`
- at least one `ILHDPEncounterInpatientCareSegment` beneath it

The top-level hospitalization encounter represents the overall clinical stay. Each child care segment represents a clinically coherent segment of care, ordinarily associated with a clinical unit, team, or significant event. The class of a child segment will often align with the parent hospitalization, but it MAY differ when that better reflects the actual care context, for example an `EMER` segment within an overall `IMP` hospitalization.

New care segment encounters SHALL be created when clinical responsibility changes. In practical terms, this means that a new segment SHALL be created when responsibility for the patient's care is transferred to another clinical unit or team.

Physical movement alone does not necessarily constitute a change in clinical context. In particular, a change of nursing unit or bed SHALL NOT, by itself, create a new segment encounter when the same clinical unit remains responsible for care. Instead, that movement SHALL be represented in `Encounter.location`, and the associated history SHALL be retained using `location.status` and `location.period`.

Separate care segment encounters MAY also be created for significant clinical events such as a procedure (e.g. - resuscitation, PICC line placement, etc.), a major decision point, a consultation, or another event for which it is clinically appropriate to track:

- distinct participants
- exact timing
- separately queryable associated observations, procedures, conditions, or other artifacts

The following decision matrix MAY help implementers decide when a separate event Encounter is justified:

| Decision factor | Create event Encounter? |
| --- | --- |
| Needs its own lifecycle (`status` / `period`) distinct from the parent segment | Yes |
| Needs distinct participants or distinct clinical responsibility | Yes |
| Should be queryable as a distinct unit of work with its own associated artifacts | Yes |
| Can be fully represented as a Procedure, Observation, ImagingStudy, or similar resource linked to the segment | Usually no |

Additional illustrative scenario guidance is available in [ILHDP Care Segment Examples](ILHDP-CareSegment-Examples.md).

Care segments MAY be nested, however, hierarchy depth SHOULD remain shallow and SHALL NOT exceed:

- `ILHDPEncounterHospitalization`
- child `ILHDPEncounterInpatientCareSegment`
- optional child `ILHDPEncounterInpatientCareSegment` representing a significant event beneath a segment

In other words, the intended maximum depth is three levels. Healthcare organizations MAY either attach all care segments directly to the top-level hospitalization or use a three-level hierarchy when an event segment is more naturally attached to a parent segment. That choice is at the healthcare organization's discretion and SHOULD reflect the way care segments are modeled in local operational systems and internal business processes.

### 2.2 Clinical responsibility versus location

This IG makes an explicit distinction between clinical responsibility and physical location and nursing care responsibility:

| Concept | Encounter element | Interpretation |
| --- | --- | --- |
| Clinical responsibility | `Encounter.serviceProvider` | The clinical organizational unit accountable for care during the segment. A change here drives a new segment. |
| Nursing-unit context | `Encounter.location[nursing-unit]` | The nursing unit responsible for the patient during the segment. It may change without a change in clinical responsibility. History SHOULD be retained using `location.period` and `location.status`. |
| Bed / room / building | Additional `Encounter.location` entries | Physical context such as bed, room, floor, building, or campus. History SHOULD be retained using `location.period` and `location.status`. |

This distinction is necessary because a patient may remain under the responsibility of one clinical unit while physically moving to another nursing unit or bed due to operational constraints.

### 2.3 Location modeling rules

For inpatient care segments:

- `location` SHALL be present.
- `location[nursing-unit]` SHALL be present.
- `location[nursing-unit].location` SHALL reference a nursing-unit Location conforming to `ILHDPLocationNursingUnit`.
- The identifying marker for the nursing-unit slice SHALL be `location.physicalType = il-core-location-physical-type#hospital-nursing-unit`.

Additional guidance:

- physical bed, room, building, floor, or campus locations SHOULD be represented as additional `location` entries when known
- those additional physical locations SHOULD populate `location.physicalType` with appropriate HL7 location physical type codes
- when the patient is transferred between nursing units or beds, prior `location` entries SHOULD be retained and closed using `location.period` and `location.status`
- only one nursing-unit entry SHOULD be active at a time for a given segment

For top-level hospitalization encounters:

- `location` MAY be populated
- `location[nursing-unit]` SHALL NOT be used
- if location is populated, it will ordinarily represent a broader site, campus, or similar high-level physical context rather than a nursing unit

### 2.4 Technical implementation rules

Top-level hospitalization encounters SHALL follow these rules:

- `type[hospitalization]` SHALL be present.
- `type[inpatient-care-segment]` SHALL NOT be present.
- `type[community-hmo-ambulatory]` SHALL NOT be present.
- `partOf` SHALL NOT be used.
- `serviceProvider` SHALL be present.
- `identifier` SHALL be present.
- `serviceType` SHALL be present.
- `subject` SHALL reference ILHDP Patient.
- `period` SHALL be present.
- `reasonCode` or `reasonReference` SHALL be present.
- `location[nursing-unit]` SHALL NOT be used.

Inpatient care segments SHALL follow these rules:

- `type[inpatient-care-segment]` SHALL be present.
- `type[hospitalization]` SHALL NOT be present.
- `type[community-hmo-ambulatory]` SHALL NOT be present.
- `partOf` SHALL be present.
- `serviceProvider` SHALL be present.
- `participant` SHALL be present.
- `location` SHALL be present.
- `location[nursing-unit]` SHALL be present.
- `location[nursing-unit].location` SHALL be present.
- `hospitalization` SHALL NOT be used.
- `reasonCode[moh-reason-code]` SHALL NOT be used.

For significant event segments:

- `partOf` SHOULD ordinarily reference the clinically responsible parent segment when such a segment exists
- if the relevant parent segment is not known or not represented, `partOf` MAY reference the top-level hospitalization encounter instead

### 2.5 Worked example

Patient arrives at hospital ER. At intake, a top-level `ILHDPEncounterHospitalization` is created to capture the overall stay and its higher-level administrative context, and an `ILHDPEncounterInpatientCareSegment` is created for ER care. After initial assessment, the patient is transferred to the Cardiology Ward. Because clinical responsibility changes, a new `ILHDPEncounterInpatientCareSegment` is created for Cardiology, and the ER segment is finished.

Later the patient is physically moved to Internal Ward A due to occupancy constraints in Cardiology. However, clinical responsibility remains with Cardiology. No new segment is created, because the clinical context has not changed. Instead, the existing cardiology segment is updated with a new nursing-unit `location` entry and the corresponding location history.

Later the patient undergoes PICC line placement. In this case, it is clinically useful to represent the procedure as a separate care segment in order to track its own participants, exact time window, and directly associated artifacts. A child `ILHDPEncounterInpatientCareSegment` is therefore created and linked to the Cardiology segment through `partOf`. At the healthcare organization's discretion, that event segment could also have been linked directly to the top-level `ILHDPEncounterHospitalization`.

After several days, the patient is discharged and the remaining in-progress encounters, namely the top-level `ILHDPEncounterHospitalization` and the Cardiology care segment, are finished.

### 2.6 Additional hierarchical use cases

The hierarchical model is not limited to traditional inpatient hospitalization.

It MAY also be used for:

- hospital ambulatory clinic workflows that are internally modeled as a hierarchy
- HMO-operated emergency care center workflows that are internally modeled as a hierarchy
- home hospitalization when the source-system model is hierarchical

There is no inherent requirement in this model that the stay be prolonged or that the patient physically remain admitted to a bed-based setting for the entire duration. The deciding factor is whether the source-system model and clinical workflow are best represented as a hierarchy.

## 3. Recurring Daily Hospitalization

Primary profile: `ILHDPEpisodeOfCareRecurringDailyHospitalization`

Some rehabilitation hospitals and similar organizations manage a distinct pattern of care in which the patient remains at home between treatment days but repeatedly comes to the hospital according to a defined program. Each treatment day may resemble an ambulatory visit, while the overall program functions clinically and administratively as a hospitalization-like treatment course.

This pattern does not fit neatly into a pure Encounter hierarchy because:

- the patient spends most of the time outside the hospital
- multiple treatment-day encounters belong to one broader program
- an actual inpatient hospitalization may still occur during the same overall program

For this reason, the top-level correlating entity for this scenario SHALL be `ILHDPEpisodeOfCareRecurringDailyHospitalization`, not a top-level hospitalization Encounter.

### 3.1 Technical implementation rules

The recurring daily hospitalization episode SHALL:

- use `type[recurring-daily-hospitalization]`
- include service context in `type[serviceType]`
- include `period`
- include `managingOrganization`
- include `diagnosis`
- support diagnosis role semantics for admission, comorbidity, and discharge

This profile serves as the top-level clinical program entity for the recurring daily hospitalization workflow, analogous to the role of `ILHDPEncounterHospitalization` in a regular hierarchical hospitalization.

Daily treatment encounters associated with that program:

- SHOULD reference the recurring daily hospitalization episode via `Encounter.episodeOfCare`
- MAY themselves be modeled either as `ILHDPEncounterCommunityHMOAmbulatory` or, when appropriate, using the hierarchical Encounter model

## 4. Connecting Related Encounters Outside Hospitalization Scope

When several encounters are related but not dependent on one another in a parent-child hierarchy, the relationship SHOULD be expressed through `EpisodeOfCare` rather than `partOf`.

Typical examples include:

- series of dialysis encounters
- course of physical therapy
- repeated community follow-up encounters
- support-group or recurring treatment sessions

In these cases, use of `EpisodeOfCare` remains optional but is strongly recommended.

This differs from the recurring daily hospitalization scenario, in which use of the dedicated recurring-daily-hospitalization EpisodeOfCare profile is mandatory because that EpisodeOfCare acts as the top-level program entity.

## 5. Optional Rich Encounter Hierarchy

Primary profile: `ILHDPEncounterSupplemental`

This IG intentionally defines a simplified mandatory encounter model for interoperability. Many organizations, however, maintain richer and more granular internal encounter structures. Those richer models may be valuable for advanced local use, for more sophisticated analytics, for internal advanced solutions built by the healthcare organizations themselves, and for consumers prepared to handle additional complexity.

To support that need without making consumers dependent on it, this IG defines an optional mechanism for sharing richer local encounter structure alongside the simplified mandatory model. That mechanism consists of:

- `ILHDPEncounterSupplemental` profile
- `ext-resource-role-context` extension

Together, these mechanisms allow organizations to express an arbitrarily richer local encounter hierarchy when that is useful, while imposing only minimal constraints on the local structure itself.

### 5.1 Supplemental encounter policy

`ILHDPEncounterSupplemental` is intended to represent local workflow-specific or source-system-specific encounter context, such as:

- admission-sheet encounter
- discharge workflow encounter
- local operational sub-encounter
- internal sub-visit that is meaningful to the source organization but not part of the mandatory simplified model

The profile is intentionally constrained only to the minimum extent necessary to identify it as supplemental. This allows organizations to represent local encounter structures more faithfully, without forcing those structures into the mandatory simplified model.

Supplemental encounters:

- SHALL use `type[supplemental-encounter]`
- SHALL NOT use `type[hospitalization]`
- SHALL NOT use `type[inpatient-care-segment]`
- SHALL NOT use `type[community-hmo-ambulatory]`

Supplemental encounters MAY be linked to regular HDP encounters using `partOf`.

However:

- regular HDP encounter profiles SHALL NOT use `partOf` to point to supplemental encounters
- shared clinical resources SHALL continue to use the regular HDP encounter model in their standard `encounter` element

This is a core interoperability rule. The mandatory encounter model remains the primary model for cross-organizational sharing. Supplemental encounters provide optional additional detail, but SHALL NOT replace the regular encounter hierarchy as the main shared clinical frame of reference.

> **Use of `ILHDPEncounterSupplemental` is entirely optional for both data sources and data consumers.** Data sources MAY choose not to provide supplemental encounters at all. Data consumers MAY choose not to process them at all.
>
> Consumers that ignore supplemental encounters SHALL still be able to rely on the regular HDP encounter model as the complete mandatory clinical view required by this IG. In other words, ignoring supplemental encounters SHALL be clinically safe and SHALL NOT cause loss of clinically required information from the mandatory shared model.

Consumers seeking richer local detail MAY choose to process supplemental encounters when they are provided.

## 6. Association of Additional Related Data Using `ext-resource-role-context`

Clinical resources may need to express one or more of the following:

- their role in the clinical or business process, such as admission, hospitalization, or discharge
- an operational context identifier, such as a local EMR sheet identifier
- an additional encounter context beyond the resource's standard `encounter` element

Although some of this context can be expressed in limited cases through native elements (e.g. - `Encounter.diagnosis.use`), the base FHIR model does not generally provide a clean way to represent workflow role, operational context, and association with an additional Encounter, particularly when a resource is linked to its primary clinical Encounter while also carrying a separate supplemental or workflow-specific context.

For this reason, this IG uses `ext-resource-role-context`.

### 6.1 Extension structure

The extension contains:

- mandatory `role`
- optional `roleOperationalContext`
- optional `roleEncounterContext`

Usage rules:

- `role` SHALL identify the resource's role in the workflow or business process
- `roleOperationalContext` MAY carry a local business identifier associated with that role
- `roleEncounterContext` MAY carry an additional Encounter reference associated with that role

Most importantly:

- `roleEncounterContext` SHALL NOT be used when the resource's regular `encounter` already points to the encounter that the extension is trying to express
- `roleEncounterContext` is intended to provide additional context, not to replace the standard `encounter` link

Typical pattern:

- `Resource.encounter` points to the regular HDP encounter that provides the primary clinical context
- `ext-resource-role-context.role` indicates the workflow stage or role
- `ext-resource-role-context.roleEncounterContext` optionally points to a supplemental encounter that provides richer internal context

This pattern allows resources to remain interoperable for basic consumers while still exposing richer workflow associations for advanced consumers.

### 6.2 Practical linking guidance

The following operational patterns SHALL be used when linking other resources to Encounter data:

- `Resource.encounter` SHALL point to the most specific regular HDP encounter that represents the resource's primary clinical context.
- `Encounter.reasonReference` SHALL be used to reference Conditions, Procedures, Observations, or other resources that explain why the encounter took place.
- `Encounter.diagnosis.use` SHALL be used to explicitly convey diagnosis role semantics such as admission diagnosis, comorbidity, or discharge diagnosis.
- `ext-resource-role-context` MAY be used when the resource must also carry workflow-specific or source-system-specific context that is not adequately captured by native elements alone.
- When both regular and supplemental context exist, the regular HDP encounter SHALL remain in the resource's standard `encounter` element, while the additional workflow context MAY be carried in `ext-resource-role-context`.

## 7. Common Rules Across IL-HDP Encounter Profiles

These common rules apply across the regular IL-HDP encounter profiles unless a specific profile explicitly narrows them further:

- `meta.security[HDP]` SHALL be present and SHALL use the HDP information-bucket coding system
- the regular encounter profiles in this IG SHALL use the `encounterInformation` bucket
- `identifier` SHALL be present
- `type` SHALL be present
- `serviceType` SHALL be present
- `subject` SHALL be present and SHALL reference ILHDP Patient
- `period` SHALL be present
- `reasonCode` or `reasonReference` SHALL be present
- `participant.individual` SHALL be present whenever a participant is present

### 7.1 Type and participant slicing

The encounter model relies on sliced arrays inherited from IL Core and extended in IL HDP:

- `Encounter.type` is sliced by coding pattern
- `Encounter.participant` is sliced by participant type
- `Encounter.reasonCode` is sliced by coding pattern
- `Encounter.diagnosis` is sliced by diagnosis role
- `Encounter.location` is sliced to identify nursing-unit entries

Participant slices inherited from IL Core include:

- `primary-performer`
- `consultant`
- `reffering-practitioner`

Additional participant entries MAY be added using other appropriate participation codes.

The participant type codes used in this IG are summarized in [section 8.4](#84-key-codes-used-directly-in-this-ig).

Profile-specific expectations include:

- `ILHDPEncounterHospitalization`: participants are optional and MAY include clinicians not associated with a specific child segment.
- `ILHDPEncounterInpatientCareSegment`: SHOULD include the practitioners or practitioner roles directly involved in care during that segment. If class is ambulatory (AMB), at least one participant SHALL be present. `ilhdp-enc-ambulatory-class-participant`.
- `ILHDPEncounterCommunityHMOAmbulatory`: participants are required and will ordinarily include the primary performer for the visit.

### 7.2 Reason modeling

Every encounter SHALL have a reason, represented as either:

- `reasonCode`
- `reasonReference`
- or both

The `reasonReference[patient-reported-chief-complaint]` slice MAY be used when the encounter includes a patient-reported chief complaint represented by `ILHDPPatientReportedChiefComplaint`.

### 7.3 Face-to-face and virtual semantics

`type[face-to-face]` MAY be used when the patient and practitioner are physically co-present. It SHALL NOT be combined with:

- virtual encounter types
- `type[without-patient-present]`

### 7.4 Period and status semantics

The following timing constraints apply across the encounter profiles in this IG:

- if `status` is not `planned`, `period.start` SHALL be populated
- if `status` is `finished`, either `period.end` or `Encounter.length` SHALL be populated
- if the exact time is not known, only the date component SHALL be populated
- for community/HMO/ambulatory encounters, at least one of `period.start` or `period.end` SHALL be present

For child inpatient care segments, status and timing SHALL be harmonized with the parent encounter:

- a child encounter SHALL NOT remain `in-progress` when its parent encounter is `finished`
- a child encounter SHALL NOT start before the parent starts
- a child encounter SHALL NOT end after the parent ends
- timing across related encounters SHOULD remain clinically and operationally coherent

## 8. Terminology and Related Profiles

The encounter profiles rely on a combination of IL Core and IL HDP terminology artifacts.

### 8.1 Terminology quick reference

The following table provides a compact terminology reference.

| Artifact | Usage | Simplifier link | Canonical |
| --- | --- | --- | --- |
| CodeSystem `il-core-encounter-type` | Encounter type slicing and HDP encounter-type codes | [il-core-encounter-type](https://simplifier.net/ilcore/il-core-encounter-type) | [http://fhir.health.gov.il/cs/il-core-encounter-type](http://fhir.health.gov.il/cs/il-core-encounter-type) |
| CodeSystem `il-core-encounter-class` | Encounter class codes such as `COMMUNITY-OR-HMO` | [il-core-encounter-class](https://simplifier.net/ilcore/il-core-encounter-class) | [http://fhir.health.gov.il/cs/il-core-encounter-class](http://fhir.health.gov.il/cs/il-core-encounter-class) |
| CodeSystem `il-core-diagnosis-role` | Diagnosis-role codes used in `Encounter.diagnosis.use` | [il-core-diagnosis-role](https://simplifier.net/ilcore/il-core-diagnosis-role) | [http://fhir.health.gov.il/cs/il-core-diagnosis-role](http://fhir.health.gov.il/cs/il-core-diagnosis-role) |
| CodeSystem `il-core-location-physical-type` | Used in `Location.type[nursing-unit]` and `Encounter.location.physicalType`, including nursing-unit slice identification | [il-core-location-physical-type](https://simplifier.net/ilcore/il-core-location-physical-type) | [http://fhir.health.gov.il/cs/il-core-location-physical-type](http://fhir.health.gov.il/cs/il-core-location-physical-type) |
| ValueSet `il-core-encounter-type` | Binding for `Encounter.type` | [il-core-encounter-type](https://simplifier.net/ilcore/il-core-encounter-type) | [http://fhir.health.gov.il/ValueSet/il-core-encounter-type](http://fhir.health.gov.il/ValueSet/il-core-encounter-type) |
| ValueSet `il-core-encounter-reason-codes` | Binding for `Encounter.reasonCode` | [il-core-encounter-reason-codes](https://simplifier.net/ilcore/il-core-encounter-reason-codes) | [http://fhir.health.gov.il/ValueSet/il-core-encounter-reason-codes](http://fhir.health.gov.il/ValueSet/il-core-encounter-reason-codes) |
| ValueSet `il-core-diagnosis-role` | Binding for diagnosis role in Encounter and EpisodeOfCare | [il-core-diagnosis-role](https://simplifier.net/ilcore/il-core-diagnosis-role) | [http://fhir.health.gov.il/ValueSet/il-core-diagnosis-role](http://fhir.health.gov.il/ValueSet/il-core-diagnosis-role) |
| ValueSet `patient-release-type-moh` | Binding for `hospitalization.dischargeDisposition` | [patient-release-type-moh](https://simplifier.net/ilcore/patient-release-type-moh) | [http://fhir.health.gov.il/ValueSet/patient-release-type-moh](http://fhir.health.gov.il/ValueSet/patient-release-type-moh) |
| Extension `ext-resource-role-context` | Additional workflow role, operational context, and optional additional Encounter context | [ext-resource-role-context](https://simplifier.net/ilcore/ext-resource-role-context) | [http://fhir.health.gov.il/StructureDefinition/ext-resource-role-context](http://fhir.health.gov.il/StructureDefinition/ext-resource-role-context) |

### 8.2 Supporting profiles and related artifacts

Important supporting profiles and related artifacts include:

| Artifact | Simplifier link | Canonical |
| --- | --- | --- |
| `ILHDPLocationNursingUnit` | [ILHDPLocationNursingUnit](https://simplifier.net/hdp-il/ilhdplocationnursingunit) | [http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-location-nursing-unit](http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-location-nursing-unit) |
| `ILHDPPatientReportedChiefComplaint` | [ILHDPPatientReportedChiefComplaint](https://simplifier.net/hdp-il/ilhdppatientreportedchiefcomplaint) | [http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-patient-reported-chief-complaint](http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-patient-reported-chief-complaint) |
| `ILHDPEpisodeOfCare` | [ILHDPEpisodeOfCare](https://simplifier.net/hdp-il/ilhdpepisodeofcare) | [http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-episode-of-care](http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-episode-of-care) |
| `ILHDPEpisodeOfCareRecurringDailyHospitalization` | [ILHDPEpisodeOfCareRecurringDailyHospitalization](https://simplifier.net/hdp-il/ilhdpepisodeofcarerecurringdailyhospitalization) | [http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-episode-of-care-recurring-daily-hospitalization](http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-episode-of-care-recurring-daily-hospitalization) |
| `ILHDPEncounterSupplemental` | [ILHDPEncounterSupplemental](https://simplifier.net/hdp-il/ilhdpencountersupplemental) | [http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-encounter-supplemental](http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-encounter-supplemental) |
| `ext-resource-role-context` | [ext-resource-role-context](https://simplifier.net/ilcore/ext-resource-role-context) | [http://fhir.health.gov.il/StructureDefinition/ext-resource-role-context](http://fhir.health.gov.il/StructureDefinition/ext-resource-role-context) |

### 8.3 Nursing-unit concepts

Two related but distinct nursing-unit concepts are used:

- On the nursing-unit Location profile, `Location.type` is sliced and SHALL contain both:
  - `il-core-location-physical-type#hospital-nursing-unit` in `type[nursing-unit]`
  - `http://terminology.hl7.org/CodeSystem/v3-RoleCode#HU` in `type[hospital-unit]`
- On the Encounter, `Encounter.location.physicalType` identifies the nursing-unit slice at the Encounter level using `il-core-location-physical-type#hospital-nursing-unit`

The same nursing-unit concept is therefore reused on two different elements for two different purposes: `Location.type` classifies the referenced Location resource, while `Encounter.location.physicalType` identifies the nursing-unit entry within the Encounter.

### 8.4 Key codes used directly in this IG

Encounter type codes from `il-core-encounter-type` that are used directly in this IG include:

- `hospitalization-hdp`
- `inpatient-care-segment-hdp`
- `community-hmo-ambulatory-hdp`
- `supplemental-encounter-hdp`
- `without-patient-present`, when applicable

Participant type codes inherited from HL7 v3 ParticipationType and used directly in this IG include:

- `PPRF`
- `CON`
- `REF`
- `SPRF`, when additional participant roles are needed

## 9. Examples

Direct example links are provided here for implementer convenience.

Hospital hierarchy:

- [Hospitalization](https://simplifier.net/hdp-il/hdp-hospitalization-hospital1) demonstrates a top-level hospitalization with broad site-level location.
- [ER segment](https://simplifier.net/hdp-il/hdp-segment-er) demonstrates an inpatient ER segment.
- [Ward A segment](https://simplifier.net/hdp-il/hdp-segment-ward-a) demonstrates an inpatient ward segment with nursing-unit movement history.
- [PICC event segment](https://simplifier.net/hdp-il/hdp-segment-picc) demonstrates an event-level segment within the hospitalization flow.
- [Supplemental admission](https://simplifier.net/hdp-il/hdp-supplemental-admission-ward-a) demonstrates optional supplemental workflow-stage detail.

Community/HMO:

- [GP visit](https://simplifier.net/hdp-il/hdp-community-hmo-ambulatory-gp-visit) demonstrates a community/HMO ambulatory encounter.

Recurring daily hospitalization:

- [Recurring daily hospitalization program](https://simplifier.net/hdp-il/hdp-recurring-daily-hospitalization-program1) demonstrates recurring daily hospitalization represented through EpisodeOfCare.

Supporting clinical resources:

- [Chief complaint (hospitalization)](https://simplifier.net/hdp-il/hdp-chief-complaint-hospitalization) demonstrates patient-reported chief complaint linkage in the hospitalization context.
- [Chief complaint (GP visit)](https://simplifier.net/hdp-il/hdp-chief-complaint-gp-visit) demonstrates patient-reported chief complaint linkage in the community/HMO context.
- [Admission BP (Ward A)](https://simplifier.net/hdp-il/hdp-bp-admission-ward-a) demonstrates a clinical resource linked both to a regular encounter and to additional workflow context through `ext-resource-role-context`.
- [Discharge-stage hemoglobin observation](https://simplifier.net/hdp-il/hemoglobin-lab-test-discharge-stage) demonstrates workflow-stage context carried on a clinical resource.

## 10. Interpretation Guidance

The following points summarize how IL-HDP encounter data SHOULD be interpreted by data consumers.

- there is a simple mandatory encounter model that conveys the clinically important picture consistently
- that model distinguishes overall hospitalization from child care segments
- changes in clinical responsibility drive new segments
- changes in physical location alone do not necessarily drive new segments
- optional richer local detail MAY be provided through supplemental encounters and resource role context
- consumers that do not need that richer detail MAY ignore it without losing the mandatory clinical picture
