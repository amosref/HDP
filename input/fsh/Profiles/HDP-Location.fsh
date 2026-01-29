Profile: ILHDPLocation
Parent: ILCoreLocation
Id: il-hdp-location
Title: "ILHDP Location Profile"
Description: "Location profile for HDP"
* insert ConformanceMetadata
* . obeys one-strong-identifier-warning
* meta only ILHDPMeta
* meta 1..1
* meta.security[HDP] 1..1
* meta.security[HDP].system = $info-buckets (exactly)
* meta.security[HDP].system 1..1
* meta.security[HDP].code 1..1
* meta.security[HDP].code = #organization (exactly)
* meta.security[HDP].display = "יחידה ארגונית" (exactly)
* managingOrganization only Reference(il-core-organization or ILHDPOrganization)
* identifier 1..*
* partOf only Reference(il-core-location or ILHDPLocation)