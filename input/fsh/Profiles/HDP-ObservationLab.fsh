Profile: ILHDPObservationLab
Parent: il-core-observation-lab
Id: il-hdp-observation
Title: "ILHDP ObservationLab"
Description: "Observation Lab profile for HDP"
* meta only ILHDPMeta
* meta 1..1
* meta.security[HDP].system 1..1
* meta.security[HDP].code 1..1
* meta.security ^slicing.discriminator.type = #value
* meta.security ^slicing.discriminator.path = "system"
* meta.security ^slicing.rules = #closed
* meta.security ^slicing.description = "ILHDP codes only"
* meta.security[HDP] from $vs-observation-meta (required)
* subject 1..1
* subject.identifier 1..1
* subject only Reference(ILHDPPatient) 
* basedOn only Reference(il-core-care-plan or il-core-device-request or ILHDPMedicationRequest or il-core-immunization-recommendation or ILHDPMedicationRequest or il-core-nutrition-order or il-core-service-request or il-core-medication-request)
* basedOn.identifier 1..1
* performer only Reference(ILHDPPractitioner or ILHDPPractitionerRole or ILHDPOrganization or ILHDPCareTeam or ILHDPPatient or il-core-related-person or il-core-practitioner or il-core-practitioner-role or il-core-organization or il-core-care-team)
* performer[organization] 1..1
* performer[organization] only Reference(ILCoreOrganization or ILHDPOrganization)
* encounter only Reference(il-core-encounter)
* partOf only Reference(ILHDPMedicationAdministration or ILHDPMedicationStatement or ILHDPMedicationDispense or il-core-immunization or il-core-imaging-study or il-core-medication-statement)
* hasMember only Reference(il-core-observation or il-core-questionnaire-response or MolecularSequence)
* derivedFrom only Reference(ILHDPDocumentReference or il-core-document-reference or il-core-imaging-study or il-core-media or il-core-questionnaire-response or il-core-observation or il-core-molecular-sequence)
* specimen 1..1
* specimen only Reference(il-core-specimen)
* device only Reference(il-core-device or DeviceMetric)
* code 1..1
* effectiveDateTime 1..1
* value[x] 1..1
* valueQuantity.unit 1..1
* referenceRange 1..1
  * low 1..1
  * high 1..1
* interpretation 1..*


