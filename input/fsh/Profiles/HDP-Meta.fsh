Profile: ILHDPMeta
Parent: Meta
Id: il-hdp-meta
Title: "ILHDP Meta Profile"
Description: "Profile on Meta datatype for HDP with slicing on security"
* security 1..*
* security.system 1..1
* security.code 1..1
* security ^slicing.discriminator.type = #value
* security ^slicing.discriminator.path = "$this"
* security ^slicing.rules = #open
* security ^slicing.description = "Distinguishes HDP information buckets, confidentiality classifications, and sensitivity labels."
* security contains
    HDP 1..1 and
    confidentiality 0..1 and
    sensitivity 0..*
* security[HDP] ^short = "HDP information bucket"
* security[HDP] ^definition = "Security label identifying the HDP information bucket for this resource."
* security[HDP].system 1..1
* security[HDP].system = $info-buckets (exactly)
* security[HDP].code 1..1
* security[HDP] from $vs-info-buckets (required)
* security[confidentiality] ^short = "Confidentiality classification"
* security[confidentiality] ^definition = "Security label identifying the confidentiality classification for this resource."
* security[confidentiality].system 1..1
* security[confidentiality].code 1..1
* security[confidentiality] from $vs-v3-confidentiality-classification (required)
* security[sensitivity] ^short = "Sensitivity label"
* security[sensitivity] ^definition = "Security label identifying an IL Core sensitivity label for this resource."
* security[sensitivity].system 1..1
* security[sensitivity].code 1..1
* security[sensitivity] from $vs-il-core-sensitivity-labels (required)
* insert ConformanceMetadata
