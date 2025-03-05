Profile: ILHDPPractitionerRole
Parent: ILCorePractitionerRole
Id: il-hdp-practitioner-role
Title: "ILHDP PractitionerRole"
Description: "PractitionerRole profile for HDP"
* meta only ILHDPMeta
* meta 1..1
* meta.security[HDP] 1..1
* meta.security[HDP].system 1..1
* meta.security[HDP].code 1..1
* meta.security[HDP].system = $info-buckets (exactly)
* meta.security[HDP].code = #practitioner (exactly)
* meta.security[HDP].display = "מטפל" (exactly)
* . obeys prac-role-code-specialty
* organization 1..1
* organization only Reference(ILCoreOrganization or ILHDPOrganization)
* practitioner only Reference(ILCorePractitioner or ILHDPPractitioner)
* location only Reference(ILCoreLocation or ILHDPLocation)

