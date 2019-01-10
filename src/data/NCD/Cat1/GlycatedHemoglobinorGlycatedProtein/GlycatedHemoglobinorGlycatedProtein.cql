library GlycatedHemoglobinGlycatedProtein

using FHIR

include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": 'http://snomed.info/sct'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "ICD9CM": 'https://www.cdc.gov/nchs/icd/icd9.htm'
codesystem "RXNORM": 'https://www.nlm.nih.gov/research/umls/rxnorm/'
codesystem "ICD10CM": '2.16.840.1.113883.6.90'
codesystem "NUCCPT":''

valueset "Hemoglobin A1c measurement (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Hyperglycemia (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hemolytic anemia (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hemoglobinopathy (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Gestational diabetes mellitus (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Fructosamine measurement (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Type I diabetes mellitus uncontrolled (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Type II diabetes mellitus uncontrolled (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hemoglobin A1C - diabetic control finding (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hypoglycemia, unspecified"  : '2.16.840.1.113883.3.3157.1027'
valueset "Glycated protein measurement (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Self-monitoring of blood glucose (procedure)" : '2.16.840.1.113883.3.88.12.80.28'

parameter "MeasurementPeriod" Interval<DateTime>
context Patient

define "Indication 1" : 
		(exists ([Condition :"Hemoglobin A1C - diabetic control finding (finding)"])
		and (exists ([Condition :"Hyperglycemia (disorder)"]))
		or (exists ([Condition : "Hypoglycemia, unspecified"]))
		and (exists ([Procedure : "Hemoglobin A1c measurement (procedure)"]))
		)
		
define "Indication 2":
		(exists ([Condition :"Hemolytic anemia (disorder)"])
		or (exists ([Condition :"Hemoglobinopathy (disorder)"]))
		and (exists ([Procedure : "Glycated protein measurement (procedure)"]))
		)
define "Indications":
		"Indication 1" and "Indication 2"
		
define "Limitation 1":
		(exists ([Condition : "Hemoglobin A1C - diabetic control finding (finding)"])
		and (exists ([Procedure : "Hemoglobin A1c measurement (procedure)"]))
		)
		
define "Limitation 2":
		(exists ([Condition: "Gestational diabetes mellitus (disorder)"])
		and (exists ([Procedure : "Hemoglobin A1c measurement (procedure)"]))
		)
define "Limitation 3":
		(exists ([Condition: "Type I diabetes mellitus uncontrolled (finding)" ])
		or (exists ([Condition: "Type II diabetes mellitus uncontrolled (finding)" ]))
		 and (exists ([Procedure : "Hemoglobin A1c measurement (procedure)"]))
		)
		
define "Start Date Fructosamine":
	[Procedure: "Fructosamine measurement (procedure)"] F
	  where F.performed in "MeasurementPeriod"

 define "Start Date Hemoglobin":
           [Procedure: "Hemoglobin A1c measurement (procedure)"] B
	  where B.performed in "MeasurementPeriod"
		

define "Condition":
           if "Start Date Fructosamine" = "Start Date Hemoglobin"
           then Count("Fructosamine measurement (procedure)") = 1 and Count("Hemoglobin A1c measurement (procedure)") = 1
           else null	
           
define "Limitations":
		"Limitation 1" or "Limitation 2" or "Limitation 3" and "Condition"
		
define "Coverage":
		"Indications" and "Limitations"
		


