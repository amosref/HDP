Profile: ILHDPSubstance
Parent: ILCoreSubstance
Id: il-hdp-substance
Title: "ILHDP Substance"
Description: "Substance profile for HDP"
* insert ConformanceMetadata
* . obeys one-strong-identifier
* meta only ILHDPMeta
* meta 1..1
// * meta.security contains HDP 1..1
* meta.security[HDP] from $vs-substance-meta (required)
* meta.security[HDP].system 1..1
* meta.security[HDP].code 1..1
* meta.security[HDP].system = $info-buckets (exactly)
* identifier 1..*
