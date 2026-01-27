Instance: device-request-pump
InstanceOf: ILHDPDeviceRequest
Title: "Example ILHDP Device Request"
Description: "Demonstrates ILHDP DeviceRequest profile with required meta, identifiers, requester, subject, codeReference, authoredOn"

* text.status = #generated
* text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p>Request for infusion pump for patient</p>
</div>
"""

* status = #active
* intent = #order
* priority = #routine

* identifier[0].system = "http://hospital.hospitalia.org/device-requests"
* identifier[0].value = "DR-2025-0001"

* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #medications
* meta.security[HDP].display = "תרופות"

* codeReference = Reference(Device/example)

* subject = Reference(Patient/example)

* requester = Reference(Practitioner/example)

* reasonReference[0] = Reference(Condition/example)

* authoredOn = "2025-09-07T09:30:00+02:00"
