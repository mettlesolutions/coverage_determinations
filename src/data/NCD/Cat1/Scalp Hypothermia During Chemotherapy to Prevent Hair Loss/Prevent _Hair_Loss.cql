library ChlamydiaScreening_Common version '2'

using QDM version '5.3'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Scalp cooling (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Chemotherapy (procedure)": '2.16.840.1.113762.1.4.1047.451'
//Ice filled bag
valueset "Application of ice collar, cap or bag (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//Bandage
valueset "Application of bandage (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Hypothermia (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'

context Patient

define "Indications": 
	["Procedure, Performed": "Chemotherapy (procedure)"] union ["Procedure, Performed": "Scalp cooling (procedure)"]
	
define "Limitation":
	["Procedure, Performed": "Application of ice collar, cap or bag (procedure)"]
	
define "Coverage":
	"Indications" and not "Limitation"
