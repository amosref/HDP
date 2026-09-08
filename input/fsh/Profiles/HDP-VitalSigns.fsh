Profile: ILHDPVitalSigns
Parent: il-core-vital-signs
Id: il-hdp-vital-signs
Title: "ILHDP Vital Signs Profile"
Description: "Vital Signs profile for HDP compliance."
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
