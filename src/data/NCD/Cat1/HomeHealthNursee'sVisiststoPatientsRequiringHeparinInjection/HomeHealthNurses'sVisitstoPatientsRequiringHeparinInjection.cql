//Home Health Nurses' Visits to Patients Requiring Heparin Injection
library HomeHealthNursesVisitstoPatientsRequiringHeparinInjection


using FHIR
include FHIRHelpers version '1.8' called FHIRHelpers

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
		(exists (["Condition" : "Housebound (finding)"])
		and (exists (["Condition" : "Pregnant (finding)"]))
		and (exists (["Procedure" : "Anticoagulant therapy (procedure)"]))
		)
define "Condition 2":
		(exists (["Condition" : "Housebound (finding)"])
		and (exists (["Condition" : "Deep venous thrombosis (disorder)"]))
		or (exists (["Condition" : "Pulmonary embolism (disorder)"]))
		)
define "Covered":
		"Condition 1" or "Condition 2" and
		 (exists ["Procedure" :"Subcutaneous injection (procedure)" included in ["Procedure" : "Low dose heparin prophylaxis (procedure)"]]
		and (exists (["Encounter" :"Professional nurse (occupation)"]))
		and (exists (["Encounter" :"Professional nurse (occupation)"]))
		)
		
define "Limitation 1" :
		(not exists (["Condition" : "Pregnant (finding)"])
		and  (exists ["Procedure" : "Subcutaneous injection (procedure)" included in
		 ["Procedure" : "Low dose heparin prophylaxis (procedure)"]L
		where duration in days of( L.performed) = 7 and duration in months of (L.performed) = 6 ])
		)
		
define "Limitation 2" :
		(exists (["Condition" : "Pregnant (finding)"])
		and  (exists (["Procedure" : "Subcutaneous injection (procedure)" included in 
		["Procedure" : "Low dose heparin prophylaxis (procedure)"]L
		where (duration in days of (L.performed) = 7 and duration in months of (L.performed) = 6 ) or
		 (duration in days of (L.performed) = 7 and duration in months of (L.performed) > 6 )])
		 ))
		 
define "Coverage":
		"Covered" and "Limitation 1" or "Limitation 2"
		
		
