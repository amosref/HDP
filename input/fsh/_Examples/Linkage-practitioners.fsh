Instance: ILHDPLinkageExample
InstanceOf: ILHDPLinkage
Title: "IL HDP Linkage Example"
Description: "Example instance of IL HDP Linkage for testing purposes"

* meta.versionId = "1"
* meta.lastUpdated = "2024-01-15T10:30:00Z"
* meta.security[HDP].system = $info-buckets
* meta.security[HDP].code = #practitioner
* meta.security[HDP].display = "מטפל"

* active = true
* author = Reference(Organization/example-health-authority)

* item[source][0].type = #source
* item[source][0].resource = Reference(Practitioner/anesthesiologist-with-expertise)

* item[source][1].type = #source
* item[source][1].resource = Reference(Practitioner/gp)