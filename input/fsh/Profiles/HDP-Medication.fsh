Profile: ILHDPMedication
Parent: ILCoreMedication
Id: il-hdp-medication
Title: "ILHDP Medication Profile"
Description: "Medication profile for HDP"
* insert ConformanceMetadata
* . obeys one-strong-identifier
* meta only ILHDPMeta
* meta 1..1
* meta.security[HDP].system 1..1
* meta.security[HDP].code 1..1
* meta.security[HDP] 1..1
* meta.security[HDP].system = $info-buckets (exactly)
* meta.security[HDP].code = #medications (exactly)
* meta.security[HDP].display = "תרופות" (exactly)
* identifier 1..*
* identifier.assigner only Reference(ILHDPOrganization or ILCoreOrganization)
* manufacturer only Reference(ILHDPOrganization  or ILCoreOrganization)
* ingredient.itemReference only Reference(ILCoreSubstance or ILHDPMedication or ILCoreMedication)