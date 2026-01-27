Profile: ILHDPDocumentReference
Parent: ILCoreDocumentReference
Id: il-hdp-document-reference
Title: "ILHDP DocumentReference"
Description: "DocumentReference profile for HDP"
* insert ConformanceMetadata
* . obeys one-strong-identifier
* meta only ILHDPMeta
* meta 1..1
* meta.security[HDP] 1..1
* meta.security[HDP].system 1..1
* meta.security[HDP].code 1..1
* meta.security[HDP].system = $info-buckets (exactly)
* meta.security[HDP] from $vs-document-reference-meta (required)
* identifier 1..*
* subject 1..1
* subject only Reference(ILHDPPatient or ILCoreDevice or ILHDPPractitioner or ILCorePractitioner)
* author 1..*
* author only Reference(ILCoreDevice or ILCorePractitioner or ILCorePractitionerRole or ILCoreRelatedPerson or ILCoreOrganization or 
                        ILHDPPractitioner or ILHDPPractitionerRole or ILHDPPatient or ILHDPOrganization)
* authenticator only Reference(ILCorePractitioner or ILCorePractitionerRole or ILCoreOrganization or 
                        ILHDPPractitioner or ILHDPPractitionerRole or ILHDPOrganization)
* type 1..1
* type from $vs-hdp-document-types (extensible)
* date 1..1
* relatesTo.target only Reference(ILCoreDocumentReference or ILHDPDocumentReference)
* context.sourcePatientInfo only Reference(ILHDPPatient)
* content.attachment.contentType 1..1
* content.attachment.creation 1..1