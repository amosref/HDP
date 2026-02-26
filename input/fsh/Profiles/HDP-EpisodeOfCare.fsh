Profile: ILHDPEpisodeOfCare
Parent: ILCoreEpisodeOfCare
Id: il-hdp-episode-of-care
Title: "ILHDP EpisodeOfCare Profile"
Description: "Israel HDP constraints and metadata tags for EpisodeOfCare"

* ^url = "http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-episode-of-care"
* insert ConformanceMetadata
* ^status = #draft

* insert HDPInformationBucketSecurity
* meta.security[HDP].code = $info-buckets#encounterInformation

* diagnosis.condition only Reference(ILCoreCondition or $ILHDPCondition)
* patient only Reference($ILHDPPatient)
* managingOrganization only Reference(ILCoreOrganization or $ILHDPOrganization)
* referralRequest only Reference(ILCoreServiceRequest or $ILHDPServiceRequest)
* careManager only Reference(ILCorePractitioner or ILCorePractitionerRole or $ILHDPPractitioner or $ILHDPPractitionerRole)
* team only Reference(ILCoreCareTeam or $ILHDPCareTeam)
