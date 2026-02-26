Instance: hdp-chief-complaint-hospitalization
InstanceOf: ILHDPPatientReportedChiefComplaint
Title: "HDP Patient Reported Chief Complaint - Hospital Admission"
Description: "Patient-reported chief complaint at admission, linked to the hospitalization encounter."
Usage: #example

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>Chief complaint:</b> Fever, cough, and shortness of breath for two days.</p><p>Recorded at admission and linked to the hospitalization encounter.</p></div>"

* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #encounterInformation
* meta.security[HDP].display = "Encounter information"

* status = #final
* code = $loinc#8661-1 "Chief complaint - Reported"
* valueString = "Fever, cough, and shortness of breath for two days."
* subject.reference = "Patient/il-hdp-patient"
* subject.display = "HDP Patient with Israeli ID"
* encounter.reference = "Encounter/hdp-hospitalization-hospital1"
* encounter.display = "Hospital1 Hospitalization"
* effectiveDateTime = "2024-11-28T08:20:00+02:00"
* performer[+].reference = "Practitioner/practitioner-md"
* performer[=].display = "Dr. Greenfeld Diana"
