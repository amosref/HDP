Instance: hdp-supplemental-admission-ward-a
InstanceOf: ILHDPEncounterSupplemental
Title: "HDP Supplemental Encounter - Ward A Admission"
Description: "Supplemental encounter capturing admission-stage workflow details for the Ward A inpatient segment."
Usage: #example

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>Supplemental Encounter (Admission):</b> Records admission-specific workflow details for the Ward A segment, such as initial admission tasks and documentation capture.</p></div>"

* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #encounterInformation

* identifier[+].system = "http://hospital1.example.org/encounters"
* identifier[=].value = "HOSP1-WARDA-ADM-2024-0001"

* status = #finished
* class = $v3-ActCode#IMP "inpatient encounter"
* type[supplemental-encounter].coding[+] = $il-core-encounter-type#supplemental-encounter-hdp "Supplemental encounter (HDP encounter type)"
* serviceType = $sct#700232004 "General medical service"

* subject.reference = "Patient/il-hdp-patient"
* subject.display = "ILHDP Patient"

* period.start = "2024-11-28T15:30:00+02:00"
* period.end = "2024-11-28T16:15:00+02:00"

* serviceProvider.reference = "Organization/hospital1-ward-a"
* serviceProvider.display = "Hospital1 Internal Ward A"

* partOf.reference = "Encounter/hdp-segment-ward-a"
* partOf.display = "Ward A Inpatient Care Segment"
