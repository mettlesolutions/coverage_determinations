//Services Provided for the Diagnosis and Treatment of Diabetic Sensory Neuropathy with Loss of Protective Sensation (aka Diabetic Peripheral Neuropathy)
library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'
valueset "Neuropathy co-occurrent and due to diabetes mellitus (disorder)"  :'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Loss of protective sensation of skin of foot (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Physician service (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Diabetic foot examination (regime/therapy)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Documentation procedure (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Podiatrist (occupation)" : '2.16.840.1.113762.1.4.1099.14'
valueset "Assessment using Semmes-Weinstein monofilament test (procedure)" :'2.16.840.1.113883.3.88.12.80.28'
valueset "Monofilament foot sensation test (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Sensory testing (procedure)	" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Rhythmical exercises (regime/therapy)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Foot structure (body structure)" : '2.16.840.1.113883.3.88.12.3221.8.9'
valueset "Foot X-ray orthopedic/biomechanical examination (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Assessment of skin integrity (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Provision of special footwear (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Patient education (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "History taking (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Corn and callus procedures (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Debridement of nail (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Trimming (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Peripheral neuritis (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Seen by primary care physician (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Referral to footcare protection program (procedure)" : '2.16.840.1.113883.11.20.9.56'
valueset "Entire plantar surface of toe (body structure)" : '2.16.840.1.113883.3.88.12.3221.8.9'
valueset "Absence of sensation (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Evaluation procedure (procedure)": '2.16.840.1.113883.3.88.12.80.28'

parameter MeasurementPeriod default @2002-07-01T00:00:00.0
context Patient

define "Indication":
		(exists (["Diagnosis": "Neuropathy co-occurrent and due to diabetes mellitus (disorder)"])
		and (exists (["Diagnosis" : "Loss of protective sensation of skin of foot (finding)"]))
		and (exists (["Procedure, Performed":  "Diabetic foot examination (regime/therapy)"]))
		)
define "Documentation":
		(exists (["Diagnosis": "Neuropathy co-occurrent and due to diabetes mellitus (disorder)"])
		and (exists (["Diagnosis" : "Loss of protective sensation of skin of foot (finding)"]))
		and (exists (["Procedure, Performed": "Documentation procedure (procedure)" ]))
		)
		
define "Cover Condition":
		(exists (["Procedure, Performed" : "Physician service (procedure)"])
		and (exists (["Procedure, Performed":  "Diabetic foot examination (regime/therapy)"]D
		where duration in months of D.relevantPeriod < 6))
		and "Documentation" and not(exists (["Provider Characteristic" :"Podiatrist (occupation)"]))
		)
define "Condition 1":
		(exists (["Diagnosis" : "Entire plantar surface of toe (body structure)"])
		and (exists (["Procedure, Performed" :  "Rhythmical exercises (regime/therapy)"]))
		)
		
define "Cover Condition 2":
		 (exists (["Diagnosis" : "Loss of protective sensation of skin of foot (finding)"])
		 and (exists (["Procedure, Performed" :  "Monofilament foot sensation test (procedure)"]))
		 and "Condition 1"
		 )

define "Condition":
		(exists (["Diagnosis" : "Entire plantar surface of toe (body structure)"])
		and (exists (["Diagnosis" : "Absence of sensation (finding)"]))
		and (exists (["Procedure, Performed" : "Assessment using Semmes-Weinstein monofilament test (procedure)"]))
		and (exists (["Procedure, Performed": "Documentation procedure (procedure)" ]))
		and (exists (["Diagnosis": "Peripheral neuritis (disorder)"]))
		and  (exists (["Diagnosis" : "Loss of protective sensation of skin of foot (finding)"]))
		)
define "Physical Examination":
		(exists (["Diagnosis":"Foot structure (body structure)"])
		and (exists (["Procedure, Performed":"Evaluation procedure (procedure)"]))
		and (exists (["Procedure, Performed" : "Foot X-ray orthopedic/biomechanical examination (procedure)"]))
		or (exists (["Procedure, Performed":"Assessment of skin integrity (procedure)"]))
		or (exists (["Procedure, Performed":"Provision of special footwear (procedure)"]))
		)
		
define "Examination":
	(exists (["Procedure, Performed":"History taking (procedure)"])
	or "Physical Examination"
	or (exists (["Patient Care Experience" :  "Patient education (procedure)"]))
	)
	
define "Limit":
		(exists (["Procedure, Performed" : "Corn and callus procedures (procedure)"])
		or (exists (["Procedure, Performed": "Debridement of nail (procedure)"]))
		or (exists (["Procedure, Performed" : "Trimming (procedure)"]))
		)
	
define "Others":
		(exists (["Diagnosis": "Peripheral neuritis (disorder)"])
		and (exists (["Encounter, Performed":"Seen by primary care physician (finding)"]))
		 and (exists (["Diagnosis" : "Loss of protective sensation of skin of foot (finding)"]))
		and (exists (["Encounter, Performed":"Referral to footcare protection program (procedure)"]))
		)
		
define "Covered":
		"Indication" and "Cover Condition" and "Cover Condition 2" and "Condition" and "Examination" and "Limit" and "Others"
		
define "Coverage":
		if("Documentation")
		then
		    "Covered"
		else 
			null
