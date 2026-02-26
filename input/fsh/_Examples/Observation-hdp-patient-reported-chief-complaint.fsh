Instance: hdp-chief-complaint-gp-visit
InstanceOf: ILHDPPatientReportedChiefComplaint
Title: "HDP Patient Reported Chief Complaint - GP Visit"
Description: "Patient-reported chief complaint captured during a community/HMO GP visit."
Usage: #example

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>Chief complaint:</b> \"Patient came in for diabetes follow-up and medication review. For the past week had increased thirst, waking at night to urinate, and mild fatigue. No fever, no chest pain, no shortness of breath.\"</p><p>Linked to the community/HMO ambulatory encounter for this visit.</p></div>"

* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #encounterInformation
* meta.security[HDP].display = "Encounter information"

* status = #final
* code = $loinc#8661-1 "Chief complaint - Reported"
* valueString = "Patient came in for diabetes follow-up and medication review. For the past week had increased thirst, waking at night to urinate, and mild fatigue. No fever, no chest pain, no shortness of breath."
* subject.reference = "Patient/il-hdp-patient"
* subject.display = "ILHDP Patient"
* encounter.reference = "Encounter/hdp-community-hmo-ambulatory-gp-visit"
* encounter.display = "HDP Community/HMO Ambulatory Encounter - GP Visit"
* effectiveDateTime = "2024-11-28T09:30:00+02:00"
* performer[+].reference = "Practitioner/practitioner-md"
* performer[=].display = "Dr. Greenfeld Diana"
