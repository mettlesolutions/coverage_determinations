//Sykes Hernia Control
library  ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'

valueset "Repair of inguinal hernia (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Application of truss (procedure)" :'2.16.840.1.113883.3.88.12.80.28'
valueset "Hernia repair (procedure)"  :'2.16.840.1.113883.3.88.12.80.28'

context Patient

define "Covered":
		(exists (["Procedure, Performed" : "Hernia repair (procedure)"])
		and (exists (["Procedure, Performed":"Application of truss (procedure)"]))
		)
		
define "Coverage":
		"Covered"
