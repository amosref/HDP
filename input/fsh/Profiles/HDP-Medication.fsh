Profile: ILHDPMedication
Parent: ILCoreMedication
Id: il-hdp-medication
Title: "ILHDP Medication"
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
* identifier.assigner only Reference(ILHDPOrganization or il-core-organization)
* manufacturer only Reference(ILHDPOrganization  or il-core-organization)
* ingredient.itemReference only Reference(il-core-substance or ILHDPMedication or il-core-medication)