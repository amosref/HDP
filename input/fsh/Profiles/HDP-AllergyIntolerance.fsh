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
* meta.security[HDP].system = $info-buckets (exactly)
* meta.security[HDP].code = #allergiesAndIntolerances (exactly)
* meta.security[HDP].display = "רגישויות" (exactly)

* identifier 1..*
* patient 1..1
* recorder 1..1
* code 1..1
* category 1..*
* onset[x] 1..1
* recordedDate 1..1
