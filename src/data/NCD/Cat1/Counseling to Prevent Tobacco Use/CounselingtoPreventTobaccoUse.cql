library CounselingtoPreventTobaccoUse


using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Tobacco user (finding)":'2.16.840.1.113883.6.96'
valueset "Tobacco use disorder":'2.16.840.1.113883.6.103'
valueset "Associated symptom (finding)":'2.16.840.1.113883.6.96'
valueset "Mentally alert (finding)":'2.16.840.1.113883.6.96'
valueset "Counseling about tobacco use (procedure)":'2.16.840.1.113883.6.96'
valueset "Procedure started (situation)":'2.16.840.1.113883.6.96'
valueset "Smoking cessation therapy (regime/therapy)":'2.16.840.1.113883.6.96'
valueset "Smoking and tobacco use cessation counseling visit; intermediate, greater than 3 minutes up to 10 minutes":'2.16.840.1.113883.6.12'
valueset "Smoking and tobacco use cessation counseling visit; intensive, greater than 10 minutes":'2.16.840.1.113883.6.12'
valueset "Inpatient stay (finding)":'2.16.840.1.113883.6.96'


define "Not Covered":
	if (exists(["Assessment, Performed": "Inpatient stay (finding)"]) and exists(["Diagnosis": "Tobacco use disorder"]))
	then true
	else false

define "Condition1":
	exists(["Assessment, Performed": "Tobacco user (finding)"])
	and (exists(["Diagnosis": "Tobacco use disorder"])
		and exists(["Assessment, Performed": "Associated symptom (finding)"]))	
		
define "Condition2":
	exists(["Assessment, Performed": "Mentally alert (finding)"])
	and exists(["Procedure, Performed": "Counseling about tobacco use (procedure)"])
		
define "Covered":
	if ("Condition1" and "Condition2") 
	then (exists(["Encounter, Performed": "Smoking and tobacco use cessation counseling visit; intermediate, greater than 3 minutes up to 10 minutes"])
		or exists(["Encounter, Performed": "Smoking and tobacco use cessation counseling visit; intensive, greater than 10 minutes"]))
	else false
	
define "Coverage":
	"Covered" and not "Not Covered"
