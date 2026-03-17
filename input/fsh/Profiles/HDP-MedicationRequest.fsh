Profile: ILHDPMedicationRequest
Parent: ILCoreMedicationRequest
Id: il-hdp-medication-request
Title: "ILHDP MedicationRequest Profile"
Description: "MedicationRequest profile for HDP"
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
* identifier 1..*
* subject 1..1
* subject only Reference(ILHDPPatient)
* authoredOn 1..1
* courseOfTherapyType 1..1
* requester only Reference(ILHDPPatient or ILHDPPractitioner or ILHDPPractitionerRole or ILCoreRelatedPerson or ILHDPOrganization or ILCoreDevice or ILCorePractitioner or ILCorePractitionerRole or ILCoreOrganization or ILCoreRelatedPerson)
* performer only Reference(ILHDPPractitioner or ILHDPPractitionerRole or ILHDPOrganization or ILHDPPatient or ILCoreRelatedPerson or ILHDPCareTeam or ILCoreDevice or ILCorePractitioner or ILCorePractitionerRole or ILCoreOrganization or ILCoreCareTeam)
* recorder only Reference(ILHDPPractitioner or ILHDPPractitionerRole or ILCorePractitioner or ILCorePractitionerRole)
* reasonReference only Reference(ILHDPCondition or ILCoreObservation)
* basedOn only Reference(ILCoreCarePlan or ILHDPMedicationRequest or ILCoreServiceRequest or ILCoreImmunizationRecommendation or ILCoreMedicationRequest)
* reportedReference only Reference(ILHDPPatient or ILHDPPractitioner or ILCorePractitioner or ILHDPPractitionerRole or ILCorePractitionerRole or ILCoreRelatedPerson or ILHDPOrganization or ILCoreOrganization)
// * medicationReference only Reference(ILCoreMedication or ILHDPMedication)
* medication[x] only CodeableConcept or Reference(ILCoreMedication or ILHDPMedication)
* dosageInstruction 1..*
* dosageInstruction.text 1..1
* dosageInstruction.doseAndRate 1..*
* dosageInstruction.doseAndRate obeys medication-dose-rate-1
* dosageInstruction.doseAndRate.dose[x] 0..1
* dosageInstruction.doseAndRate.rate[x] 0..1
* dosageInstruction.site 0..1
* dosageInstruction.method 0..1
* dosageInstruction.route 1..1

