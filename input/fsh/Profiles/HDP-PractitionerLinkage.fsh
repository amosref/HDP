Profile: ILHDPPractitionerLinkage
Parent: Linkage
Id: il-hdp-practitioner-linkage
Title: "ILHDP Practitioner Linkage"
Description: "Linkage profile for Israeli HDP Practitioner resources"
* insert ConformanceMetadata
* meta only ILHDPMeta
* meta 1..1
* meta.security[HDP] 1..1
* meta.security[HDP].system 1..1
* meta.security[HDP].code 1..1
* meta.security[HDP].system = $info-buckets (exactly)
* meta.security[HDP].code = #practitioner (exactly)
* meta.security[HDP].display = "מטפל" (exactly)
* item.resource only Reference(ILHDPPractitioner or ILCorePractitioner)
* item ^slicing.discriminator[0].type = #value
* item ^slicing.discriminator[0].path = "type"
* item ^slicing.rules = #open
* item 2..*
* item contains source 1..1 and alternate 1..1
* item[source] ^short = "The primary record for the practitioner"
* item[source].type = #source (exactly)
* item[alternate] ^short = "An alternative record for the practitioner"
* item[alternate].type = #alternate (exactly)