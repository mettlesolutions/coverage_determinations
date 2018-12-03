library InducedLesionsofNerveTracts

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Electrocautery operation (procedure)":'2.16.840.1.113883.6.96'
valueset "Neurolysis (procedure)":'2.16.840.1.113883.6.96'
valueset "Destruction of lesion or structure by radiofrequency (procedure)":'2.16.840.1.113883.6.96'
valueset "Chronic pain (finding)":'2.16.840.1.113883.6.96'

define "Covered":
	exists(["Diagnosis": "Chronic pain (finding)"]) 
	and (exists(["Procedure, Performed": "Destruction of lesion or structure by radiofrequency (procedure)"]) 
		or exists(["Procedure, Performed": "Neurolysis (procedure)"]) 
		or exists(["Procedure, Performed": "Electrocautery operation (procedure)"]))
	
	
define "Coverage":
	"Covered"
