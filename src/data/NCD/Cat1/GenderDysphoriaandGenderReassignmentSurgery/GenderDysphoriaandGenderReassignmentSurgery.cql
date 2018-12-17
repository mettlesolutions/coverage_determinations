//Gender Dysphoria and Gender Reassignment Surgery
library GenderDysphoriaandGenderReassignmentSurgery

using FHIR

include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'
valueset "Gender reassignment surgery (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Gender dysphoria (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'

parameter MeasurementPeriod default @2016-08-30T00:00:00.0

context Patient

define "Not Covered":
		(exists (["Condition" :"Gender dysphoria (disorder)"])
		and (exists (["Procedure" : "Gender reassignment surgery (procedure)"]G
		where  (G.performed) during MeasurementPeriod))
		)
		
define "Coverage":
		"Not Covered" 
