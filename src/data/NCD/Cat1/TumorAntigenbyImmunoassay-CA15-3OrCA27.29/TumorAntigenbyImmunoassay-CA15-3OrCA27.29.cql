//TumorAntigenbyImmunoassay-CA15-3OrCA27.29
library ChlamydiaScreening_Common version '2'

using QDM


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


context Patient

define "Condition1 of Indications":
        ( exists (["Diagnosis": "Multiple malignancy (disorder)"]) and ( exists (["Procedure, Performed": "Tumor marker monitoring (regime/therapy)"]) ) 
        and ( exists (["Laboratory Test, Performed": "Tumor marker measurement (procedure)"]) ) )
        
define "Condition2 of Indications":
		(exists (["Diagnosis" :"Malignant neoplasm of breast (disorder)"]) and 
		(exists (["Diagnostic Study, Performed" : "Screening for cancer (procedure)"]))
		and (exists(["Procedure, Performed" :'Cancer antigen 15-3 measurement (procedure)'])))
		 or (exists (["Diagnosis" :"Malignant neoplasm of breast (disorder)"]) and 
		(exists (["Diagnostic Study, Performed" : "Screening for cancer (procedure)"])) and
		 (exists (["Procedure, Performed" : "Measurement of cancer antigen 27-29 (procedure)"]))
		 )
		 	
define "Coverage":
		"Condition1 of Indications" and "Condition2 of Indications"

