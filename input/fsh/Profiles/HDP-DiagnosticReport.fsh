Profile: ILHDPDiagnosticReport
Parent: ILCoreDiagnosticReport
Id: il-hdp-diagnostic-report
Title: "ILHDP DiagnosticReport"
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
* subject only Reference(ILHDPPatient or il-core-device or ILHDPLocation or il-core-location)
* basedOn only Reference(il-core-care-plan or ILCoreImmunizationRecommendation or ILHDPMedicationRequest or ILCoreNutritionOrder or il-core-service-request or il-core-medication-request)
* performer only Reference(ILHDPPractitioner or ILHDPPractitionerRole or ILHDPOrganization or ILHDPCareTeam or il-core-practitioner or il-core-practitioner-role or il-core-organization or il-core-care-team)
* resultsInterpreter only Reference(ILHDPPractitioner or ILHDPPractitionerRole or ILHDPOrganization or ILHDPCareTeam or il-core-practitioner or il-core-practitioner-role or il-core-organization or il-core-care-team)
* specimen only Reference(ILCoreSpecimen or ILHDPSpecimenLab)
* result only Reference(ILCoreObservation or ILHDPObservationLab)