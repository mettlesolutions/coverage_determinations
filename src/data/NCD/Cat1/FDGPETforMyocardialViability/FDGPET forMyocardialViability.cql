//FDG PET for Myocardial Viability
library FDGPETforMyocardialViability

using FHIR

include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
valueset "Positron emission tomography myocardial rest imaging using fluorodeoxyglucose (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Single photon emission computed tomography of heart (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Myocardial revascularization (procedure)" :'2.16.840.1.113883.3.88.12.80.28'
valueset "Positron emission tomography heart study (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Documenting observations (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Referred by primary care physician (finding)":'2.16.840.1.113762.1.4.1096.216'
valueset "Inconclusive (qualifier value)" : '2.16.840.1.113762.1.4.1185.8'

valueset "Ischemic congestive cardiomyopathy (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Left ventricular systolic dysfunction (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Left ventricular diastolic dysfunction (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'

parameter MeasurementPeriod default @2002-01-01T00:00:00.0
parameter MeasurementPeriod1 default @2002-10-01T00:00:00.0


context Patient


define "Cover":
		(exists (["Condition": "Ischemic congestive cardiomyopathy (disorder)"])
		and (exists (["Condition":"Left ventricular systolic dysfunction (disorder)"]))
		or (exists (["Condition":"Left ventricular diastolic dysfunction (disorder)"]))
		)
		
define "Covered 1":
		"Cover" and (exists (["Procedure": "Positron emission tomography myocardial rest imaging using fluorodeoxyglucose (procedure)"])
		and (exists (["Procedure":"Single photon emission computed tomography of heart (procedure)"] S
		where (S.performed) during MeasurementPeriod and S.outcome = "Inconclusive (qualifier value)"))
		)
		
define "Covered 2":
		(exists (["Procedure": "Positron emission tomography myocardial rest imaging using fluorodeoxyglucose (procedure)"])
		or (exists (["Procedure": "Myocardial revascularization (procedure)"]))
		or (exists (["Procedure":"Single photon emission computed tomography of heart (procedure)"] S
		where (S.performed) during MeasurementPeriod1 and  S.outcome = "Inconclusive (qualifier value)"))
		)
		
define "Limitation 1":
		(exists (["Procedure":"Single photon emission computed tomography of heart (procedure)"] S
		where S.outcome = "Inconclusive (qualifier value)"))
		and (exists ((["Procedure":"Positron emission tomography heart study (procedure)"]))
		)
		
define "Limitation 2":
		(exists ((["Procedure":"Positron emission tomography myocardial rest imaging using fluorodeoxyglucose (procedure)"] P			
		where P.outcome = "Inconclusive (qualifier value)"))
		and not (exists (["Procedure":"Single photon emission computed tomography of heart (procedure)"])) 
		)
		
define "Indications":
		"Covered 1" and "Covered 2"
		
define "Limitations":
		"Limitation 1" and "Limitation 2"
		
define "Coverage":
		"Indications" and "Limitations" and
		 (exists (["Procedure" : "Documenting observations (procedure)"])
		 and (exists (["Observation" : "Referred by primary care physician (finding)"]))
		 )
		
		
