Profile: ILHDPPatientReportedChiefComplaint
Parent: ILCorePatientReportedChiefComplaint
Id: il-hdp-patient-reported-chief-complaint
Title: "ILHDP Patient Reported Chief Complaint Profile"
Description: "HDP wrapper for patient-reported chief complaint observation with security tagging"

* ^url = "http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-patient-reported-chief-complaint"
* insert ConformanceMetadata
* ^status = #draft

* insert HDPInformationBucketSecurity

* basedOn only Reference(ILCoreCarePlan or ILCoreDeviceRequest or ILCoreImmunizationRecommendation or ILCoreMedicationRequest or ILCoreNutritionOrder or ILCoreServiceRequest or $ILHDPServiceRequest)
* partOf only Reference(ILCoreMedicationAdministration or ILCoreMedicationDispense or ILCoreProcedure or ILCoreImmunization or ILCoreImagingStudy or ILCoreMedicationStatement)
* subject only Reference($ILHDPPatient)
* encounter only Reference(ILCoreEncounter or ILHDPEncounterHospitalization or ILHDPEncounterInpatientCareSegment or ILHDPEncounterCommunityHMOAmbulatory)
* performer only Reference(ILCorePractitioner or ILCorePractitionerRole or ILCoreOrganization or ILCoreCareTeam or ILCoreRelatedPerson or $ILHDPPractitioner or $ILHDPPractitionerRole or $ILHDPOrganization or $ILHDPCareTeam or $ILHDPRelatedPerson or $ILHDPPatient)
* specimen only Reference(ILCoreSpecimen)
* device only Reference(ILCoreDevice)
* hasMember only Reference(ILCoreObservation or ILCoreQuestionnaireResponse or ILCoreMolecularSequence or $ILHDPObservation)
* derivedFrom only Reference(ILCoreDocumentReference or ILCoreImagingStudy or ILCoreMedia or ILCoreQuestionnaireResponse or ILCoreObservation or ILCoreMolecularSequence or $ILHDPObservation)
