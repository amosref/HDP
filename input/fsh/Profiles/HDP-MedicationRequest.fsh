Profile: ILHDPMedicationRequest
Parent: ILCoreMedicationRequest
Id: il-hdp-medication-request
Title: "ILHDP MedicationRequest"
Description: "MedicationRequest profile for HDP"
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
* authoredOn 1..1
* dosageInstruction 1..1
* courseOfTherapyType 1..1
* requester only Reference(ILHDPPatient or ILHDPPractitioner or ILHDPPractitionerRole or ILCoreRelatedPerson or ILHDPOrganization or il-core-device or il-core-practitioner or il-core-practitioner-role or il-core-organization or il-core-related-person)
* performer only Reference(ILHDPPractitioner or ILHDPPractitionerRole or ILHDPOrganization or ILHDPPatient or ILCoreRelatedPerson or ILHDPCareTeam or il-core-device or il-core-practitioner or il-core-practitioner-role or il-core-organization or il-core-care-team)
* recorder only Reference(ILHDPPractitioner or ILHDPPractitionerRole or il-core-practitioner or il-core-practitioner-role)
* reasonReference only Reference(ILHDPCondition or ILCoreObservation)
* basedOn only Reference(il-core-care-plan or ILHDPMedicationRequest or il-core-service-request or il-core-immunization-recommendation or il-core-medication-request)
* reportedReference only Reference(ILHDPPatient or ILHDPPractitioner or il-core-practitioner or ILHDPPractitionerRole or il-core-practitioner-role or il-core-related-person or ILHDPOrganization or il-core-organization)
* medicationReference only Reference(il-core-medication or ILHDPMedication)
* dosageInstruction 1..1
* dosageInstruction.text 1..1
* dosageInstruction.doseAndRate 1..*
* dosageInstruction.doseAndRate.dose[x] 1..1
* dosageInstruction.doseAndRate.rate[x] 1..1
* dosageInstruction.site 1..1
* dosageInstruction.method 1..1
* dosageInstruction.route 1..1

