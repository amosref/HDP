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

* meta.security[HDP].system = $info-buckets (exactly)
* identifier 1..*
* subject 1..1
* subject.identifier 1..1
* subject only Reference(ILHDPPatient) 
* basedOn only Reference(ILCoreCarePlan or ILCoreDeviceRequest or ILHDPDeviceRequest or ILHDPMedicationRequest or ILCoreImmunizationRecommendation or ILCoreNutritionOrder or ILCoreServiceRequest or ILHDPServiceRequest or ILCoreMedicationRequest)
* basedOn.identifier 1..1
// * performer only Reference(ILHDPPractitioner or ILHDPPractitionerRole or ILHDPOrganization or ILHDPCareTeam or ILHDPPatient or ILCoreRelatedPerson or ILCorePractitioner or ILCorePractitionerRole or ILCoreOrganization or ILCoreCareTeam)
// * performer only Reference(ILHDPPractitioner or ILCorePractitioner or ILHDPOrganization or ILCoreOrganization)
* encounter only Reference(ILCoreEncounter or ILHDPEncounterHospitalization or ILHDPEncounterInpatientCareSegment or ILHDPEncounterCommunityHMOAmbulatory)
* partOf only Reference(ILCoreMedicationAdministration or ILHDPMedicationAdministration or ILCoreMedicationStatement or ILHDPMedicationStatement or ILCoreMedicationDispense or ILHDPMedicationDispense or ILCoreImmunization or ILCoreImagingStudy)
* hasMember only Reference(ILCoreObservation or ILHDPObservation or ILCoreQuestionnaireResponse or MolecularSequence)
* derivedFrom only Reference(ILHDPDocumentReference or ILCoreDocumentReference or ILCoreImagingStudy or ILCoreMedia or ILCoreQuestionnaireResponse or ILCoreObservationLab or ILHDPObservationLab or ILCoreMolecularSequence)
* specimen 1..1
* specimen only Reference(ILHDPSpecimenLab)
* device only Reference(ILCoreDevice or ILHDPDevice or DeviceMetric)
* code 1..1
* effectiveDateTime 1..1
* value[x] 0..1
* valueQuantity.unit 1..1
* referenceRange 1..1
  * low 1..1
  * high 1..1
// * interpretation 1..*
