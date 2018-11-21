library DisplacementCardiography

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Electrocardiographic procedure (procedure)":'	2.16.840.1.113883.6.96'
valueset "Stress (finding)":'2.16.840.1.113883.6.96'
valueset "Disorder of coronary artery (disorder)":'2.16.840.1.113883.6.96'
valueset "Atypical angina (disorder)":'2.16.840.1.113883.6.96'
valueset "Typical angina (disorder)":'2.16.840.1.113883.6.96'
valueset "Male":'2.16.840.1.113883.5.1'
valueset "Female":'2.16.840.1.113883.5.1'


define "Conditions-Male":
	if exists(["Patient Characteristic Sex":"Male"]) then exists(["Diagnosis": "Atypical angina (disorder)"])
	else false
	
define "Conditions-Female":
	if exists(["Patient Characteristic Sex":"Female"]) then (exists(["Diagnosis": "Typical angina (disorder)"]) or exists(["Diagnosis": "Atypical angina (disorder)"]))
	else false

define "Covered":
	(exists(["Procedure, Performed": "Electrocardiographic procedure (procedure)"]) 
	and exists(["Assessment, Performed": "Stress (finding)"])
	and exists(["Diagnosis": "Disorder of coronary artery (disorder)"]))
	and ("Conditions-Male" or "Conditions-Female")
	
define "Coverage": 
	"Covered"
