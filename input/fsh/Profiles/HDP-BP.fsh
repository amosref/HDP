Profile: ILHDPBP
Parent: il-core-bp
Id: il-hdp-bp
Title: "ILHDP Blood Pressure Profile"
Description: "Blood Pressure profile for HDP compliance."
* insert ConformanceMetadata
* . obeys one-strong-identifier
* meta only ILHDPMeta
* meta 1..1
* meta.security ^slicing.discriminator.type = #value
* meta.security ^slicing.discriminator.path = "system"
* meta.security ^slicing.rules = #closed
* meta.security ^slicing.description = "ILHDP codes only"
* meta.security[HDP].system 1..1
* meta.security[HDP].code 1..1
* meta.security[HDP].system = $info-buckets (exactly)
* meta.security[HDP].code = #measurements (exactly)
* meta.security[HDP].display = "מדדים" (exactly)
* identifier 1..*
* subject only Reference(ILHDPPatient)
* encounter only Reference(il-core-encounter)
* performer only Reference(ILHDPPractitioner or ILHDPPractitionerRole or ILHDPOrganization or ILHDPCareTeam or ILHDPPatient or ILHDPRelatedPerson)
* device only Reference(ILHDPDevice or DeviceMetric)
