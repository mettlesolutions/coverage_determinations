//Gamma Glutamyl Transferase
library GammaGlutamylTransferase

using FHIR

include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'
valueset "Primary malignant neoplasm of liver (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Secondary malignant neoplasm of liver (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Malnutrition (calorie) (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Diabetes mellitus (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Disorder of mineral metabolism (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Disorder of iron metabolism (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Amyloidosis (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Pulmonary sarcoidosis (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Portal hypertension (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Systemic lupus erythematosus (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Disorder of gastrointestinal tract (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Disorder of pancreas (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Transplantation of liver (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Patient encounter status (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Drug-induced disorder of liver (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Finding of gamma-glutamyl transferase level (finding)" :'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Gamma-glutamyl transferase level normal (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Disorder of liver (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Liver enzymes abnormal (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Alcoholism (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Alcoholic liver damage (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Viral hepatitis (disorder)" :'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Tuberculosis of liver (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Amebic dysentery (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Finding of alkaline phosphatase level (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Chronic liver disease (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Gamma glutamyl transferase measurement (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Cytochrome-c oxidase deficiency (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
parameter "Measurement Period" Interval<DateTime>

context Patient

define "Indication":
		(exists (["Condition" : "Alcoholism (disorder)"])
		or (exists (["Condition" : "Drug-induced disorder of liver (disorder)"]))
		and (exists (["Condition" : "Alcoholic liver damage (disorder)" ]))
		and (exists (["Condition" : "Viral hepatitis (disorder)"]))
		and (exists (["Condition" : "Tuberculosis of liver (disorder)"]))
		and (exists (["Condition" : "Amebic dysentery (disorder)"]))
		)
define "Indication 1":
		
		 (exists (["Condition" : "Primary malignant neoplasm of liver (disorder)"])
		and (exists (["Condition" : "Secondary malignant neoplasm of liver (disorder)"]))
		or (exists (["Condition" : "Malnutrition (calorie) (disorder)"]))
		or (exists (["Condition" : "Diabetes mellitus (disorder)"]))
		or (exists (["Condition" :"Disorder of mineral metabolism (disorder)"]))
		or (exists (["Condition" : "Disorder of iron metabolism (disorder)"]))
		or (exists (["Condition" : "Amyloidosis (disorder)"]))
		or (exists (["Condition" :"Pulmonary sarcoidosis (disorder)"]))
		or (exists (["Condition" : "Portal hypertension (disorder)"]))
		or (exists (["Condition" : "Systemic lupus erythematosus (disorder)"]))
		and (exists (["Condition" : "Disorder of gastrointestinal tract (disorder)"]))
		and (exists (["Condition" : "Disorder of pancreas (disorder)"]))
		and (exists (["Procedure":"Transplantation of liver (procedure)" included in ["Encounter" : "Patient encounter status (finding)"]]))
		and (exists (["Condition": "Finding of alkaline phosphatase level (finding)"]))
		)
define "Indications" : 
		"Indication" and "Indication 1"
		and (exists (["Procedure" :"Gamma glutamyl transferase measurement (procedure)"]))
		

define "Limitation":
		if(exists ["Condition" : "Chronic liver disease (disorder)"] and not "Indications"
	 	and(exists ["Procedure":"Gamma glutamyl transferase measurement (procedure)"] G
			where G.outcome = "Gamma-glutamyl transferase level normal (finding)"))
		then
			null
		else
			(exists ["Condition" : "Chronic liver disease (disorder)"] and not "Indications"
	 	and(exists ["Procedure":"Gamma glutamyl transferase measurement (procedure)"] G
			where G.outcome = "Gamma-glutamyl transferase level normal (finding)"))
			
		
define "Limitation 1":
		(exists (["Condition":"Liver enzymes abnormal (finding)"])
		and (exists (["Procedure":"Gamma glutamyl transferase measurement (procedure)"]T
		where duration in weeks of (T.performed) = 1 ))
		)
		
define "Limitation 2":
		(exists (["Condition" : "Disorder of liver (disorder)"])
		and not (exists (["Condition" : "Cytochrome-c oxidase deficiency (disorder)"]))
		and not (exists (["Procedure":"Gamma glutamyl transferase measurement (procedure)"]))
		)
		
define "Limitations":
		"Limitation" or "Limitation 1" or "Limitation 2"
		
define "Coverage":
		"Indications" and "Limitations"
