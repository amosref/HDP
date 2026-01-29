Profile: ILHDPSpecimenLab
Parent: ILCoreSpecimen
Id: il-hdp-specimen-lab
Title: "ILHDP Specimen Lab Profile"
Description: "Specimen- profile for HDP"
* insert ConformanceMetadata
* . obeys one-strong-identifier
* meta only ILHDPMeta
* meta 1..1
* meta.security[HDP].system 1..1
* meta.security[HDP].code 1..1
// * meta.security[HDP] from $vs-specimen-meta (required)
* meta.security[HDP].system = $info-buckets (exactly)
* meta.security[HDP].code = #laboratoryTests (exactly)
* meta.security[HDP].display = "בדיקות מעבדה" (exactly)
* identifier 1..*
* type 1..1
* subject 1..1
* subject only Reference(ILHDPPatient or il-core-device or ILHDPLocation or il-core-location or il-core-substance)
* parent only Reference(ILCoreSpecimen or ILHDPSpecimenLab)
* receivedTime 0..1
* request 1..*
* collection.bodySite 1..1
* condition 0..*
* note 0..*
* collection.collected[x] 1..1
