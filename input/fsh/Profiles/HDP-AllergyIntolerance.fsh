Profile: ILHDPAllergyIntolerance
Parent: ILCoreAllergyIntolerance
Id: il-hdp-allergy-intolerance
Title: "ILHDP AllergyIntolerance Profile"
Description: "AllergyIntolerance profile for HDP"
* obeys statuses-exist
* insert ConformanceMetadata
* obeys one-strong-identifier
* meta only ILHDPMeta
* meta 1..1
* meta.security[HDP] 1..1
* meta.security[HDP].system 1..1
* meta.security[HDP].code 1..1
* meta.security[HDP].system = $info-buckets (exactly)
* meta.security[HDP].code = #allergiesAndIntolerances (exactly)
