Profile: ILHDPPractitioner
Parent: ILCorePractitioner
Id: il-hdp-practitioner
Title: "ILHDP Practitioner"
Description: "Practitioner profile for HDP"
* insert ConformanceMetadata
* . obeys one-strong-identifier-warning
* meta only ILHDPMeta
* meta 1..1
* meta.security[HDP] 1..1
* meta.security[HDP].system 1..1
* meta.security[HDP].code 1..1
* meta.security[HDP].system = $info-buckets (exactly)
* meta.security[HDP].code = #practitioner (exactly)
* meta.security[HDP].display = "מטפל" (exactly)
* identifier.assigner only Reference(ILHDPOrganization or ILCoreOrganization)
* obeys prac-ident-enc
* name.given 1..1
