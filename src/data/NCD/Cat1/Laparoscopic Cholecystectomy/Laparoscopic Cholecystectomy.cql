//Laparoscopic Cholecystectomy


library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'
valueset "Laparoscopy (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Cholecystitis (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Cannula procedure (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Laparos CPT codecopy (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Surgical procedure (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Cholecystectomy (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Laparoscopic cholecystectomy (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Laparoscopic cholecystectomy with cholangiography (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Inpatient stay (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'

context Patient

define "Covered":
	(exists (["Diagnosis": "Cholecystitis (disorder)"])
	and (exists (["Procedure, Performed": "Laparoscopic cholecystectomy (procedure)"]))
	)
	
define "Claim":
		(exists (["Encounter, Performed" : "Inpatient stay (finding)"])
		and (exists (["Procedure, Performed" :"Laparoscopy (procedure)"]))
		or (exists (["Procedure, Performed" :"Surgical procedure (procedure)"]))
		or (exists (["Procedure, Performed" :"Cholecystectomy (procedure)"]))
		or (exists (["Procedure, Performed" :"Laparoscopic cholecystectomy with cholangiography (procedure)"]))
		or (exists (["Procedure, Performed" :"Surgical procedure (procedure)"]))
		)
		
define "Coverage":
		"Covered" and "Claim"
