Instance: hospital1-ward-b-room-05-bed-1
InstanceOf: ILHDPLocation
Title: "HDP Location - Hospital1 Ward B Room 05 Bed 1"
Description: "Physical bed location used after transfer to Ward B."
Usage: #example

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Hospital1 Ward B - Room 05 Bed 1</div>"

* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #organization

* identifier[+].system = "http://hospital1.example.org/locations"
* identifier[=].value = "HOSP1-WARD-B-R05-B1"

* status = #active
* name = "Ward B Room 05 Bed 1"
* mode = #instance
* managingOrganization.reference = "Organization/hospital1-ward-b"
