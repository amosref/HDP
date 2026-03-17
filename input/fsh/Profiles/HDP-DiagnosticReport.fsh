Profile: ILHDPDiagnosticReport
Parent: ILCoreDiagnosticReport
Id: il-hdp-diagnostic-report
Title: "ILHDP DiagnosticReport Profile"
Description: "DiagnosticReport profile for HDP"
* insert ConformanceMetadata
* . obeys one-strong-identifier
* meta only ILHDPMeta
* meta 1..1
* meta.security ^slicing.discriminator.type = #value
* meta.security ^slicing.discriminator.path = "system"
* meta.security ^slicing.rules = #closed
* meta.security ^slicing.description = "ILHDP codes only"
* meta.security contains HDP 1..1
* meta.security[HDP] from $vs-diagnostic-report-meta (required)
* meta.security[HDP].system 1..1
* meta.security[HDP].code 1..1
* meta.security[HDP].system = $info-buckets (exactly)
* identifier 1..*
* subject 1..1
* subject only Reference(ILHDPPatient or ILCoreDevice or ILHDPLocation or ILCoreLocation)
* basedOn only Reference(ILCoreCarePlan or ILCoreImmunizationRecommendation or ILHDPMedicationRequest or ILCoreNutritionOrder or ILCoreServiceRequest or ILCoreMedicationRequest)
* performer only Reference(ILHDPPractitioner or ILHDPPractitionerRole or ILHDPOrganization or ILHDPCareTeam or ILCorePractitioner or ILCorePractitionerRole or ILCoreOrganization or ILCoreCareTeam)
* resultsInterpreter only Reference(ILHDPPractitioner or ILHDPPractitionerRole or ILHDPOrganization or ILHDPCareTeam or ILCorePractitioner or ILCorePractitionerRole or ILCoreOrganization or ILCoreCareTeam)
* specimen only Reference(ILCoreSpecimen or ILHDPSpecimenLab)
* result only Reference(ILCoreObservation or ILHDPObservationLab)