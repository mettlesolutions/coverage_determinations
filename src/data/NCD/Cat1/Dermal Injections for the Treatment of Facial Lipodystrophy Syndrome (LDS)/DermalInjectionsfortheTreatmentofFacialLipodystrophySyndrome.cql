library DermalInjectionsfortheTreatmentofFacialLipodystrophySyndrome

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Filler (substance)":'2.16.840.1.113883.6.96'
valueset "Skin part (body structure)":'2.16.840.1.113883.6.96'
valueset "Human immunodeficiency virus infection (disorder)":'2.16.840.1.113883.6.96'
valueset "Lipodystrophy caused by antiretroviral drug (disorder)":'2.16.840.1.113883.6.96'
valueset "Lipodystrophy of face (disorder)":'2.16.840.1.113883.6.96'
valueset "Depression diagnosis":'2.16.840.1.113883.3.600.145'

define "Covered":
	exists(["Substance, Administered": "Filler (substance)"]) 
	and exists(["Diagnosis": "Human immunodeficiency virus infection (disorder)"]) 
	and exists(["Diagnosis": "Lipodystrophy caused by antiretroviral drug (disorder)"])
	and exists(["Diagnosis": "Lipodystrophy of face (disorder)"])
	and exists(["Diagnosis": "Depression diagnosis"])
	
define "Coverage":
	"Covered"
