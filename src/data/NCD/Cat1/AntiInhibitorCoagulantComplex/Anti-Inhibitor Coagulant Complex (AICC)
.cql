library AntiInhibitorCoagulantComplex version '1'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Factor VIII inhibitor disorder (disorder)":'2.16.840.1.113883.6.96'
valueset "Hemophilia (disorder)":'2.16.840.1.113883.6.96'
valueset "General Major Bleeding Events":'2.16.840.1.113762.1.4.1179.5'
valueset "Poor response to treatment (situation)":'2.16.840.1.113883.6.96'

define "Covered":
	exists(["Diagnosis": "Hemophilia (disorder)"])
	and exists(["Diagnosis": "Factor VIII inhibitor disorder (disorder)"])
	and exists(["Diagnosis": "General Major Bleeding Events"])
	and exists(["Diagnosis": "Poor response to treatment (situation)"])
	
define "Coverage":
	"Covered"
