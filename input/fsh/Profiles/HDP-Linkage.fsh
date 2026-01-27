Profile: ILHDPLinkage
Parent: Linkage
Id: il-hdp-linkage
Title: "IL HDP Linkage Profile"
Description: "Israel Health Data Platform Linkage Profile"

* meta only ILHDPMeta
* meta 1..1
* meta.security[HDP] 1..1
* meta.security[HDP].system 1..1
* meta.security[HDP].code 1..1
* meta.security[HDP].system = $info-buckets (exactly)
* meta.security[HDP].code = #practitioner (exactly)
* meta.security[HDP].display 1..1
* meta.security[HDP].display = "מטפל" (exactly)

* item 2..*
* item ^slicing.discriminator.type = #value
* item ^slicing.discriminator.path = "type"
* item ^slicing.rules = #open
* item.resource 1..1
* item.resource only Reference(ILCorePractitioner or ILHDPPractitioner)

* item contains
    source 2..*

* item[source].type = #source (exactly)
* item[source].type 1..1
