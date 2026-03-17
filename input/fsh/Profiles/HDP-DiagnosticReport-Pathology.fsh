Profile: ILHDPDiagnosticReportPathology
Parent: ILCoreDiagnosticReport
Id: il-hdp-diagnostic-report-pathology
Title: "ILHDP DiagnosticReport Pathology Profile"
Description: "DiagnosticReport-Pathology profile for HDP"
* insert ConformanceMetadata
* . obeys one-strong-identifier
* meta only ILHDPMeta
* meta 1..1
* meta.security ^slicing.discriminator.type = #value
* meta.security ^slicing.discriminator.path = "system"
* meta.security ^slicing.rules = #closed
* meta.security ^slicing.description = "ILHDP codes only"
* meta.security contains HDP 1..1
* meta.security[HDP].system 1..1
* meta.security[HDP].code 1..1
* meta.security[HDP].system = $info-buckets (exactly)
* meta.security[HDP].code = #pathology (exactly)
* meta.security[HDP].display = "פתולוגיה" (exactly)
* identifier 1..*
* subject 1..1
* subject only Reference(ILHDPPatient or ILHDPLocation or ILCoreLocation or ILCoreDevice)
* basedOn only Reference(ILCoreCarePlan or ILCoreImmunizationRecommendation or ILHDPMedicationRequest or ILCoreNutritionOrder or ILCoreServiceRequest or
                        ILCoreMedicationRequest)
* performer only Reference(ILCorePractitioner or ILCorePractitionerRole or ILCoreOrganization or ILCoreCareTeam or 
                        ILHDPPractitioner or ILHDPPractitionerRole or ILHDPOrganization or ILHDPCareTeam)
* resultsInterpreter only Reference(ILHDPPractitioner or ILHDPPractitionerRole or ILHDPOrganization or ILHDPCareTeam or ILCorePractitioner or ILCorePractitionerRole or ILCoreOrganization or ILCoreCareTeam)
* conclusion 1..1
* conclusionCode 1..*
* result 1..*