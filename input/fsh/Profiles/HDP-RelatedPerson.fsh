Profile: ILHDPRelatedPerson
Parent: ILCoreRelatedPerson
Id: il-hdp-related-person
Title: "ILHDP RelatedPerson"
Description: "RelatedPerson profile for HDP"
* insert ConformanceMetadata
* . obeys one-strong-identifier
* meta only ILHDPMeta
* meta 1..1
* meta.security[HDP] 1..1
* meta.security[HDP].system 1..1
* meta.security[HDP].code 1..1
* meta.security[HDP].system = $info-buckets (exactly)
* meta.security[HDP].code = #patientDemographics (exactly)
* meta.security[HDP].display = "דמוגרפיה" (exactly)
* identifier 1..*