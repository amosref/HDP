Profile: ILHDPDiagnosticReportPathology
Parent: ILCoreDiagnosticReport
Id: il-hdp-diagnostic-report-pathology
Title: "HDP DiagnosticReport Pathology"
Description: "DiagnosticReport profile for HDP"
* meta only ILHDPMeta
* meta.security[HDP].system = $info-buckets (exactly)
* meta.security[HDP].code = #Pathology (exactly)
* meta.security[HDP].display = "פתולוגיה" (exactly)
* subject 1..1
* subject only Reference(il-core-patient or il-core-device)
* conclusion 1..1
* conclusionCode 1..1