Instance: hdp-community-hmo-ambulatory-gp-visit
InstanceOf: ILHDPEncounterCommunityHMOAmbulatory
Title: "HDP Community/HMO Ambulatory Encounter - GP Visit"
Description: "Example of a simple face-to-face GP visit at an HMO clinic (HMO1) using the ILHDP community/HMO ambulatory encounter profile."
Usage: #example

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>Encounter:</b> HMO GP visit (community/ambulatory).</p><p>Patient is seen by their GP at an HMO clinic for routine follow-up. The encounter is a short, face-to-face visit in the community setting.</p><p>Type is fixed to the HDP community/HMO ambulatory code; Reason and diagnosis reference existing condition resources.</p></div>"

* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #encounterInformation
* meta.security[HDP].display = "Encounter information"

* identifier[+].system = "http://hmo1.example.org/encounters"
* identifier[=].value = "HMO1-GP-2024-0001"

* status = #finished
* class = $il-core-encounter-class#COMMUNITY-OR-HMO "Community Care/HMO setting"
* type[community-hmo-ambulatory].coding[+] = $il-core-encounter-type#community-hmo-ambulatory-hdp "Community/HMO ambulatory encounter (HDP encounter type)"
* type[face-to-face].coding[+] = $sct#1258986006 "Face-to-face encounter"
* serviceType = $sct#700232004 "General medical service"

* subject.reference = "Patient/il-hdp-patient"
* subject.display = "ILHDP Patient"

* participant[primary-performer].type.coding[+].system = "http://terminology.hl7.org/CodeSystem/v3-ParticipationType"
* participant[primary-performer].type.coding[=].code = #PPRF
* participant[primary-performer].type.coding[=].display = "primary performer"
* participant[primary-performer].individual.reference = "Practitioner/practitioner-md"
* participant[primary-performer].individual.display = "Dr. Greenfeld Diana"

* period.start = "2024-11-28T09:30:00+02:00"
* period.end = "2024-11-28T09:50:00+02:00"

* serviceProvider.reference = "Organization/HMO1"
* serviceProvider.display = "HMO1"
* serviceProvider.identifier.system = $legal-entity
* serviceProvider.identifier.value = "515555555"

* location[+].location.display = "HMO1 GP Clinic"
* location[=].status = #completed

* reasonCode[+] = $sct#185349003 "Encounter for check-up"
* reasonReference[+].reference = "Condition/type-1-diabetes"
* reasonReference[=].display = "Type 1 Diabetes"
* reasonReference[patient-reported-chief-complaint].reference = "Observation/hdp-chief-complaint-gp-visit"
* reasonReference[patient-reported-chief-complaint].display = "Patient-reported chief complaint"

* diagnosis[+].condition.reference = "Condition/type-1-diabetes"
* diagnosis[=].condition.display = "Type 1 Diabetes"
* diagnosis[=].use = $il-core-diagnosis-role#primary-diagnosis "Primary diagnosis"
* diagnosis[=].rank = 1
