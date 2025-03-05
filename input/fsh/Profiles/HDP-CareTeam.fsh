Profile: ILHDPCareTeam
Parent: ILCoreCareTeam
Id: il-hdp-care-team
Title: "ILHDP CareTeam"
Description: "CareTeam profile for HDP"
* meta only ILHDPMeta
* meta 1..1
* meta.security[HDP] 1..1
* meta.security[HDP].system 1..1
* meta.security[HDP].code 1..1
* meta.security[HDP].system = $info-buckets (exactly)
* meta.security[HDP].code = #practitioner (exactly)
* meta.security[HDP].display = "מטפל" (exactly)
* subject only Reference(ILHDPPatient)
* participant.member only Reference(ILCorePractitioner or ILCorePractitionerRole or ILCoreOrganization or ILHDPPatient or ILCoreRelatedPerson or ILCoreCareTeam or 
                        ILHDPPractitioner or ILHDPPractitionerRole or ILHDPOrganization or ILHDPCareTeam)
* reasonReference only Reference(ILCoreCondition or ILHDPCondition)
* managingOrganization only Reference(ILCoreOrganization or ILHDPOrganization)
* participant.onBehalfOf only Reference(ILCoreOrganization or ILHDPOrganization)

