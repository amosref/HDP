ValueSet: ILHDPConditionCode
Id: il-hdp-condition-code
Title: "ILHDP Condition Code"
Description: "Description: A  list of SNOMED codes for condition to be used for Health Data Portability"
* insert ConformanceMetadata
* ^url = $vs-il-hdp-condition-code
* ^status = #draft
* ^experimental = false

* include codes from system $sct where concept descendent-of #404684003 "Clinical finding (finding)"
* include codes from system $sct where concept descendent-of #243796009 "Situation with explicit context (situation)"
* include codes from system $sct where concept descendent-of #272379006 "Event (event)"
