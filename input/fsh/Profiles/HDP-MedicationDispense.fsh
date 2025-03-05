Profile: ILHDPMedicationDispense
Parent: ILCoreMedicationDispense
Id: il-hdp-medication-dispense
Title: "ILHDP MedicationDispense"
Description: "MedicationDispense profile for HDP"
* meta only ILHDPMeta
* meta 1..1
* meta.security[HDP] 1..1
* meta.security[HDP].system 1..1
* meta.security[HDP].code 1..1
* meta.security[HDP].system = $info-buckets (exactly)
* meta.security[HDP].code = #medications (exactly)
* meta.security[HDP].display = "תרופות" (exactly)
* subject 1..1
* subject only Reference(ILHDPPatient)
* performer.actor only Reference(ILCorePractitioner or ILCorePractitionerRole or ILCoreOrganization or ILCoreDevice or ILCoreRelatedPerson or ILHDPPractitioner or ILHDPPractitionerRole or ILHDPPatient)
* location only Reference(ILCoreLocation or ILHDPLocation)
* authorizingPrescription only Reference(ILCoreMedicationRequest or ILHDPMedicationRequest)
* destination only Reference(ILCoreLocation or ILHDPLocation)
* receiver only Reference(ILCorePractitioner or ILHDPPractitioner or ILHDPPatient)
* substitution.responsibleParty only Reference(ILCorePractitioner or ILCorePractitionerRole or ILHDPPractitioner or ILHDPPractitionerRole)
* dosageInstruction 1..1
// * dosageInstruction only ILHDPDosage
* dosageInstruction 1..1
* dosageInstruction.text 1..1
* dosageInstruction.doseAndRate 1..*
* dosageInstruction.doseAndRate.dose[x] 1..1
* dosageInstruction.doseAndRate.rate[x] 1..1
* dosageInstruction.site 1..1
* dosageInstruction.method 1..1
* dosageInstruction.route 1..1
* type 1..1
* whenHandedOver 1..1
* performer 1..1
* medicationReference only Reference(il-core-medication or ILHDPMedication)

