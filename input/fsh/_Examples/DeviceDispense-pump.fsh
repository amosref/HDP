Instance: device-dispense-pump
InstanceOf: ILHDPDeviceDispense
Title: "Example ILHDP Device Dispense"
Description: "Demonstrates ILHDP Device Dispense profile with required meta, identifiers, extensions, and constrained references"

* text.status = #generated
* text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p>Dispense of infusion pump to patient</p>
</div>
"""

* status = #completed
* occurrenceDateTime = "2025-09-07T12:00:00+02:00"

* identifier[0].system = "http://hospital.hospitalia.org/device-dispenses"
* identifier[0].value = "DD-2025-0001"

* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #medications
* meta.security[HDP].display = "תרופות"

* basedOn = Reference(DeviceRequest/example)
* basedOn.extension[alternate-reference].url = $alternet-reference
* basedOn.extension[alternate-reference].valueReference = Reference(DeviceRequest/example)

* extension[whenHandedOver].url = "http://fhir.health.gov.il/StructureDefinition/ext-device-dispense-when-handed-over"
* extension[whenHandedOver].valueDateTime = "2025-09-07T12:15:00+02:00"

* patient = Reference(Patient/example)

* suppliedItem.quantity.value = 1
* suppliedItem.itemReference = Reference(Device/example)

* supplier = Reference(Organization/example)

* destination = Reference(Location/example)

* receiver = Reference(Practitioner/example)
* receiver.extension[alternate-reference].url = "http://hl7.org/fhir/StructureDefinition/alternate-reference"
* receiver.extension[alternate-reference].valueReference = Reference(Patient/example)
