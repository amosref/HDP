Profile: ILHDPPatient
Parent: ILCorePatient
Id: il-hdp-patient
Title: "HDP Patient"
Description: "Patient profile for HDP"
* meta only ILHDPMeta
* meta.security[HDP].system = $info-buckets (exactly)
* meta.security[HDP].code = #PatientDemographics (exactly)
* meta.security[HDP].display = "דמוגרפיה" (exactly)
* extension[hmo] 1..1
* name.given 1..*
* name.family 1..1