//Pharmacogenomic Testing for Warfarin Response
library PharmacogenomicTestingforWarfarinResponse
using FHIR

include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem 'RXNORM' : '2.16.840.1.113883.6.88'
codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'
valueset "Evaluation of pharmacogenetic result (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Cytochrome p450 CYP2C9 enzyme (substance)" : '2.16.840.1.113762.1.4.1010.9'
valueset "Anticoagulant therapy (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Warfarin therapy (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Warfarin" : '2.16.840.1.113762.1.4.1021.8'
valueset "Deep venous thrombosis (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Venous thrombosis (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Dead (finding)":'2.16.840.1.113883.1.11.20.12'
valueset "Bleeding (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'

parameter MeasurementPeriod default @2009-08-03T00:00:00.0
context Patient

define "Cover Condition":
		(exists (["MedicationAdministration" : "Cytochrome p450 CYP2C9 enzyme (substance)"])
		and (exists (["Procedure" : "Evaluation of pharmacogenetic result (procedure)"]E
		where (E.performed) during MeasurementPeriod))
		)
define "Condition":
		(exists (["MedicationStatement" :"Warfarin" ])
		and (exists (["Procedure" : "Anticoagulant therapy (procedure)"]))
		)
define "Condition 2":
		if(exists (["Procedure" : "Anticoagulant therapy (procedure)"]))
		then
			(exists (["MedicationAdministration": "Warfarin"]W
			where duration in days of (W.effective) <= 5 ))
		else 
			null
		
define "Conditions":
		if("Condition" and not (exists (["MedicationAdministration" : "Cytochrome p450 CYP2C9 enzyme (substance)"])) and "Condition 2")
		then
			"Condition"
		else
			null
			
define "Inclusions":
		(exists (["MedicationStatement" :"Warfarin" ])
		and (exists (["Procedure" : "Anticoagulant therapy (procedure)"]))
		 and (exists (["Procedure" : "Warfarin therapy (procedure)"]))
		 )
		
define "Disease":
		(exists (["Condition" : "Bleeding (finding)"])
		or (exists (["Condition" : "Deep venous thrombosis (disorder)"]))
		or (exists (["Condition" : "Venous thrombosis (disorder)"]))
		or (exists (["Condition":"Dead (finding)"]))
		and not (exists (["Procedure" : "Evaluation of pharmacogenetic result (procedure)"]))
		and (exists (["Procedure" :  "Warfarin therapy (procedure)"]))
		)

define "Included":
		"Inclusions" and "Disease"
define "Covered":
		"Cover Condition" and "Conditions" and "Included"
		
define "Not Covered":
		not "Cover Condition"
		
define "Others":
		not "Covered"
		
define "Coverage":
		"Covered" and "Not Covered" and "Others"	


