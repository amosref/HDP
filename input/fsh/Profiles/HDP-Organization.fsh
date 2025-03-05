Profile: ILHDPOrganization
Parent: ILCoreOrganization
Id: il-hdp-organization
Title: "ILHDP Organization"
Description: "Organization profile for HDP"
* meta only ILHDPMeta
* meta 1..1
* meta.security[HDP] 1..1
* meta.security[HDP].system 1..1
* meta.security[HDP].code 1..1
* meta.security[HDP].system = $info-buckets (exactly)
* meta.security[HDP].code = #organization (exactly)
* meta.security[HDP].display = "יחידה ארגונית" (exactly)
* identifier 1..*
* type 1..*
* partOf only Reference(il-core-organization or ILHDPOrganization)
