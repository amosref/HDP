Profile: ILHDPMedicationStatement
Parent: ILCoreMedicationStatement
Id: il-hdp-medication-statement
Title: "ILHDP MedicationStatement"
Description: "MedicationStatement profile for HDP"
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
* . obeys effective-start-end
* identifier 1..*
* extension[courseOfTherapyType] 1..1
* subject 1..1
* subject only Reference(ILHDPPatient)
* dosage 1..*
* dosage.text 0..1
* dosage.doseAndRate 1..*
* dosage.doseAndRate obeys medication-dose-rate-1
* dosage.doseAndRate.dose[x] 0..1
* dosage.doseAndRate.rate[x] 0..1
* dosage.site 0..1
* dosage.method 0..1
* dosage.route 1..1
* basedOn only Reference(il-core-care-plan or ILCoreMedicationRequest or ILHDPMedicationRequest or ILCoreServiceRequest)
* partOf only Reference(ILCoreMedicationAdministration or il-core-medication-dispense or ILCoreMedicationStatement or ILCoreProcedure or ILCoreObservation or ILHDPMedicationAdministration or ILHDPMedicationDispense or ILHDPMedicationStatement or ILCoreProcedure)
* medication[x] only CodeableConcept or Reference(ILCoreMedication or ILHDPMedication)
// * medicationReference only Reference(ILCoreMedication or ILHDPMedication)
* subject only Reference(ILHDPPatient)
* informationSource only Reference(ILCorePractitioner or ILCorePractitionerRole or ILCoreRelatedPerson or ILCoreOrganization or ILHDPPatient or ILHDPPractitioner or ILHDPPractitionerRole or ILHDPOrganization)
* reasonReference only Reference(ILCoreCondition or ILCoreObservation or ILCoreDiagnosticReport or ILHDPCondition or ILHDPDiagnosticReport)



