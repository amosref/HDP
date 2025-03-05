ValueSet: ObservationHDPInformationBuckets
Id: il-hdp-observation-information-buckets
Title: "ILHDP Observation Information Buckets"
Description: "A list of information baskets for meta-security in ILHDPObservation"
* ^url = $vs-observation-meta
* ^status = #draft
* ^experimental = false
* $info-buckets#diagnosticImaging "בדיקות דימות"
* $info-buckets#genetics "גנטיקה"
* $info-buckets#assessments "אומדנים"
* $info-buckets#immunizations "חיסונים"
* $info-buckets#procedures "פרוצדורות"
* $info-buckets#pathology "פתולוגיה"
// * $info-buckets#measurements "מדדים"  // probably will be ObservationVitalSigns

