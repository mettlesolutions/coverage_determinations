library DiagnosisandTreatmentofImpotence

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Victim of abuse (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Suspected victim of adult abuse (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Copy of document requested (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Mental disorder (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Inpatient stay (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Impotence (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Procedure aiding diagnosis (procedure)":'2.16.840.1.113883.3.88.12.80.28'

define "Abuse Conditions":
	if (exists(["Assessment, Performed": "Suspected victim of adult abuse (situation)"]))
	then exists(["Assessment, Performed": "Copy of document requested (situation)"]) 
	else false

define "Outpatient Conditions":
	if (exists(["Diagnosis": "Mental disorder (disorder)"]) 
		and not exists(["Assessment, Performed": "Inpatient stay (finding)"]))
	then true
	else false

define "Covered": 
	"Abuse Conditions"
	or (if exists(["Diagnosis": "Impotence (disorder)"]) then true else false)
	or "Outpatient Conditions"
	
define "Coverage":
	"Covered"
