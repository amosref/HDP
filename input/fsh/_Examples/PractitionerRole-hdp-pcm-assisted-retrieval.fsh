// Example: PCMPractitionerRoleAssisted (retrieval)
// Scenario: Assisted-consent practitioner role record returned by HO/PCM.
// FHIR REST: GET https://pcm.fhir.health.gov.il/r4/PractitionerRole?identifier=PRAC-123456&role=http://fhir.health.gov.il/cs/il-core-practitioner-role|consent-assistant&active=true

Instance: practitioner-role-assisted-hosp-a
InstanceOf: ILHDPPCMPractitionerRoleAssisted

Description: "Assisted-consent practitioner role (retrieval)"
Usage: #example
* text.status = #generated
* text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
<p>Assisted-consent practitioner role used for OTP-based practitioner authentication.</p>
<p>FHIR REST: <code>GET https://pcm.fhir.health.gov.il/r4/PractitionerRole?identifier=PRAC-123456&amp;role=http://fhir.health.gov.il/cs/il-core-practitioner-role|consent-assistant&amp;active=true</code></p>
</div>
"""

* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #practitioner
* meta.security[HDP].display = "מטפל"

* active = true

* identifier.use = #official
* identifier.system = "https://hospital-a.example.org/fhir/sid/practitioner-role-id"
* identifier.value = "PRAC-123456"
* identifier.type.coding.system = "http://fhir.health.gov.il/cs/il-core-identifier-type"
* identifier.type.coding.code = #strong-id

* code.coding.system = "http://fhir.health.gov.il/cs/il-core-practitioner-role"
* code.coding.code = #consent-assistant

* organization = Reference(hospital1)

* telecom.system = #sms
* telecom.value = "+972-50-7000001"
* telecom.extension[purpose].valueCodeableConcept.coding.system = "http://fhir.health.gov.il/cs/il-core-contact-point-purpose"
* telecom.extension[purpose].valueCodeableConcept.coding.code = #OTP
