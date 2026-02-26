RuleSet: ILHDPEncounterCommon
* insert HDPInformationBucketSecurity
* meta.security[HDP].code = $info-buckets#encounterInformation

* obeys ilhdp-enc-reason
* obeys ilhdp-enc-face-to-face-exclusive

* identifier 1..*

* type 1..*
* type contains
    hospitalization 0..* and
    inpatient-care-segment 0..* and
    community-hmo-ambulatory 0..*
* type[hospitalization] ^short = "Hospitalization encounter type"
* type[hospitalization] ^definition = "Marks a top-level hospitalization encounter."
* type[hospitalization] ^patternCodeableConcept.coding.system = $il-core-encounter-type
* type[hospitalization] ^patternCodeableConcept.coding.code = #hospitalization-hdp
* type[inpatient-care-segment] ^short = "Inpatient care segment encounter type"
* type[inpatient-care-segment] ^definition = "Marks a segment or event within a hospitalization."
* type[inpatient-care-segment] ^patternCodeableConcept.coding.system = $il-core-encounter-type
* type[inpatient-care-segment] ^patternCodeableConcept.coding.code = #inpatient-care-segment-hdp
* type[community-hmo-ambulatory] ^short = "Community/HMO ambulatory encounter type"
* type[community-hmo-ambulatory] ^definition = "Marks a community/HMO ambulatory encounter."
* type[community-hmo-ambulatory] ^patternCodeableConcept.coding.system = $il-core-encounter-type
* type[community-hmo-ambulatory] ^patternCodeableConcept.coding.code = #community-hmo-ambulatory-hdp
//todo: add comments for proper use of face-to-face encounter slice (SHOULD be added for all non-virtual encounters unless there is a specific reason not to)

* period 1..1
* serviceType 1..1
* subject 1..1
* subject only Reference($ILHDPPatient)
* episodeOfCare only Reference(ILCoreEpisodeOfCare or ILHDPEpisodeOfCare)
* basedOn only Reference(ILCoreServiceRequest or $ILHDPServiceRequest)
* participant.individual 1..1
* participant.individual only Reference(ILCorePractitioner or ILCorePractitionerRole or ILCoreRelatedPerson or $ILHDPPractitioner or $ILHDPPractitionerRole or $ILHDPRelatedPerson)
* reasonReference only Reference(ILCoreCondition or ILCoreProcedure or ILCoreObservation or ILCoreImmunizationRecommendation or $ILHDPCondition or $ILHDPObservation)
* diagnosis.condition only Reference(ILCoreCondition or $ILHDPCondition)
* hospitalization.origin only Reference(ILCoreLocation or ILCoreOrganization or $ILHDPLocation or $ILHDPOrganization)
* hospitalization.destination only Reference(ILCoreLocation or ILCoreOrganization or $ILHDPLocation or $ILHDPOrganization)
* location.location only Reference(ILCoreLocation or $ILHDPLocation)
* serviceProvider only Reference(ILCoreOrganization or $ILHDPOrganization)
* partOf only Reference(ILCoreEncounter or ILHDPEncounterHospitalization or ILHDPEncounterInpatientCareSegment)

* reasonReference ^slicing.discriminator.type = #profile
* reasonReference ^slicing.discriminator.path = "$this.resolve()"
* reasonReference ^slicing.rules = #open
* reasonReference contains patient-reported-chief-complaint 0..1
* reasonReference[patient-reported-chief-complaint] ^short = "Patient-reported chief complaint"
* reasonReference[patient-reported-chief-complaint] ^definition = "Reference to the patient-reported chief complaint observation."
* reasonReference[patient-reported-chief-complaint] only Reference(ILHDPPatientReportedChiefComplaint)

* diagnosis ^slicing.discriminator.type = #pattern
* diagnosis ^slicing.discriminator.path = "use"
* diagnosis ^slicing.rules = #open
* diagnosis contains
    admission 0..* and
    comorbidity 0..* and
    discharge 0..*
* diagnosis[admission] ^short = "Admission diagnosis"
* diagnosis[admission] ^definition = "Diagnosis recorded on admission."
* diagnosis[admission].use = $diagnosis-role#AD
* diagnosis[comorbidity] ^short = "Comorbidity diagnosis"
* diagnosis[comorbidity] ^definition = "Diagnosis recorded as a comorbidity."
* diagnosis[comorbidity].use = $diagnosis-role#CM
* diagnosis[discharge] ^short = "Discharge diagnosis"
* diagnosis[discharge] ^definition = "Diagnosis recorded at discharge."
* diagnosis[discharge].use = $diagnosis-role#DD

* diagnosis.use from $vs-il-core-diagnosis-role (extensible)
* diagnosis.use ^comment = "SHOULD be used to indicate diagnosis role (i.e. - chief complaint, comorbidity, etc.)"
* diagnosis.rank ^comment = "SHOULD be used to indicate relative rank of diagnosis within each role (use)"

* location ^slicing.discriminator.type = #profile
* location ^slicing.discriminator.path = "location"
* location ^slicing.rules = #open
* location contains nursing-unit 0..*
* location[nursing-unit] ^short = "Nursing unit location"
* location[nursing-unit] ^definition = "Nursing unit/ward location for the encounter."
* location[nursing-unit].location only Reference(ILCoreLocationNursingUnit or ILHDPLocationNursingUnit)

* identifier ^alias[0] = "מזהה ביקור"
* status ^alias[0] = "סטאטוס"
* class ^alias[0] = "קטגוריה"
* type ^alias[0] = "סוג ביקור"
* serviceType ^alias[0] = "תחום השירות"
* subject ^alias[0] = "מזהה מטופל/ת"
* basedOn ^alias[0] = "הפניה לביקור"
* basedOn ^comment = "מומלץ לייצג גם את מזהה ההפניה לביקור"
* participant ^alias[0] = "גורם מטפל/ צוות"
* period ^alias[0] = "תאריך, שעה"
* length ^alias[0] = "אורך הביקור"
* length ^comment = "אופציונלי, If Encounter.period.end is not known but the length of the encounter is known, then this SHOULD be populated."
* serviceProvider ^alias[0] = "יחידה ארגונית (הרמה הנמוכה בעץ הארגוני המייצגת את היחידה), ספק שירות"
