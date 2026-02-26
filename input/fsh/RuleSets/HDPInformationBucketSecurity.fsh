RuleSet: HDPInformationBucketSecurity
* meta.security ^slicing.discriminator.type = #value
* meta.security ^slicing.discriminator.path = "system"
* meta.security ^slicing.rules = #closed
* meta.security ^slicing.description = "ILHDP codes only"
* meta.security 1..*
* meta.security contains HDP 1..1
* meta.security[HDP] ^short = "HDP information bucket"
* meta.security[HDP] ^definition = "Security label identifying the HDP information bucket for this resource."
* meta.security[HDP].system = $info-buckets
* meta.security[HDP] from $vs-il-hdp-information-buckets (required)
* meta.security[HDP].code 1..1
