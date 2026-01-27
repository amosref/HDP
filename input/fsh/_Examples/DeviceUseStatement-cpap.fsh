Instance: device-use-statement-cpap
InstanceOf: ILHDPDeviceUseStatement
Title: "Example ILHDP DeviceUseStatement"
Description: "Demonstrates ILHDP DeviceUseStatement profile with meta, identifiers, subject, device, basedOn, derivedFrom, source, and reasonReference"

* text.status = #generated
* text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p>Device use statement for patient: CPAP device for sleep apnea treatment.</p>
</div>
"""

* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #medications
* meta.security[HDP].display = "תרופות"

* identifier[0].system = "http://hospital.hospitalia.org/deviceusestatement"
* identifier[0].value = "DEVUSE-2025-0001"

* status = #active
* subject = Reference(Patient/example)

* basedOn[0] = Reference(ServiceRequest/example)

* derivedFrom[0] = Reference(Observation/example)
* derivedFrom[1] = Reference(DocumentReference/example)

* source = Reference(Practitioner/example)

* device = Reference(Device/example)

* reasonReference[0] = Reference(Condition/example)
* reasonReference[1] = Reference(DiagnosticReport/example)
