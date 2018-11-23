//Home Health Nurses' Visits to Patients Requiring Heparin Injection
library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'
valueset "Low dose heparin prophylaxis (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Subcutaneous injection (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Housebound (finding)" : '2.16.840.1.113762.1.4.1018.141'
valueset "Pregnant (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Anticoagulant therapy (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Deep venous thrombosis (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Pulmonary embolism (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Summary report (record artifact)" : '2.16.840.1.113762.1.4.1116.529'
valueset "Warfarin" : '2.16.840.1.113762.1.4.1186.7'
valueset "Referral to home health care service (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Physician (occupation)"  : '2.16.840.1.113762.1.4.1096.129'
valueset "Professional nurse (occupation)" : '2.16.840.1.113762.1.4.1096.205'

context Patient

define "Condition 1":
		(exists (["Patient Characteristic" : "Housebound (finding)"])
		and (exists (["Diagnosis" : "Pregnant (finding)"]))
		and (exists (["Procedure, Order" : "Anticoagulant therapy (procedure)"]))
		)
define "Condition 2":
		(exists (["Patient Characteristic" : "Housebound (finding)"])
		and (exists (["Diagnosis" : "Deep venous thrombosis (disorder)"]))
		or (exists (["Diagnosis" : "Pulmonary embolism (disorder)"]))
		)
define "Covered":
		"Condition 1" or "Condition 2" and
		 (exists ["Procedure, Performed" :"Subcutaneous injection (procedure)" included in ["Procedure, Performed" : "Low dose heparin prophylaxis (procedure)"]]
		and (exists (["Provider Characteristic" :"Professional nurse (occupation)"]))
		and (exists (["Provider Characteristic" :"Professional nurse (occupation)"]))
		)
		
define "Limitation 1" :
		(not exists (["Diagnosis" : "Pregnant (finding)"])
		and  (exists ["Procedure, Performed" : "Subcutaneous injection (procedure)" included in
		 ["Procedure, Performed" : "Low dose heparin prophylaxis (procedure)"]L
		where duration in days of L.relevantPeriod = 7 and duration in months of L.relevantPeriod = 6 ])
		)
		
define "Limitation 2" :
		(exists (["Diagnosis" : "Pregnant (finding)"])
		and  (exists (["Procedure, Performed" : "Subcutaneous injection (procedure)" included in 
		["Procedure, Performed" : "Low dose heparin prophylaxis (procedure)"]L
		where (duration in days of L.relevantPeriod = 7 and duration in months of L.relevantPeriod = 6 ) or
		 (duration in days of L.relevantPeriod = 7 and duration in months of L.relevantPeriod > 6 )])
		 ))
		 
define "Coverage":
		"Covered" and "Limitation 1" or "Limitation 2"
		
		
