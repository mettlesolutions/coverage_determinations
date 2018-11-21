library BloodBrainBarrierOsmoticDisruptionforTreatmentofBrainTumors version '1'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Destruction of brain tumor (procedure)":'2.16.840.1.113883.6.96'
	

define "Not Covered":
	//exists(["Procedure, Performed": "Destruction of brain tumor (procedure)"])
	true
	
	
define "Coverage":
	false
