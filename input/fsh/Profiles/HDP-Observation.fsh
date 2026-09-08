Profile: ILHDPObservation
Parent: ILCoreObservation
Id: il-hdp-observation
Title: "ILHDP Observation Profile"
Description: "Defines the Observation resource for HDP compliance with correct meta slicing and valid references."
* insert ConformanceMetadata
* . obeys one-strong-identifier
* meta only ILHDPMeta
* meta 1..1
* meta.security[HDP] from $vs-observation-meta (required)
* meta.security[HDP].system = $info-buckets (exactly)
* identifier 1..*
* subject only Reference(ILHDPPatient)
* encounter only Reference(ILCoreEncounter or ILHDPEncounterHospitalization or ILHDPEncounterInpatientCareSegment or ILHDPEncounterCommunityHMOAmbulatory)
* performer only Reference(ILCorePractitioner or ILHDPPractitioner or ILCorePractitionerRole or ILHDPPractitionerRole or ILCoreOrganization or ILHDPOrganization or ILCoreCareTeam or ILHDPCareTeam or ILHDPPatient or ILCoreRelatedPerson or ILHDPRelatedPerson)
* specimen only Reference(ILHDPSpecimenLab or ILHDPSpecimenPathology)
* device only Reference(ILCoreDevice or ILHDPDevice or DeviceMetric)
