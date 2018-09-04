library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Hemodialysis (procedure)": '2.16.840.1.113883.3.526.2.1151'
valueset "Ultrafiltration (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "End Stage Renal Disease": '2.16.840.1.113883.3.526.3.353'


context Patient

define "Coverage": 
	 ["Diagnosis": "End Stage Renal Disease"] union ["Procedure, Performed": "Hemodialysis (procedure)"] union ["Procedure, Performed": "Ultrafiltration (procedure)"]
	 	and not ["Diagnosis": "End Stage Renal Disease"] union ["Procedure, Performed": "Ultrafiltration (procedure)"]
