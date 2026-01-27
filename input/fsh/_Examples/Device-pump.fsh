Instance: hdp-device-infusion-pump
InstanceOf: ILHDPDevice
Title: "Example ILHDP Device"
Description: "Demonstrates ILHDP Device profile with required meta, identifiers, and constrained references"

* text.status = #generated
* text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p>Device: Infusion Pump assigned to patient</p>
</div>
"""

* status = #active
* distinctIdentifier = "12345-XYZ"
* manufacturer = "Acme Medical Devices Ltd."
* modelNumber = "IP-2025"
* serialNumber = "SN-987654321"

* type = $sct#706172005 "Ventilator (physical object)"

* identifier[0].system = "http://hospital.hospitalia.org/devices"
* identifier[0].value = "DEV-2025-0001"

* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #medications
* meta.security[HDP].display = "תרופות"

* patient = Reference(Patient/example)
* owner = Reference(Organization/example)
* location = Reference(Location/example)
* parent = Reference(Device/example)
