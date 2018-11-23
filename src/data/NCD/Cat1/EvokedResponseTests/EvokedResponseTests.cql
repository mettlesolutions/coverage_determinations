//Evoked Response Tests
library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'
valueset "Evoked potential study (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Visual evoked potential study (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Intraoperative brainstem auditory evoked potential test (procedure)" :'2.16.840.1.113883.3.88.12.80.28'


context Patient

define "Covered":
		(exists (["Procedure, Performed" :"Evoked potential study (procedure)"])
		and (exists (["Procedure, Performed" :"Visual evoked potential study (procedure)"]))
		and (exists (["Procedure, Performed" :"Intraoperative brainstem auditory evoked potential test (procedure)"]))
		)
define "Coverage":
		"Covered"
		
