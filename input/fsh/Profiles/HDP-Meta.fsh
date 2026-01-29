Profile: ILHDPMeta
Parent: Meta
Id: il-hdp-meta
Title: "ILHDP Meta Profile"
Description: "Profile on Meta datatype for HDP with slicing on security"
* insert ConformanceMetadata
* security.system 1..1
* security.code 1..1
* security ^slicing.discriminator.type = #value
* security ^slicing.discriminator.path = "system"
* security ^slicing.rules = #closed
* security ^slicing.description = "ILHDP codes only"
* security contains HDP 1..1
* security[HDP].system 1..1
* security[HDP].system = $info-buckets (exactly)
* security[HDP].code 1..1
* security[HDP] from $vs-info-buckets (required)