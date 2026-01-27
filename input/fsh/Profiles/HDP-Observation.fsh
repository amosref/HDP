Profile: ILHDPObservation
Parent: il-core-observation
Id: il-hdp-observation
Title: "ILHDP Observation Profile"
Description: "Defines the Observation resource for HDP compliance with correct meta slicing and valid references."
* insert ConformanceMetadata
* . obeys one-strong-identifier
* meta only ILHDPMeta
* meta 1..1
* meta.security ^slicing.discriminator.type = #value
* meta.security ^slicing.discriminator.path = "system"
* meta.security ^slicing.rules = #closed
* meta.security ^slicing.description = "ILHDP codes only"
* meta.security[HDP] 1..1
* meta.security[HDP] from $vs-observation-meta (required)
* meta.security[HDP].system 1..1
* meta.security[HDP].code 1..1
* meta.security[HDP].system = $info-buckets (exactly)
* identifier 1..*
* subject only Reference(ILHDPPatient)
* encounter only Reference(il-core-encounter)
* performer only Reference(ILHDPPractitioner or ILHDPPractitionerRole or ILHDPOrganization or ILHDPCareTeam or ILHDPPatient or ILHDPRelatedPerson)
* specimen only Reference(ILHDPSpecimenLab or ILHDPSpecimenPathology)
* device only Reference(il-core-device or DeviceMetric)
