Instance: service-request-referral-ex
InstanceOf: ILHDPServiceRequestReferral
Usage: #example
Title: "IL HDP ServiceRequest Referral Example"
Description: "Example referral ServiceRequest demonstrating the fixed meta.security bucket, restricted intent, occurrencePeriod validity, patient instructions, notes, and the smoking/pregnancy status extensions."

* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #referrals
* meta.security[HDP].display = "הפניות"

* identifier[0].system = "http://ex-hospital.health.gov.il/referral-ids"
* identifier[0].value = "REF-2026-000123"

* status = #active
* intent = #order

* category[il-core] = $sct#306206005 "Referral to service (procedure)"

* code = $sct#183519002 "Referral to cardiology service (procedure)"

* subject = Reference(Patient/patient-with-israeli-id)
* encounter = Reference(Encounter/hdp-community-hmo-ambulatory-gp-visit)

* occurrencePeriod.start = "2026-07-14"
* occurrencePeriod.end = "2026-10-14"

* authoredOn = "2026-07-14T09:30:00+03:00"

* requester = Reference(PractitionerRole/gp)
* performer[0] = Reference(Organization/HMO1)

* reasonReference[0] = Reference(Condition/hdp-pneumonia)

* patientInstruction = "יש להגיע בצום של 8 שעות לפני הבדיקה."
* note[0].text = "המטופל מבקש תיאום מראש בשל מגבלת ניידות."

* extension[smokingStatus].valueCodeableConcept = $sct#77176002 "Smoker"
* extension[pregnancyStatus].valueBoolean = false
