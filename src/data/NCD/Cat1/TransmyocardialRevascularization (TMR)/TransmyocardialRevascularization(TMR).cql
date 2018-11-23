//Transmyocardial Revascularization (TMR)
library ChlamydiaScreening_Common version '2'

using QDM

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

context Patient

define "Refactory to treatments":
		(exists (["Procedure, Performed" : "Medical therapy (procedure)"])
		and (exists (["Procedure, Performed" :"Drug therapy (procedure)"]))
		and (exists (["Procedure, Performed" : "Percutaneous transluminal coronary angioplasty (procedure)"])
		or (exists (["Procedure, Performed" :"Placement of stent (procedure)"]))
		or (exists (["Procedure, Performed" : "Coronary bypass graft angiography (procedure)"]))
		))

define "Condition 2":
		(exists (["Procedure, Performed" : "Ejection Fraction"]) EF
		where EF.result > 25 '%' and (exists (["Diagnosis":"Myocardial ischemia (disorder)"]) and (exists (["Procedure, Performed" :"Percutaneous coronary intervention (procedure)"]))
		and (exists (["Diagnosis":"Ventricular fibrillation (disorder)"])) or (exists (["Diagnosis":"Cardiac arrhythmia, unspecified"]))
		or (exists (["Diagnosis" :"Congestive heart failure, unspecified"])) or (exists (["Diagnosis" :"Acute myocardial infarction (disorder)"])))
		)
		
define "Condition 1":
		(exists (["Diagnosis" : "Angina (disorder)"])) and "Refactory to treatments"
		
define "Providers":
		(exists (["Provider Characteristic" : "Professional nurse (occupation)"]) 
		or (exists (["Provider Characteristic" : "Physician (occupation)"]))
		or (exists (["Provider Characteristic" : "Referral to general pathology service (procedure)"]))
		or (exists (["Provider Characteristic" : "Consultation for laboratory medicine (procedure)"]))
		)

define "Covered":
		"Providers" and (exists (["Provider Care Experience" : "Transmyocardial revascularization by laser technique (procedure)"])
		and (exists (["Provider Care Experience" : "Cardiac intensive care unit (environment)"])))
		
define "Coverage":
		"Condition 1" or "Condition 2" or "Covered"
