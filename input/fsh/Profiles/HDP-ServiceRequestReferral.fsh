Profile: ILHDPServiceRequestReferral
Parent: ILCoreServiceRequest
Id: il-hdp-service-request-referral
Title: "IL HDP ServiceRequest Referral Profile"
Description: "Israel Health Data Portability (HDP) constraints on the ServiceRequest resource for representing referrals (הפניות), per HDP law section 4.8."

* ^url = $ILHDPServiceRequestReferral
* insert ConformanceMetadata
* ^status = #active
* . ^short = "IL HDP ServiceRequest Referral Profile"
* . ^definition = "Israel Health Data Portability constraints on the ServiceRequest resource for representing referrals."
* . ^isModifier = false
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* ^extension[=].valueCode = #trial-use
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[=].valueInteger = 1

// meta.security — HDP information bucket, fixed to "referrals"
* meta only ILHDPMeta
* meta.security[HDP].system = $info-buckets (exactly)
* meta.security[HDP].code = #referrals (exactly)
* meta.security[HDP].display = "הפניות" (exactly)

// identifier
* identifier 1..*

// intent — restricted to order and its descendants
* intent from ILHDPServiceRequestReferralIntent (required)

// occurrence[x] — only Period is supported for referral validity
* occurrence[x] only Period
* occurrence[x] 1..1 MS

// patient-facing text
* patientInstruction MS
* note MS

// reference-type restrictions
* subject only Reference(ILHDPPatient or ILCoreGroup or ILCoreDevice or ILHDPDevice or ILHDPLocation)
* encounter only Reference(ILCoreEncounter or ILHDPEncounterHospitalization or ILHDPEncounterInpatientCareSegment or ILHDPEncounterCommunityHMOAmbulatory)
* requester only Reference(ILHDPPractitioner or ILHDPPractitionerRole or ILHDPOrganization or ILHDPPatient or ILHDPRelatedPerson or ILCoreDevice or ILHDPDevice)
* performer only Reference(ILHDPPractitioner or ILHDPPractitionerRole or ILHDPOrganization or ILHDPCareTeam or ILHDPPatient or ILHDPRelatedPerson or ILCoreDevice or ILHDPDevice)
* reasonReference only Reference(ILHDPCondition or ILHDPObservation or ILHDPDiagnosticReport or ILHDPDocumentReference)
* supportingInfo only Reference(ILHDPCondition or ILHDPObservation or ILHDPDocumentReference or ILHDPMedication or ILCoreDevice or ILHDPDevice or ILCoreProcedure)

// smoking / pregnancy status — supporting info only, not the clinical source of truth
* extension contains
    ILHDPExtensionSmokingStatus named smokingStatus 0..1 MS and
    ILHDPExtensionPregnancyStatus named pregnancyStatus 0..1 MS
