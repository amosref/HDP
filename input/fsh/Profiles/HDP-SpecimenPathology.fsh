Profile: ILHDPSpecimenPathology
Parent: ILCoreSpecimen
Id: il-hdp-specimen-pathology
Title: "ILHDP Specimen Pathology"
Description: "Specimen-Pathology profile for HDP"
* meta only ILHDPMeta
* meta 1..1
* meta.security[HDP].system 1..1
* meta.security[HDP].code 1..1
// * meta.security[HDP] from $vs-specimen-meta (required)
* meta.security[HDP].system = $info-buckets (exactly)
* meta.security[HDP].code = #pathology (exactly)
* meta.security[HDP].display = "פתולוגיה" (exactly)
* extension[processing-practitioner].url = $ext-processing-practitioner (exactly)
* extension[processing-practitioner].value[x] only Reference(ILHDPPractitioner or ILHDPPractitionerRole or il-core-practitioner or il-core-practitioner-role)
* identifier 1..*
* status 1..1
* type 1..1
* subject 1..1
* subject only Reference(ILHDPPatient or il-core-device or ILHDPLocation or il-core-location or il-core-substance)
* receivedTime 1..1
* request 1..*
* collection.bodySite 1..1
* condition 0..*
* note 0..*

