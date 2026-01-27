Instance: communication-hdp-pathology
InstanceOf: ILHDPCommunicationPathology
Title: "Example ILHDP Communication Pathology"
Description: "Demonstrates ILHDP Communication Pathology profile with meta, identifier, subject, recipient, and received elements"

* text.status = #generated
* text.div = """
<div xmlns="http://www.w3.org/1999/xhtml">
  <p>Pathology communication sent to recipient regarding patient.</p>
</div>
"""

* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #pathology
* meta.security[HDP].display = "פתולוגיה"

* identifier[0].system = "http://hospital.somethinghealth.org/communications"
* identifier[0].value = "PATH-COMM-2025-0001"

* status = #completed
* subject = Reference(Patient/example)

* recipient[0] = Reference(Organization/example)
* recipient[1] = Reference(Practitioner/example)

* received = "2025-09-10T14:45:00+02:00"
