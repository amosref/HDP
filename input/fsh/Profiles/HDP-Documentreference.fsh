Profile: ILHDPDocumentReference
Parent: ILCoreDocumentReference
Id: il-hdp-document-reference
Title: "HDP DocumentReference"
Description: "DocumentReference profile for HDP"
* meta only ILHDPMeta
* meta.security[HDP].system = $info-buckets (exactly)
* meta.security[HDP].code = #Pracitioner (exactly)
* meta.security[HDP].display = "יחידה ארגונית" (exactly)
* subject 1..1
* subject only Reference(ILCorePatient or ILCoreDevice or ILCorePractitioner)
* author 1..*
* authenticator only Reference(ILCorePractitioner or ILCorePractitionerRole or ILCoreOrganization)
* type from http://hl7.org/fhir/ValueSet/c80-doc-typecodes (preferred)
* date 1..1
