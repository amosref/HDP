Profile: ILHDPPCMPractitionerRoleAssisted
Parent: ILHDPPractitionerRole
Id: il-hdp-pcm-assisted-practitioner-role
Title: "Practitioner Role for PCM Assisted Consent"
Description: "PractitionerRole details provided by healthcare organizations for assisted consent authentication in PCM."

* ^status = #active

* identifier 1..1
* identifier ^short = "Single internal healthcare-organization identifier for assisted-consent practitioner role lookup."
* identifier ^definition = "Exactly one identifier is allowed. The identifier is assigned in the healthcare organization's internal code system and used by PCM to locate the assisted-consent practitioner role."
* identifier.use 1..1
* identifier.use = #official (exactly)
* identifier.system 1..1
* identifier.system ^short = "Internal healthcare-organization identifier system URI."
* identifier.system ^definition = "Organization-defined identifier system URI. PCM does not prescribe one global system URI because each healthcare organization may use its own internal system."
* identifier.value 1..1
* identifier.value ^short = "Identifier value in the healthcare-organization internal system."
* identifier.value ^comment = "HO SHALL NOT expose more than one active assisted-consent PractitionerRole with the same identifier.value."
* identifier.type 1..1
* identifier.type ^short = "Identifier type from national regulation."
* identifier.type ^definition = "Identifier type is required and fixed to the IL Core identifier type strong-id to indicate a strong identifier as defined by regulation."
* identifier.type.coding 1..1
* identifier.type.coding.system 1..1
* identifier.type.coding.system = "http://fhir.health.gov.il/cs/il-core-identifier-type" (exactly)
* identifier.type.coding.code 1..1
* identifier.type.coding.code = #strong-id (exactly)
* identifier.period 0..0
* identifier.assigner 0..0

* code 1..1
* code ^short = "Role classification for assisted-consent authentication."
* code ^definition = "Fixed code used to distinguish this PractitionerRole as an assisted-consent role for authentication workflows."
* code.coding 1..1
* code.coding.system 1..1
* code.coding.system = "http://fhir.health.gov.il/cs/il-core-practitioner-role" (exactly)
* code.coding.code 1..1
* code.coding.code = #consent-assistant (exactly)

* practitioner 0..1
* practitioner ^short = "Reference to the Practitioner resource representing the individual performing the assisted consent authentication."
* practitioner ^definition = "The healthcare organization MAY include PractitionerRole.practitioner reference when it wants to link the assisted-consent role to an existing Practitioner resource. PCM SHALL NOT require this reference for authentication. The authoritative resource for assisted-consent authentication is the PractitionerRole resource itself."

* organization 1..1
* organization ^short = "Organization that owns and provides this assisted-consent PractitionerRole."

* telecom 1..1
* telecom ^short = "Single OTP delivery contact point."
* telecom ^definition = "Exactly one telecom is allowed and it is used for one-time-password delivery in assisted-consent authentication."
* telecom.system 1..1
* telecom.system = #sms (exactly)
* telecom.value 1..1
* telecom.value ^short = "SMS destination for OTP delivery."
* telecom.use 0..0
* telecom.rank 0..0
* telecom.period 0..0
* telecom.extension 1..*
* telecom.extension ^slicing.rules = #closed
* telecom.extension contains http://hl7.org/fhir/StructureDefinition/contactpoint-purpose named purpose 1..1
* telecom.extension[purpose].value[x] 1..1
* telecom.extension[purpose].value[x] only CodeableConcept
* telecom.extension[purpose].valueCodeableConcept.coding 1..1
* telecom.extension[purpose].valueCodeableConcept.coding.system 1..1
* telecom.extension[purpose].valueCodeableConcept.coding.system = "http://fhir.health.gov.il/cs/il-core-contact-point-purpose" (exactly)
* telecom.extension[purpose].valueCodeableConcept.coding.code 1..1
* telecom.extension[purpose].valueCodeableConcept.coding.code = #OTP (exactly)
* telecom.extension[purpose] ^short = "Marks the telecom purpose as OTP."
* telecom.extension[purpose] ^definition = "contactpoint-purpose extension is mandatory and fixed to OTP so implementers can reliably identify the telecom used for one-time-password delivery."

* contained 0..0
* modifierExtension 0..0

* active 1..1
* period 0..0
* specialty 0..0
* location 0..0
* healthcareService 0..0
* availableTime 0..0
* notAvailable 0..0
* availabilityExceptions 0..0
* endpoint 0..0
