//Glycated Hemoglobin/Glycated Protein
library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'
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
		(exists (["Diagnosis" :"Hemoglobin A1C - diabetic control finding (finding)"])
		and (exists (["Diagnosis" :"Hyperglycemia (disorder)"]))
		or (exists (["Diagnosis" : "Hypoglycemia, unspecified"]))
		and (exists (["Procedure, Performed" : "Hemoglobin A1c measurement (procedure)"]))
		)
		
define "Indication 2":
		(exists (["Diagnosis" :"Hemolytic anemia (disorder)"])
		or (exists (["Diagnosis" :"Hemoglobinopathy (disorder)"]))
		and (exists (["Procedure, Performed" : "Glycated protein measurement (procedure)"]))
		)
define "Indications":
		"Indication 1" and "Indication 2"
		
define "Limitation 1":
		(exists (["Diagnosis" : "Hemoglobin A1C - diabetic control finding (finding)"])
		and (exists (["Procedure, Performed" : "Hemoglobin A1c measurement (procedure)"]))
		)
		
define "Limitation 2":
		(exists (["Diagnosis": "Gestational diabetes mellitus (disorder)"])
		and (exists (["Procedure, Performed" : "Hemoglobin A1c measurement (procedure)"]))
		)
define "Limitation 3":
		(exists (["Diagnosis": "Type I diabetes mellitus uncontrolled (finding)" ])
		or (exists (["Diagnosis": "Type II diabetes mellitus uncontrolled (finding)" ]))
		 and (exists (["Procedure, Performed" : "Hemoglobin A1c measurement (procedure)"]))
		)
		
define "Start Date Fructosamine":
	["Procedure, Performed": "Fructosamine measurement (procedure)"] F
	  where F.relevantPeriod in "MeasurementPeriod"
	  
 define "Start Date Hemoglobin":
           ["Procedure, Performed": "Hemoglobin A1c measurement (procedure)"] B
	  where B.relevantPeriod in "MeasurementPeriod"  
		

define "Condition":
           if "Start Date Fructosamine" = "Start Date Hemoglobin"
           then Count("Fructosamine measurement (procedure)") = 1 and Count("Hemoglobin A1c measurement (procedure)") = 1
           else null	
           
define "Limitations":
		"Limitation 1" or "Limitation 2" or "Limitation 3" and "Condition"
		
define "Coverage":
		"Indications" and "Limitations"
		


