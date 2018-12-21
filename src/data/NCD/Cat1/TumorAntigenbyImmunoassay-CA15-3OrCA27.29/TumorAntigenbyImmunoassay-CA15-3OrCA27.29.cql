//TumorAntigenbyImmunoassay-CA15-3OrCA27.29
library TumorAntigenbyImmunoassayCA153OrCA2729

using FHIR

include FHIRHelpers version '1.8' called FHIRHelpers
//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
valueset "Screening for cancer (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Cancer antigen 15-3 measurement (procedure)" :'2.16.840.1.113883.3.88.12.80.28'
valueset "Measurement of cancer antigen 27-29 (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Tumor marker monitoring (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Multiple malignancy (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Residual tumor present (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
//signs and symptoms of malignacy
//breast cancer 
valueset "Malignant neoplasm of breast (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
//Post Surgical Therapy
valueset "Tumor marker measurement (procedure)": '2.16.840.1.113883.3.88.12.80.28'

parameter MeasurementPeriod default @2003-01-03T00:00:00.0
context Patient

define "Condition1 of Indications":
        ( exists (["Condition": "Multiple malignancy (disorder)"]) and ( exists (["Procedure": "Tumor marker monitoring (regime/therapy)"]M
        where M.performed during MeasurementPeriod) ) 
        and ( exists (["Observation": "Tumor marker measurement (procedure)"]) ) )
        
define "Condition2 of Indications":
		(exists (["Condition" :"Malignant neoplasm of breast (disorder)"]) and 
		(exists (["DiagnosticReport" : "Screening for cancer (procedure)"]))
		and (exists(["Procedure" :'Cancer antigen 15-3 measurement (procedure)'])))
		 or (exists (["Condition" :"Malignant neoplasm of breast (disorder)"]) and 
		(exists (["DiagnosticReport" : "Screening for cancer (procedure)"])) and
		 (exists (["Procedure" : "Measurement of cancer antigen 27-29 (procedure)"]C
		 where C.performed during MeasurementPeriod))
		 )
		 	
define "Coverage":
		"Condition1 of Indications" and "Condition2 of Indications"

