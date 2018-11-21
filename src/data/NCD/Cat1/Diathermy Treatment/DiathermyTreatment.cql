library DiathermyTreatment

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Diathermy (procedure)":'2.16.840.1.113883.6.96'
valueset "Procedure indicated (situation)":'2.16.840.1.113883.6.96'
valueset "Physician service (procedure)":'2.16.840.1.113883.6.96'


define "Covered": 
	exists(["Procedure, Performed": "Diathermy (procedure)"]) 
	and exists(["Assessment, Performed": "Procedure indicated (situation)"])
	and exists(["Procedure, Performed": "Physician service (procedure)"])
	
define "Coverage":
	"Covered"
