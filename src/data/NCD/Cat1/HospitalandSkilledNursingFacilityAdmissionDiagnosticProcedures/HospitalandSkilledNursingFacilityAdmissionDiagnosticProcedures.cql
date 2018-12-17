//Hospital and Skilled Nursing Facility Admission Diagnostic Procedures
library HospitalandSkilledNursingFacilityAdmissionDiagnosticProcedures

using FHIR
include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'
codesystem "LOINC" : '2.16.840.1.113883.6.1'
valueset "Hospital admission (procedure)" :'2.16.840.1.113883.3.88.12.80.28'
valueset "Skilled nursing facility (environment)" : '2.16.840.1.113762.1.4.1096.130'
valueset "Diagnostic procedure (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Admitting physician (occupation)" : '2.16.840.1.113762.1.4.1099.14'
valueset "Patient status determination (procedure)" : '2.16.840.1.113762.1.4.1047.306'
valueset "Chest x-ray" : '2.16.840.1.113762.1.4.1111.41'
valueset "Urinalysis (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Medical consultation with outpatient (procedure)" : '2.16.840.1.113883.3.88.12.80.28'

context Patient

define "Cover":
		(exists (["ProcedureRequest" : "Chest x-ray"])
		and (exists (["Procedure": "Patient status determination (procedure)"]))
		)

define "Covered":
		(exists (["ProcedureRequest" : "Chest x-ray"])
		and (exists (["Observation" : "Urinalysis (procedure)"]))
		and (exists (["Procedure" : "Diagnostic procedure (procedure)"]))
		and (exists (["Encounter":"Hospital admission (procedure)"]))
		or (exists (["Encounter":"Skilled nursing facility (environment)"]))
		and "Cover"
		)
define "Not Covered":
		(exists (["Procedure" : "Medical consultation with outpatient (procedure)" ])
		and (exists (["Procedure" : "Diagnostic procedure (procedure)"]))
		and not  (exists (["Encounter":"Hospital admission (procedure)"]))
		or not (exists (["Encounter":"Skilled nursing facility (environment)"]))
		)
		
define "Coverage":
		"Covered" and "Not Covered"
