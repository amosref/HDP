Profile: ILHDPObservationLab
Parent: ILCoreObservationLab
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
* basedOn only Reference(ILCoreCarePlan or ILCoreDeviceRequest or ILHDPMedicationRequest or ILCoreImmunizationRecommendation or ILHDPMedicationRequest or ILCoreNutritionOrder or ILCoreServiceRequest or ILCoreMedicationRequest)
* basedOn.identifier 1..1
// * performer only Reference(ILHDPPractitioner or ILHDPPractitionerRole or ILHDPOrganization or ILHDPCareTeam or ILHDPPatient or ILCoreRelatedPerson or ILCorePractitioner or ILCorePractitionerRole or ILCoreOrganization or ILCoreCareTeam)
// * performer only Reference(ILHDPPractitioner or ILCorePractitioner or ILHDPOrganization or ILCoreOrganization)
* encounter only Reference(ILCoreEncounter)
* partOf only Reference(ILHDPMedicationAdministration or ILHDPMedicationStatement or ILHDPMedicationDispense or ILCoreImmunization or ILCoreImagingStudy or ILCoreMedicationStatement)
* hasMember only Reference(ILCoreObservation or ILCoreQuestionnaireResponse or MolecularSequence)
* derivedFrom only Reference(ILHDPDocumentReference or ILCoreDocumentReference or ILCoreImagingStudy or ILCoreMedia or ILCoreQuestionnaireResponse or ILHDPObservationLab or ILCoreMolecularSequence)
* specimen 1..1
* specimen only Reference(ILHDPSpecimenLab)
* device only Reference(ILCoreDevice or DeviceMetric)
* code 1..1
* effectiveDateTime 1..1
* value[x] 0..1
* valueQuantity.unit 1..1
* referenceRange 1..1
  * low 1..1
  * high 1..1
// * interpretation 1..*
