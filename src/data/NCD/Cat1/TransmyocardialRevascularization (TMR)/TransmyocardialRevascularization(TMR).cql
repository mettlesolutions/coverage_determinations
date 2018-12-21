//Transmyocardial Revascularization (TMR)
library TransmyocardialRevascularization

using FHIR

include FHIRHelpers version '1.8' called FHIRHelpers
//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.3.88.12.80.28'
valueset "Angina (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Medical therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Drug therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Percutaneous transluminal coronary angioplasty (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Placement of stent (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Coronary bypass graft angiography (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Ejection Fraction": '2.16.840.1.113883.3.526.2.1238'
valueset "Myocardial ischemia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Percutaneous coronary intervention (procedure)": '2.16.840.1.113883.3.3157.2000.2'
valueset "Ventricular fibrillation (disorder)": '2.16.840.1.113883.3.526.3.366'
valueset "Cardiac arrhythmia, unspecified": '2.16.840.1.113883.3.526.3.366'
valueset "Congestive heart failure, unspecified": '2.16.840.1.113762.1.4.1182.92'
valueset "Acute myocardial infarction (disorder)": '2.16.840.1.113883.3.464.1003.104.12.1001'
valueset "Cardiac intensive care unit (environment)": '2.16.840.1.113762.1.4.1110.23'
valueset "Transmyocardial revascularization by laser technique (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Professional nurse (occupation)" : '2.16.840.1.113762.1.4.1096.129'
valueset "Physician (occupation)" : '2.16.840.1.113762.1.4.1096.129'
valueset "Referral to general pathology service (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Consultation for laboratory medicine (procedure)" : '2.16.840.1.113883.3.88.12.80.28'

parameter MeasurementPeriod default @1999-07-01T00:00:00.0
context Patient

define "Refactory to treatments":
		(exists (["Procedure" : "Medical therapy (procedure)"])
		and (exists (["Procedure" :"Drug therapy (procedure)"]))
		and (exists (["Procedure" : "Percutaneous transluminal coronary angioplasty (procedure)"])
		or (exists (["Procedure" :"Placement of stent (procedure)"]))
		or (exists (["Procedure" : "Coronary bypass graft angiography (procedure)"]))
		))

define "Condition 2":
		(exists (["Procedure" : "Ejection Fraction"]) EF
		where EF.outcome = 25 '%' and (exists (["Condition":"Myocardial ischemia (disorder)"]) and (exists (["Procedure" :"Percutaneous coronary intervention (procedure)"]))
		and (exists (["Condition":"Ventricular fibrillation (disorder)"])) or (exists (["Condition":"Cardiac arrhythmia, unspecified"]))
		or (exists (["Condition" :"Congestive heart failure, unspecified"])) or (exists (["Condition" :"Acute myocardial infarction (disorder)"])))
		)
		
define "Condition 1":
		(exists (["Condition" : "Angina (disorder)"])) and "Refactory to treatments"
		
define "Providers":
		(exists (["Practitioner" : "Professional nurse (occupation)"]) 
		or (exists (["Practitioner" : "Physician (occupation)"]))
		or (exists (["Practitioner" : "Referral to general pathology service (procedure)"]))
		or (exists (["Practitioner" : "Consultation for laboratory medicine (procedure)"]))
		)

define "Covered":
		"Providers" and (exists (["Observation" : "Transmyocardial revascularization by laser technique (procedure)"]T
		where (T.effective) during MeasurementPeriod)
		and (exists (["Observation" : "Cardiac intensive care unit (environment)"])))
		
define "Coverage":
		"Condition 1" or "Condition 2" or "Covered"
