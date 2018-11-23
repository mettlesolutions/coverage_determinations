//FDG PET for Myocardial Viability
library ChlamydiaScreening_Common version '2'

using QDM

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
valueset "Summary report (record artifact)":'2.16.840.1.113762.1.4.1116.529'
valueset "Physician (occupation)" : '2.16.840.1.113762.1.4.1096.129'
valueset "Inconclusive (qualifier value)" : '2.16.840.1.113762.1.4.1185.8'

valueset "Ischemic congestive cardiomyopathy (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Left ventricular systolic dysfunction (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Left ventricular diastolic dysfunction (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'

context Patient

define "Cover":
		(exists (["Diagnosis": "Ischemic congestive cardiomyopathy (disorder)"])
		and (exists (["Diagnosis":"Left ventricular systolic dysfunction (disorder)"]))
		or (exists (["Diagnosis":"Left ventricular diastolic dysfunction (disorder)"]))
		)
		
define "Covered 1":
		"Cover" and (exists (["Procedure, Performed": "Positron emission tomography myocardial rest imaging using fluorodeoxyglucose (procedure)"])
		and (exists (["Procedure, Performed":"Single photon emission computed tomography of heart (procedure)"] S
		where S.result = "Inconclusive (qualifier value)"))
		)
		
define "Covered 2":
		(exists (["Procedure, Performed": "Positron emission tomography myocardial rest imaging using fluorodeoxyglucose (procedure)"])
		or (exists (["Procedure, Performed": "Myocardial revascularization (procedure)"]))
		or (exists (["Procedure, Performed":"Single photon emission computed tomography of heart (procedure)"] S
		where S.result = "Inconclusive (qualifier value)"))
		)
		
define "Limitation 1":
		(exists (["Procedure, Performed":"Single photon emission computed tomography of heart (procedure)"] S
		where S.result = "Inconclusive (qualifier value)"))
		and (exists ((["Procedure, Performed":"Positron emission tomography heart study (procedure)"]))
		)
		
define "Limitation 2":
		(exists ((["Procedure, Performed":"Positron emission tomography myocardial rest imaging using fluorodeoxyglucose (procedure)"] P			
		where P.result = "Inconclusive (qualifier value)"))
		and not (exists (["Procedure, Performed":"Single photon emission computed tomography of heart (procedure)"])) 
		)
		
define "Indications":
		"Covered 1" and "Covered 2"
		
define "Limitations":
		"Limitation 1" and "Limitation 2"
		
define "Coverage":
		"Indications" and "Limitations" and
		 (exists (["Diagnostic Study, Performed" : "Summary report (record artifact)"])
		 and (exists (["Provider Characteristic" : "Physician (occupation)"]))
		 )
		
		
