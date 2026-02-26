Profile: ILHDPOrganization
Parent: ILCoreOrganization
Id: il-hdp-organization
Title: "ILHDP Organization Profile"
Description: "Organization profile for HDP"
* insert ConformanceMetadata
* . obeys one-strong-identifier-warning
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
* type from $vs-il-hdp-organization-types (extensible)
* partOf only Reference(il-core-organization or ILHDPOrganization)
