//Thermography
library Thermography
using FHIR

include FHIRHelpers version '1.8' called FHIRHelpers
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
parameter MeasurementPeriod default @1992-11-20T00:00:00.0
context Patient

define "Not Covered":
		(exists (["Condition" :"Illness (finding)"])
		or (exists (["Condition" : "Traumatic injury (disorder)"]))
		and (exists (["Procedure":"Traumatic injury (disorder)"]T
		where T.performed during MeasurementPeriod))
		)
		
define "Coverage":
		not "Not Covered"
