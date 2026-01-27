Instance: document-reference-pathology-report
InstanceOf: ILHDPDocumentReference
Title: "Example ILHDP DocumentReference Pathology Report"
Description: "Demonstrates ILHDP DocumentReference profile with required meta, identifiers, subject, author, type, date, content, and constraints"

* text.status = #generated
* text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p>Pathology report document reference for patient.</p>
</div>
"""

* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #pathology
* meta.security[HDP].display = "פתולוגיה"

* identifier[0].system = "http://hospital.hospitliala.org/documents"
* identifier[0].value = "DOCREF-2025-0001"

* status = #current
* subject = Reference(Patient/example)

* author[0] = Reference(Practitioner/example)
* author[1] = Reference(Organization/example)

* authenticator = Reference(Practitioner/example)

* type.coding[0].system = $vs-hdp-document-types
* type.coding[0].code = #pathology-report
* type.coding[0].display = "Pathology Report"

* date = "2025-09-10T15:30:00+02:00"

* relatesTo[0].code = #replaces
* relatesTo[0].target = Reference(DocumentReference/example)

* context.sourcePatientInfo = Reference(Patient/example)

* content[0].attachment.contentType = #application/pdf
* content[0].attachment.url = "http://hospital.hospitaliala.org/fhir/Binary/12345"
* content[0].attachment.creation = "2025-09-10T15:00:00+02:00"
