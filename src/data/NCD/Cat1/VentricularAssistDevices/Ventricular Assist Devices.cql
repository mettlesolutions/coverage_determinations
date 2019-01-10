//Ventricular Assist Devices
library VentricularAssistDevices

using FHIR

include FHIRHelpers version '1.8' called FHIRHelpers
//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "LOINC" : '2.16.840.1.113883.6.1'
codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'
valueset "Implantation of ventricular assist device (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Postcardiotomy syndrome (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Open heart surgery (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Transplantation of heart (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Organ procurement facilitation (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Patient on organ transplant waiting list (finding)" : '2.16.840.1.113762.1.4.1056.101'
valueset "Heart failure due to end stage congenital heart disease (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Prescription of beta blocker (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Angiotensin converting enzyme inhibitor therapy (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Cardioassist by aortic balloon pump (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Left ventricular Ejection fraction" : '2.16.840.1.113883.3.526.2.1238'
valueset "Monitoring of cardiac output by oxygen consumption technique (regime/therapy)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Cardiologist (occupation)" : '2.16.840.1.113762.1.4.1099.14'
valueset "Treatment Failure" : '2.16.840.1.113762.1.4.1111.93'
valueset "Advanced heart failure and transplant cardiology History and physical note" :'2.16.840.1.113883.1.11.20.22'
valueset "Social worker (occupation)" : '2.16.840.1.113762.1.4.1099.14'
valueset "Specialist palliative care treatment (regime/therapy)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Implantation of right ventricular assist device (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Implantation of biventricular assist device (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Congenital heart disease (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Acute heart failure (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "History of heart failure (situation)" : '2.16.840.1.113883.3.88.12.3221.7.4'

parameter MeasurementPeriod default @1993-10-18T00:00:00.0
parameter MeasurementPeriod1 default @1996-01-22T00:00:00.0
parameter MeasurementPeriod2 Interval<DateTime>
parameter MeasurementPeriod3 default @2014-10-30T00:00:00.0
parameter MeasurementPeriod4 default @2010-11-09T00:00:00.0
parameter Range default Interval [null,14]
context Patient

define "Condition 1":
		(exists (["Condition" :  "Postcardiotomy syndrome (disorder)"])
		and (exists (["Procedure" : "Open heart surgery (procedure)"]))
		and (exists (["Procedure" :"Implantation of ventricular assist device (procedure)"]I
		where I.performed during MeasurementPeriod))
		)
define "Condition 2":
		(exists (["Procedure": "Transplantation of heart (procedure)"])
		and (exists (["Procedure":"Organ procurement facilitation (procedure)"]))
		and (exists (["Procedure" :"Implantation of ventricular assist device (procedure)"]V
		where V.performed during MeasurementPeriod1))
		)
		
define "Condition 3":
		(exists (["Procedure" : "Prescription of beta blocker (procedure)"]B
		where B.outcome = "Treatment Failure")
		and (exists (["Procedure" : "Cardioassist by aortic balloon pump (procedure)"]C
		where duration in days of C.performed = 7))
		and (exists (["Condition" : "Left ventricular Ejection fraction"]L
		where L.severity = 25 '%'))
		)
define "Condition 4":
		(exists (["Procedure" : "Monitoring of cardiac output by oxygen consumption technique (regime/therapy)"]M
		where M.outcome = Range in 'ml/kg/min')
		and not (exists (["Procedure" : "Cardioassist by aortic balloon pump (procedure)"]))
		)

		
define "Patient Selection" : 
		 ("Condition 3" and "Condition 4")
		and (exists (["Condition" :"Heart failure due to end stage congenital heart disease (disorder)"])
		and not (exists (["Procedure": "Transplantation of heart (procedure)"]T
		where T.performed during MeasurementPeriod4))
		)
		
define "Other 1":
		if(AgeInYearsAt(start of MeasurementPeriod2) <= 18)
		then
			(exists (["Procedure" : "Implantation of right ventricular assist device (procedure)"])
			or (exists (["Procedure" : "Implantation of biventricular assist device (procedure)"]))
			)
		else
			null
define "Other 2":
		 (exists (["Condition" : "Congenital heart disease (disorder)"])
		and (exists (["Condition" : "Acute heart failure (disorder)"]))
		and not (exists (["Condition" : "History of heart failure (situation)"]))
		)
		
define "Cover":
		"Condition 1" and "Condition 2" and "Patient Selection"
define "Team":
		(exists (["Practitioner" : "Cardiologist (occupation)"])
		and (exists (["Practitioner" : "Social worker (occupation)"]))
		and (exists (["Observation" : "Specialist palliative care treatment (regime/therapy)"]))
		and (exists (["Procedure" :"Implantation of ventricular assist device (procedure)"]I
		where I.performed during MeasurementPeriod3))
		)
		
		
define "Covered":
		if("Team")
		 then
		 	"Cover"
		 else
			null
define "Not Covered":
		"Other 1" and "Other 2"	and not "Covered"
		
define "Coverage":
		"Covered" and"Not Covered"
