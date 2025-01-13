Profile: ILHDPDiagnosticReport
Parent: ILCoreDiagnosticReport
Id: il-hdp-diagnostic-report
Title: "HDP DiagnosticReport"
Description: "DiagnosticReport profile for HDP"
* meta only ILHDPMeta
* meta.security[HDP] from $vs-diagnostic-report-meta (required)
* subject 1..1
* subject only Reference(il-core-patient or il-core-device)