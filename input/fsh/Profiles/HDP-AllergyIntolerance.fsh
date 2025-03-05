Profile: ILHDPAllergyIntolerance
Parent: ILCoreAllergyIntolerance
Id: il-hdp-allergy-intolerance
Title: "ILHDP AllergyIntolerance"
Description: "AllergyIntolerance profile for HDP"
* meta only ILHDPMeta
* meta 1..1
* meta.security[HDP] 1..1
* meta.security[HDP].system 1..1
* meta.security[HDP].code 1..1
* meta.security[HDP].system = $info-buckets (exactly)
* meta.security[HDP].code = #allergiesAndIntolerances (exactly)
* meta.security[HDP].display = "רגישויות" (exactly)
* extension[AllergyIntoleranceEnd].extension 1..1
* extension[AllergyIntoleranceEnd].extension[endDate] 1..1
* recorder 1..1
* asserter 1..1
* onset[x] 1..1
* category 1..1
* reaction 1..*
* clinicalStatus 1..1
* verificationStatus 1..1
* encounter 1..1
