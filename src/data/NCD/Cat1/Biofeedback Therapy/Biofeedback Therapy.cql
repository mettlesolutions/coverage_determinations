library BiofeedbackTherapy version '1'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Muscular re-education (procedure)":'2.16.840.1.113883.6.96'
valueset "Abnormal muscle function (finding)":'2.16.840.1.113883.6.96'
valueset "Spasticity (finding)":'2.16.840.1.113883.6.96'
valueset "Muscle spasm":'2.16.840.1.113883.6.90'
valueset "Weakness present (finding)":'2.16.840.1.113883.6.96'
valueset "Muscle tension (finding)":'2.16.840.1.113883.6.96'
valueset "Psychosomatic rheumatism (disorder)":'2.16.840.1.113883.6.96'


define "Not Covered":
	exists(["Assessment, Performed": "Muscle tension (finding)"])
	or exists(["Diagnosis": "Psychosomatic rheumatism (disorder)"])
	
		
define "Covered":
	exists(["Procedure, Performed": "Muscular re-education (procedure)"])
	or (exists(["Assessment, Performed": "Abnormal muscle function (finding)"]) 
		and (exists(["Diagnosis": "Spasticity (finding)"])
			or exists(["Diagnosis": "Muscle spasm"])
			or exists(["Diagnosis": "Weakness present (finding)"])))
	
	
define "Coverage":
	"Covered" and not "Not Covered"
