Profile: ILHDPMedicationAdministration 
Parent: ILCoreMedicationAdministration 
Id: il-hdp-medication-administration
Title: "ILHDP MedicationAdministration"
Description: "MedicationAdministration profile for HDP"
* insert ConformanceMetadata
* . obeys one-strong-identifier
* meta only ILHDPMeta
* meta 1..1
* meta.security[HDP] 1..1
* meta.security[HDP].system 1..1
* meta.security[HDP].code 1..1
* meta.security[HDP].system = $info-buckets (exactly)
* meta.security[HDP].code = #medications (exactly)
* meta.security[HDP].display = "תרופות" (exactly)
// * subject 1..1
* identifier 1..*
* subject only Reference(ILHDPPatient)
* partOf only Reference(ILCoreMedicationAdministration or ILHDPMedicationAdministration or ILCoreProcedure)
* subject only Reference(ILHDPPatient)
* medication[x] only CodeableConcept or Reference(ILCoreMedication or ILHDPMedication)
// * medicationReference only Reference(ILCoreMedication or ILHDPMedication)
* performer 1..*
* performer.actor only Reference(ILCorePractitioner or ILHDPPractitioner or ILCorePractitionerRole or ILHDPPractitionerRole or ILHDPPatient or ILCoreRelatedPerson or ILCoreDevice)
* reasonReference only Reference(ILCoreCondition or ILHDPCondition or ILCoreObservation or ILCoreDiagnosticReport or ILHDPDiagnosticReport)
* request only Reference(ILCoreMedicationRequest or ILHDPMedicationRequest)
* device only Reference(ILCoreDevice)
* dosage 1..1
// * dosage obeys medication-dose-rate-1
* dosage.text 0..1
* dosage.dose 0..1
* dosage.rate[x] 0..1
* dosage.site 0..1
* dosage.method 0..1
* dosage.route 1..1
* effective[x] 1..1

