Profile: ILHDPMeta
Parent: Meta
Id: il-hdp-meta
Title: "HDP Meta"
Description: "Profile on Meta datatype for HDP with slicing on security"
* security ^slicing.discriminator.type = #value
* security ^slicing.discriminator.path = "system"
* security ^slicing.rules = #closed
* security ^slicing.description = "HDP codes only"
* security contains HDP 1..1
* security[HDP].system = $info-buckets (exactly)
