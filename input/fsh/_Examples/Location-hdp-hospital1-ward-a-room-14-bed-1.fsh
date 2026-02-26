Instance: hospital1-ward-a-room-14-bed-1
InstanceOf: ILHDPLocation
Title: "HDP Location - Hospital1 Ward A Room 14 Bed 1"
Description: "Physical bed location used during the second part of the ward A stay."
Usage: #example

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Hospital1 Ward A - Room 14 Bed 1</div>"

* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #organization

* identifier[+].system = "http://hospital1.example.org/locations"
* identifier[=].value = "HOSP1-WARD-A-R14-B1"

* status = #active
* name = "Ward A Room 14 Bed 1"
* mode = #instance
* managingOrganization.reference = "Organization/hospital1-ward-a"
