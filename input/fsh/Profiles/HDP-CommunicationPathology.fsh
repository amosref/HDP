Profile: ILHDPCommunicationPathology
Parent: ILCoreCommunication
Id: il-hdp-communication-pathology
Title: "ILHDP Communication Pathology Profile"
Description: "Communication-Pathology profile for HDP"
* insert ConformanceMetadata
* . obeys one-strong-identifier
* meta only ILHDPMeta
* meta 1..1
* meta.security[HDP].system 1..1
* meta.security[HDP].code 1..1
* meta.security[HDP].system = $info-buckets (exactly)
* meta.security[HDP].code = #pathology (exactly)
* meta.security[HDP].display = "פתולוגיה" (exactly)
* identifier 1..*
* subject 1..1
* subject only Reference(ILHDPPatient)
* recipient 1..*
* recipient only Reference(ILCoreDevice or ILCoreOrganization or ILHDPOrganization  or 
                            ILHDPPatient or ILCorePractitioner or ILHDPPractitioner or ILCorePractitionerRole or
                            ILHDPPractitionerRole or ILCoreRelatedPerson or ILHDPRelatedPerson or 
                            ILCoreCareTeam or ILCoreHealthcareService)
* received 1..1