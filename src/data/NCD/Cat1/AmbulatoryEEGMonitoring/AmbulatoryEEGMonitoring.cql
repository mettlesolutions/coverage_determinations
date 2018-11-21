
library AmbulatoryEEGMonitoring version '1'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)


valueset "Family history of seizure disorder (situation)":'2.16.840.1.113883.6.96'
valueset "Electroencephalogram abnormality with seizure (finding)":'2.16.840.1.113883.6.96'
valueset "Seizure disorder (disorder)":'2.16.840.1.113883.6.96'
valueset "Suspected (qualifier value)":'2.16.840.1.113883.6.96'
valueset "Transient ischemic attack (disorder)":'2.16.840.1.113883.6.96'
valueset "Syncope (disorder)":'2.16.840.1.113883.6.96'

define "Condition 1":
	exists(["Diagnosis": "Seizure disorder (disorder)"]) 
	and exists(["FamilyHistory":"Seizure disorder (disorder)"]) 
	and exists(["Assessment, Performed": "Family history of seizure disorder (situation)"]) 
	and exists("Suspected (qualifier value)")
	
define "Condition 2":
	exists(["Diagnosis": "Syncope (disorder)"])
	or exists(["Diagnosis": "Transient ischemic attack (disorder)"])
	

define "Covered":
	"Condition 1" or "Condition 2"
	
define "Coverage":
	"Covered"
