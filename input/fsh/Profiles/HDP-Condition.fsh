Profile: ILHDPCondition
Parent: ILCoreCondition
Id: il-hdp-condition
Title: "ILHDP Condition Profile"
Description: "Condition profile for HDP"
* obeys statuses-exist
* insert ConformanceMetadata
* . obeys one-strong-identifier
* meta only ILHDPMeta
* meta 1..1
* meta.security[HDP] 1..1
* meta.security[HDP].system 1..1
* meta.security[HDP].code 1..1
* meta.security[HDP].system = $info-buckets (exactly)
* meta.security[HDP].code = #diagnoses (exactly)
* meta.security[HDP].display = "אבחנות" (exactly)
* identifier 1..*
* code from $vs-il-hdp-condition-code (extensible)
* subject only Reference(ILHDPPatient)
// * clinicalStatus 1..1
// * verificationStatus 1..1
* recordedDate 1..1
* recorder 1..1
* recorder only Reference(ILHDPPractitioner or ILHDPPractitionerRole or ILHDPPatient or il-core-related-person or il-core-practitioner or il-core-practitioner-role)
// * recorder.extension contains http://hl7.org/fhir/StructureDefinition/alternate-reference named alternate-reference 0..1
* recorder.extension[alternate-reference].url = "http://hl7.org/fhir/StructureDefinition/alternate-reference" (exactly)
* recorder.extension[alternate-reference].valueReference only Reference(ILHDPDevice)
* asserter only Reference(ILCorePractitioner or ILCorePractitionerRole or ILHDPPractitioner or ILHDPPractitionerRole or ILHDPPatient or ILCoreRelatedPerson)
* stage.assessment only Reference(ClinicalImpression or ILHDPDiagnosticReport or il-core-diagnostic-report or il-core-observation)

