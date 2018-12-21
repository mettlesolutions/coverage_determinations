//Ultrafiltration Monitor
library UltrafiltrationMonitor

using FHIR


include FHIRHelpers version '1.8' called FHIRHelpers
//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

//valueset "Hemodialysis (procedure)": '2.16.840.1.113883.3.526.2.1151'
valueset "Ultrafiltration (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "End Stage Renal Disease": '2.16.840.1.113883.3.526.3.353'
valueset "Dialysis procedure (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Intermittent hemodialysis with sequential ultrafiltration (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Renal dialysis (procedure)" : '2.16.840.1.113883.3.88.12.80.28'

parameter MeasurementPeriod default @1983-07-11T00:00:00.0

context Patient


define "Covered":
		(exists (["Condition":"End Stage Renal Disease"]) and 
		(exists (["Procedure" : "Ultrafiltration (procedure)"]U
		where U.performed during MeasurementPeriod) and 
		(exists (["Procedure" : "Intermittent hemodialysis with sequential ultrafiltration (procedure)"]H
		where H.performed during MeasurementPeriod)))
		)
	
define "Not Covered":
		(exists (["Procedure" : "Ultrafiltration (procedure)"]H
		where H.performed during MeasurementPeriod) and  (exists (["Procedure":"Renal dialysis (procedure)"])))
		
		
define "Coverage":
		"Covered" and not "Not Covered"
