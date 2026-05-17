Profile: ILHDPPatient
Parent: ILCorePatient
Id: il-hdp-patient
Title: "ILHDP Patient Profile"
Description: "Patient profile for HDP"
* insert ConformanceMetadata
* . obeys one-strong-identifier-warning
* obeys check-identifiers
* obeys il-id-or-ppn
* meta only ILHDPMeta
* meta 1..1

* meta.security[HDP].system = $info-buckets (exactly)
* meta.security[HDP].code = #patientDemographics (exactly)
* meta.security[HDP].display = "דמוגרפיה" (exactly)
* extension[hmo] 1..1
// * identifier obeys il-id-or-ppn
* name.given 1..*
* name.family 1..1
// * birthDate 1..1 // already 1..1
// * gender 1..1  // already 1..1
* contact.organization only Reference(ILCoreOrganization or ILHDPOrganization)
* generalPractitioner only Reference(ILCoreOrganization or ILCorePractitioner or ILCorePractitionerRole or ILHDPOrganization or ILHDPPractitioner or ILHDPPractitionerRole)
* managingOrganization only Reference(ILCoreOrganization or ILHDPOrganization)
* link.other only Reference(ILHDPPatient or ILCoreRelatedPerson)