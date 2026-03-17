Profile: ILHDPServiceRequest
Parent: ILCoreServiceRequest
Id: il-hdp-service-request
Title: "ILHDP ServiceRequest Profile"
Description: "Defines the ServiceRequest resource for HDP compliance."
* insert ConformanceMetadata
* . obeys one-strong-identifier
* meta only ILHDPMeta
* meta 1..1
* meta.security ^slicing.discriminator.type = #value
* meta.security ^slicing.discriminator.path = "system"
* meta.security ^slicing.rules = #closed
* meta.security ^slicing.description = "ILHDP codes only"
* meta.security[HDP] from $vs-service-request-meta (required)
* meta.security[HDP].system 1..1
* meta.security[HDP].code 1..1
* meta.security[HDP].system = $info-buckets (exactly)
* identifier 1..*
* authoredOn 1..1
* encounter 1..1
* requester 1..1
* performer 1..*
* reasonCode 1..1
* priority 1..1
* reasonReference 1..*
* supportingInfo 1..*
* occurrence[x] 1..1
* note 1..*
* text 1..1

* subject only Reference(ILHDPPatient or ILCoreGroup or ILHDPLocation)
* encounter only Reference(ILCoreEncounter)
* requester only Reference(ILHDPPractitioner or ILHDPPractitionerRole or ILHDPOrganization or ILHDPPatient or ILHDPRelatedPerson or ILCoreDevice)
* performer only Reference(ILHDPPractitioner or ILHDPPractitionerRole or ILHDPOrganization or ILHDPCareTeam or ILHDPPatient or ILHDPRelatedPerson or ILCoreDevice)
* reasonReference only Reference(ILHDPCondition or ILHDPObservation or ILHDPDiagnosticReport or ILHDPDocumentReference)
* supportingInfo only Reference(ILHDPCondition or ILHDPObservation or ILHDPDocumentReference or ILHDPMedication or ILCoreDevice or ILCoreProcedure)
