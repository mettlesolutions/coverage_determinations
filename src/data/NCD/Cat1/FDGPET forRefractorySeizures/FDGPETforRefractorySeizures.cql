//FDG PET for Refractory Seizures
library FDGPETforRefractorySeizures

using FHIR
include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
codesystem "ICD10CM":'2.16.840.1.113883.6.90'
valueset "Epilepsy, unspecified, intractable, without status epilepticus" : '2.16.840.1.113762.1.4.1034.51'
valueset "Refractory epilepsy (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Positron emission tomography with computed tomography using fluorodeoxyglucose (18-F) (procedure)" :'2.16.840.1.113883.3.88.12.80.28'
valueset "Documenting observations (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Referred by primary care physician (finding)":'2.16.840.1.113762.1.4.1096.216'
valueset "Physician (occupation)" : '2.16.840.1.113762.1.4.1096.129'

parameter MeasurementPeriod default @2001-07-01T00:00:00.0

context Patient

define "Covered":
		(exists (["Condition":"Refractory epilepsy (disorder)"])
		and (exists (["Procedure":"Epilepsy, unspecified, intractable, without status epilepticus"]))
		and (exists (["Procedure":"Positron emission tomography with computed tomography using fluorodeoxyglucose (18-F) (procedure)"]T
		where (T.performed) during MeasurementPeriod))
		)
define "Coverage":
		"Covered" and
		(exists (["Procedure" : "Documenting observations (procedure)"])
		 and (exists (["Observation" : "Physician (occupation)"]))
		 )
