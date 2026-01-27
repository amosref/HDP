Instance: hdp-diagnostic-lab-report
InstanceOf: ILHDPDiagnosticReport
Title: "Lipid Panel Diagnostic Report"
Description: "Example of a laboratory diagnostic report conforming to the HDP profile"

* meta.profile = "http://hdp.fhir.health.gov.il/StructureDefinition/il-hdp-diagnostic-report"
* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #laboratoryTests
* meta.security[HDP].display = "בדיקות מעבדה"
* identifier.id = "lab-report"
* identifier.system = "http://goodcare.org/reports/id"
* status = #final
* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#LAB "Laboratory"
* code.coding = http://loinc.org#57698-3 "Lipid panel with direct LDL - Serum or Plasma"
* code.text = "Lipid Panel Report"

* subject = Reference(Patient/patient-with-israeli-id) "תמר כהן"
* encounter = Reference(Encounter/breast-screaning) "Encounter with Dr. Smith"
* effectiveDateTime = "2024-11-05T14:30:00Z"
* issued = "2024-11-05T15:00:00Z"

* performer[0] = Reference(Organization/ministry-of-health) "Acme Laboratory Services"
* performer[1] = Reference(Practitioner/practitioner-md) "דר גרינפלד דיאנה"

* result[0] = Reference(Observation/obs1) "Cholesterol Total"
* result[1] = Reference(Observation/obs2) "HDL Cholesterol"
* result[2] = Reference(Observation/obs3) "LDL Cholesterol"
* identifier.value = "LAB-2024-0001"
