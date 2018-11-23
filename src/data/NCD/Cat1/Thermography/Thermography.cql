//Thermography
library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)


valueset "Thermography (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Medicare coverage (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Illness (finding)" :'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Traumatic injury (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'

context Patient

define "Not Covered":
		(exists (["Diagnosis" :"Illness (finding)"])
		or (exists (["Diagnosis" : "Traumatic injury (disorder)"]))
		and (exists (["Procedure, Performed":"Traumatic injury (disorder)"]))
		)
		
define "Coverage":
		not "Not Covered"
