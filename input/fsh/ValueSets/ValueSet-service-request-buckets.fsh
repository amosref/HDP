ValueSet: ServiceRequestHDPInformationBuckets
Id: il-hdp-service-request-information-buckets
Title: "ILHDP ServiceRequest Information Buckets"
Description: "A list of information baskets for meta-security in ILHDPServiceRequest"
* insert ConformanceMetadata
* ^url = $vs-service-request-meta
* ^status = #draft
* ^experimental = false
* $info-buckets#laboratoryTests "בדיקות מעבדה"
* $info-buckets#diagnosticImaging "בדיקות דימות"
* $info-buckets#genetics "גנטיקה"
* $info-buckets#recommendations "המלצות"
* $info-buckets#referrals "הפניות"
* $info-buckets#procedures "פרוצדורות"
* $info-buckets#pathology "פתולוגיה"
* $info-buckets#medications "תרופות"
