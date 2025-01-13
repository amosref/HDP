//This is a test file to figure out a bug

Profile: BugFix
Parent: ILCoreEncounter  // this change ended the bug...
Id: il-hdp-diagnostic-report-bug-fix
Title: "HDP DiagnosticReport"
Description: "DiagnosticReport profile for HDP"
* meta only ILHDPMeta
* meta.security[HDP].system = $info-buckets (exactly)
* meta.security[HDP].code = #Practitioner (exactly)
* meta.security[HDP].display = "מטפל" (exactly)
* subject only Reference(il-core-patient)

