Profile: ILHDPDeviceRequest
Parent: ILCoreDeviceRequest
Id: il-hdp-device-request
Title: "ILHDP Device Request Profile"
Description: "HDP constraints and extensions on the DeviceRequest Resource."
* insert ConformanceMetadata
* . obeys one-strong-identifier
* meta 1..1
* meta only ILHDPMeta
* meta.security[HDP] 1..1
* meta.security[HDP].system = $info-buckets (exactly)
* meta.security[HDP].code = #medications (exactly)
* meta.security[HDP].display = "תרופות" (exactly)
* identifier 1..*
* codeReference only Reference(ILCoreDevice or ILHDPDevice)
* subject only Reference(ILHDPPatient or ILCoreLocation or ILHDPLocation or ILCoreDevice or ILHDPDevice)
* requester 1..1
* requester only Reference(ILCoreDevice or ILCoreDevice or ILCorePractitioner or ILHDPPractitionerRole or ILCorePractitionerRole or ILHDPPractitionerRole or ILCoreOrganization or ILHDPOrganization)
* reasonReference only Reference(ILCoreCondition or ILHDPCondition or ILCoreObservation or ILHDPObservation or ILCoreDiagnosticReport or ILHDPDiagnosticReport or ILCoreDocumentReference or ILHDPDocumentReference)
* authoredOn 1..1


