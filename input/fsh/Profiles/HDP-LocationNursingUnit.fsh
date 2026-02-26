Profile: ILHDPLocationNursingUnit
Parent: ILCoreLocationNursingUnit
Id: il-hdp-location-nursing-unit
Title: "ILHDP Location Nursing Unit Profile"
Description: "HDP wrapper for nursing unit locations with security tagging"

* ^url = "http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-location-nursing-unit"
* insert ConformanceMetadata
* ^status = #draft

* insert HDPInformationBucketSecurity

* managingOrganization only Reference($ILOrganization or $ILHDPOrganization)
* partOf only Reference($ILLocation or $ILLocationNursingUnit or $ILHDPLocation or $ILHDPLocationNursingUnit)
