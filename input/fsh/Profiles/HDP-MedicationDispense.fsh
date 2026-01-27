Profile: ILHDPMedicationDispense
Parent: ILCoreMedicationDispense
Id: il-hdp-medication-dispense
Title: "ILHDP MedicationDispense"
Description: "MedicationDispense profile for HDP"
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
* performer.actor only Reference(ILCorePractitioner or ILCorePractitionerRole or ILCoreOrganization or ILHDPOrganization or ILCoreDevice or ILCoreRelatedPerson or 
                    ILHDPPractitioner or ILHDPPractitionerRole or ILHDPPatient or ILHDPPractitioner or ILHDPPractitionerRole or  ILHDPPatient or  ILHDPOrganization)
* location only Reference(ILCoreLocation or ILHDPLocation)
* authorizingPrescription only Reference(ILCoreMedicationRequest or ILHDPMedicationRequest)
* destination only Reference(ILCoreLocation or ILHDPLocation)
* receiver only Reference(ILCorePractitioner or ILHDPPractitioner or ILHDPPatient)
* substitution.responsibleParty only Reference(ILCorePractitioner or ILCorePractitionerRole or ILHDPPractitioner or ILHDPPractitionerRole)
* dosageInstruction 1..*
// * dosageInstruction only ILHDPDosage
* dosageInstruction.text 0..1
* dosageInstruction.doseAndRate 1..*
* dosageInstruction.doseAndRate obeys medication-dose-rate-1
* dosageInstruction.doseAndRate.dose[x] 0..1
* dosageInstruction.doseAndRate.rate[x] 0..1
* dosageInstruction.site 0..1
* dosageInstruction.method 0..1
* dosageInstruction.route 1..1
* type 1..1
* whenHandedOver 1..1
// * performer 1..1
* medication[x] only CodeableConcept or Reference(ILCoreMedication or ILHDPMedication)
// * medicationReference only Reference(il-core-medication or ILHDPMedication)

