//Laser Procedures
library LaserProcedures

using FHIR

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'
valueset "Laser procedure (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Medical practitioner (occupation)" : '2.16.840.1.113762.1.4.1099.14'


context Patient

define "Covered":
		(exists (["Observation" : "Laser procedure (procedure)"])
		and (exists (["Encounter" : "Medical practitioner (occupation)"]))
		)
		
define "Coverage":
		"Covered"
