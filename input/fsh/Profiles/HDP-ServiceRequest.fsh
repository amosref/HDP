Profile: ILHDPServiceRequest
Parent: ILCoreServiceRequest
Id: il-hdp-service-request
Title: "ILHDP ServiceRequest Profile"
Description: "Defines the ServiceRequest resource for HDP compliance."
* insert ConformanceMetadata
* . obeys one-strong-identifier
* meta only ILHDPMeta
* meta 1..1
* meta.security[HDP] from $vs-service-request-meta (required)

* meta.security[HDP].system = $info-buckets (exactly)
* identifier 1..*
* authoredOn 1..1
* encounter 1..1
* requester 1..1
* performer 1..*
* reasonCode 1..1
* priority 1..1
* reasonReference 1..*
// * supportingInfo 1..*
* occurrence[x] 1..1
* note 1..*
// * text 1..1

* subject only Reference(ILHDPPatient or ILCoreGroup or ILCoreLocation or ILHDPLocation)
* encounter only Reference(ILCoreEncounter or ILHDPEncounterHospitalization or ILHDPEncounterInpatientCareSegment or ILHDPEncounterCommunityHMOAmbulatory)
* requester only Reference(ILCorePractitioner or ILHDPPractitioner or ILCorePractitionerRole or ILHDPPractitionerRole or ILCoreOrganization or ILHDPOrganization or ILHDPPatient or ILCoreRelatedPerson or ILHDPRelatedPerson or ILCoreDevice or ILHDPDevice)
* performer only Reference(ILCorePractitioner or ILHDPPractitioner or ILCorePractitionerRole or ILHDPPractitionerRole or ILCoreOrganization or ILHDPOrganization or ILCoreCareTeam or ILHDPCareTeam or ILHDPPatient or ILCoreRelatedPerson or ILHDPRelatedPerson or ILCoreDevice or ILHDPDevice)
* reasonReference only Reference(ILCoreCondition or ILHDPCondition or ILCoreObservation or ILHDPObservation or ILCoreDiagnosticReport or ILHDPDiagnosticReport or ILCoreDocumentReference or ILHDPDocumentReference)
* supportingInfo only Reference(ILCoreCondition or ILHDPCondition or ILCoreObservation or ILHDPObservation or ILCoreDocumentReference or ILHDPDocumentReference or ILCoreMedication or ILHDPMedication or ILCoreDevice or ILHDPDevice or ILCoreProcedure)
