Profile: ILHDPCondition
Parent: ILCoreCondition
Id: il-hdp-condition
Title: "HDP Condition"
Description: "Condition profile for HDP"
* meta only ILHDPMeta
* meta.security[HDP].system = $info-buckets (exactly)
* meta.security[HDP].code = #Diagnoses (exactly)
* meta.security[HDP].display = "אבחנות" (exactly)
* code from $vs-il-hdp-condition-code (extensible)
* subject only Reference(il-core-patient)
* clinicalStatus 1..1
* verificationStatus 1..1
* recordedDate 1..1
* recorder 1..1

