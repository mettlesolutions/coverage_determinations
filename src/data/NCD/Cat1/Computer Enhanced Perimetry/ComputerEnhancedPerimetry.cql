library ComputerEnhancedPerimetry

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Visual field study (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Glaucoma (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'


define "Covered":
	exists(["Diagnosis": "Glaucoma (disorder)"])
	and exists(["Procedure, Performed": "Visual field study (procedure)"])

define "Coverage": 
	"Covered"
