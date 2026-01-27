Profile: ILHDPDeviceDispense
Parent: ILCoreDeviceDispense
Id: il-hdp-device-dispense
Title: "ILHDP Device Dispense Profile"
Description: "HDP constraints and extensions on the SupplyDelivery Resource."
* insert ConformanceMetadata
* . obeys one-strong-identifier
* meta 1..1
* meta only ILHDPMeta
* meta.security[HDP] 1..1
* meta.security[HDP].system = $info-buckets (exactly)
* meta.security[HDP].code = #medications (exactly)
* meta.security[HDP].display = "תרופות" (exactly)
* identifier 1..*
* basedOn.extension[alternate-reference].url = $alternet-reference (exactly)
* basedOn.extension[alternate-reference].valueReference only Reference(ILCoreDeviceRequest or ILHDPDeviceRequest)
* extension[whenHandedOver] 1..1
* patient only Reference(ILHDPPatient)
* suppliedItem 1..1
* suppliedItem.item[x] 1..1
* suppliedItem.itemReference only Reference(ILCoreDevice or ILHDPDevice)
* supplier 1..1
* supplier only Reference(ILCorePractitioner or ILHDPPractitioner or ILCorePractitionerRole or ILHDPPractitionerRole or ILCoreOrganization or ILHDPOrganization)
* destination only Reference(ILCoreLocation or ILHDPLocation)
* receiver only Reference(ILCorePractitioner or ILHDPPractitioner or ILCorePractitionerRole or ILHDPPractitionerRole)
// * receiver.extension contains http://hl7.org/fhir/StructureDefinition/alternate-reference named alternate-reference 0..1
* receiver.extension[alternate-reference].url = "http://hl7.org/fhir/StructureDefinition/alternate-reference" (exactly)
* receiver.extension[alternate-reference].valueReference only Reference(ILHDPPatient)
