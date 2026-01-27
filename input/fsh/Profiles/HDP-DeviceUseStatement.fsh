Profile: ILHDPDeviceUseStatement
Parent: ILCoreDeviceUseStatement
Id: il-hdp-device-use-statement
Title: "ILHDP DeviceUseStatement Profile"
Description: "HDP constraints and extensions on the DeviceUseStatement Resource"
* insert ConformanceMetadata
* . obeys one-strong-identifier
* meta 1..1
* meta only ILHDPMeta
* meta.security[HDP] 1..1
* meta.security[HDP].system = $info-buckets (exactly)
* meta.security[HDP].code = #medications (exactly)
* meta.security[HDP].display = "תרופות" (exactly)
* identifier 1..*
* basedOn only Reference(ILCoreServiceRequest or ILHDPServiceRequest)
* subject only Reference(ILHDPPatient)
//----------------------------------------------------
* derivedFrom only Reference(ILCoreServiceRequest or ILHDPServiceRequest or ILCoreProcedure or ILCoreClaim or ILCoreObservation or ILHDPObservation or ILCoreQuestionnaireResponse or ILCoreDocumentReference or ILHDPDocumentReference)
// once ILHDPProcedure and ILHDPClaim and ILHDPQuestionnaireResponse created, delete above and uncomment below
// * derivedFrom only Reference(ILCoreServiceRequest or ILHDPServiceRequest or ILCoreProcedure or ILHDPProcedure or ILCoreClaim or ILHDPClaim or ILCoreObservation or ILHDPObservation or ILCoreQuestionnaireResponse or ILHDPQuestionnaireResponse or ILCoreDocumentReference or ILHDPDocumentReference)

//----------------------------------------------------
* source only Reference(ILHDPPatient or ILCorePractitioner or ILHDPPractitioner or ILCorePractitionerRole or ILHDPPractitionerRole or ILCoreRelatedPerson or ILHDPRelatedPerson)
* device only Reference(ILCoreDevice or ILHDPDevice)
* reasonReference only Reference(ILCoreCondition or ILHDPCondition or ILCoreObservation or ILHDPObservation or ILCoreDiagnosticReport or ILHDPDiagnosticReport or ILCoreDocumentReference or ILHDPDocumentReference or ILCoreMedia)
// once ILHDPMedia is created, delete above and uncomment below
// * reasonReference only Reference(ILCoreCondition or ILHDPCondition or ILCoreObservation or ILHDPObservation or ILCoreDiagnosticReport or ILHDPDiagnosticReport or ILCoreDocumentReference or ILHDPDocumentReference or ILCoreMedia or ILHDPMedia)