Profile: ILHDPBP
Parent: il-core-bp
Id: il-hdp-bp
Title: "ILHDP Blood Pressure Profile"
Description: "Blood Pressure profile for HDP compliance."
* insert ConformanceMetadata
* . obeys one-strong-identifier
* meta only ILHDPMeta
* meta 1..1
* meta.security[HDP].system = $info-buckets (exactly)
* meta.security[HDP].code = #measurements (exactly)
* meta.security[HDP].display = "מדדים" (exactly)
* identifier 1..*
* subject only Reference(ILHDPPatient)
* encounter only Reference(ILCoreEncounter or ILHDPEncounterHospitalization or ILHDPEncounterInpatientCareSegment or ILHDPEncounterCommunityHMOAmbulatory)
* performer only Reference(ILCorePractitioner or ILHDPPractitioner or ILCorePractitionerRole or ILHDPPractitionerRole or ILCoreOrganization or ILHDPOrganization or ILCoreCareTeam or ILHDPCareTeam or ILHDPPatient or ILCoreRelatedPerson or ILHDPRelatedPerson)
* device only Reference(ILCoreDevice or ILHDPDevice or DeviceMetric)
