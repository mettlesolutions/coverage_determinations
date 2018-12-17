//Laparoscopic Cholecystectomy

library LaparoscopicCholecystectomy

using FHIR

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
	(exists (["Condition": "Cholecystitis (disorder)"])
	and (exists (["Procedure": "Laparoscopic cholecystectomy (procedure)"]))
	)
	
define "Claim 1":
		if(exists (["Encounter" : "Inpatient stay (finding)"]))
		then
		 	(exists (["Procedure" :"Laparoscopy (procedure)"]))
		else
		 	null
		 	
define "Claim 2":
		(exists (["Procedure" :"Surgical procedure (procedure)"])
		or (exists (["Procedure" :"Cholecystectomy (procedure)"]))
		or (exists (["Procedure" :"Laparoscopic cholecystectomy with cholangiography (procedure)"]))
		or (exists (["Procedure" :"Surgical procedure (procedure)"]))
		)
		
define "Coverage":
		"Covered" and "Claim 1" and "Claim 2"
