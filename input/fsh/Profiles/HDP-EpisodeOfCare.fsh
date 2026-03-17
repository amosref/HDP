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
* identifier 1..*
//----- added for testing. will leave if fixes problem
* type ^slicing.discriminator.type = #pattern
* type ^slicing.discriminator.path = "$this"
* type ^slicing.rules = #open
* type contains recurring-daily-hospitalization 0..1 and serviceType 0..1
* type[recurring-daily-hospitalization] ^patternCodeableConcept.coding.system = "http://fhir.health.gov.il/cs/il-core-episode-of-care-type"
* type[recurring-daily-hospitalization] ^patternCodeableConcept.coding.code = #recurring-daily-hospitalization
* type[serviceType] from http://fhir.health.gov.il/ValueSet/il-core-service-type (extensible)
* type[serviceType] ^short = "Service type for the episode of care"
* type[serviceType] ^definition = "Service type/specialty context for the episode, analogous to Encounter.serviceType."
//-----
* diagnosis.condition only Reference(ILCoreCondition or $ILHDPCondition)
* patient only Reference($ILHDPPatient)
* managingOrganization only Reference(ILCoreOrganization or $ILHDPOrganization)
* referralRequest only Reference(ILCoreServiceRequest or $ILHDPServiceRequest)
* careManager only Reference(ILCorePractitioner or ILCorePractitionerRole or $ILHDPPractitioner or $ILHDPPractitionerRole)
* team only Reference(ILCoreCareTeam or $ILHDPCareTeam)
