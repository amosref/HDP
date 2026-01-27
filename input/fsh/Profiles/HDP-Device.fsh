Profile: ILHDPDevice
Parent: ILCoreDevice
Id: il-hdp-device
Title: "ILHDP Device Profile"
Description: "HDP constraints and extensions on the Device Resource."
* insert ConformanceMetadata
* . obeys one-strong-identifier
* meta 1..1
* meta only ILHDPMeta
* meta.security[HDP] 1..1
* meta.security[HDP].system = $info-buckets (exactly)
* meta.security[HDP].code = #medications (exactly)
* meta.security[HDP].display = "תרופות" (exactly)
* identifier 1..*
* patient only Reference(ILHDPPatient)
* owner only Reference(ILCoreOrganization or ILHDPOrganization)
* location only Reference(ILCoreLocation or ILHDPLocation)
* parent only Reference(ILCoreDevice or ILHDPDevice)
