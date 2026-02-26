Profile: ILHDPObservationLab
Parent: il-core-observation-lab
Id: il-hdp-observation-lab
Title: "ILHDP ObservationLab Profile"
Description: "Observation Lab profile for HDP"
* . obeys obs-lab-value-absent
* insert ConformanceMetadata
* . obeys one-strong-identifier
* meta only ILHDPMeta
* meta 1..1
* meta.security[HDP] from $vs-observation-lab-meta (required)
* meta.security[HDP].system 1..1
* meta.security[HDP].system = $info-buckets (exactly)
* meta.security[HDP].code 1..1
* identifier 1..*
* subject 1..1
* subject.identifier 1..1
* subject only Reference(ILHDPPatient) 
* basedOn only Reference(il-core-care-plan or il-core-device-request or ILHDPMedicationRequest or il-core-immunization-recommendation or ILHDPMedicationRequest or il-core-nutrition-order or il-core-service-request or il-core-medication-request)
* basedOn.identifier 1..1
// * performer only Reference(ILHDPPractitioner or ILHDPPractitionerRole or ILHDPOrganization or ILHDPCareTeam or ILHDPPatient or il-core-related-person or il-core-practitioner or il-core-practitioner-role or il-core-organization or il-core-care-team)
// * performer only Reference(ILHDPPractitioner or il-core-practitioner or ILHDPOrganization or il-core-organization)
* encounter only Reference(il-core-encounter)
* partOf only Reference(ILHDPMedicationAdministration or ILHDPMedicationStatement or ILHDPMedicationDispense or il-core-immunization or il-core-imaging-study or il-core-medication-statement)
* hasMember only Reference(il-core-observation or il-core-questionnaire-response or MolecularSequence)
* derivedFrom only Reference(ILHDPDocumentReference or il-core-document-reference or il-core-imaging-study or il-core-media or il-core-questionnaire-response or ILHDPObservationLab or il-core-molecular-sequence)
* specimen 1..1
* specimen only Reference(ILHDPSpecimenLab)
* device only Reference(il-core-device or DeviceMetric)
* code 1..1
* effectiveDateTime 1..1
* value[x] 0..1
* valueQuantity.unit 1..1
* referenceRange 1..1
  * low 1..1
  * high 1..1
// * interpretation 1..*
