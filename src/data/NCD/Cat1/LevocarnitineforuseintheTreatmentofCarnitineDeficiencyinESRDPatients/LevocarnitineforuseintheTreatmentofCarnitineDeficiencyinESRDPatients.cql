//Levocarnitine for use in the Treatment of Carnitine Deficiency in ESRD Patients
library LevocarnitineforuseintheTreatmentofCarnitineDeficiencyinESRDPatients

using FHIR
include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'
valueset "Plasma carnitine level (procedure)" :'2.16.840.1.113883.3.88.12.80.28'
valueset "End-stage renal disease (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Carnitine deficiency (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Plasma free carnitine level (procedure)"  : '2.16.840.1.113883.3.88.12.80.28'
valueset "Erythropoietin resistance in anemia of chronic kidney disease (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hemodialysis-associated hypotension (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Levocarnitine" : '2.16.840.1.113762.1.4.1010.1'
valueset "Dialysis procedure (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Documentation procedure (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Hematocrit determination (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Erythropoietin therapy (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Patient's condition improved (finding)" : '2.16.840.1.113762.1.4.1096.114'
valueset "Procedure discontinued by healthcare professional (situation)" : '2.16.840.1.113883.3.88.12.3221.7.4'

parameter MeasurementPeriod Interval<DateTime>
context Patient

define "Cover Condition" : 
		(exists (["Condition": "End-stage renal disease (disorder)"])
		and (exists (["Procedure":"Dialysis procedure (procedure)"] D
		where duration in months of (D.performed) =  3))
		)
define "Condition":
		(exists (["Condition" :  "Carnitine deficiency (disorder)"])
		and (exists (["Procedure" : "Plasma free carnitine level (procedure)"]P
		where P.outcome = 40 'micromol/L' ))
		and (exists (["Procedure" : "Documentation procedure (procedure)"]))
		)
define "Condition 1" :
		(exists (["Condition" : "Erythropoietin resistance in anemia of chronic kidney disease (disorder)"])
		or (exists (["Procedure" : "Hematocrit determination (procedure)"] H
		where H.outcome  = 30 '%'))
		and not (exists (["Procedure":"Erythropoietin therapy (procedure)"]))
		)
define "Condition 2" :
		if(exists (["Condition": "End-stage renal disease (disorder)"])
		and (exists (["Procedure":"Dialysis procedure (procedure)"] D
		where duration in days of( D.performed) = 30)) and Count(["Condition" : "Hemodialysis-associated hypotension (disorder)"]) = 2)
		then
			true
		else
			null
			
define "Conditions":
		"Condition" and "Condition 1" or "Condition 2"
		
define "Covered 1":
		"Cover Condition" and "Conditions" and (exists (["MedicationAdministration": "Levocarnitine"]))
		
define "Covered 2":
		(exists (["MedicationAdministration": "Levocarnitine"])	
		and (exists (["Encounter" : "Procedure discontinued by healthcare professional (situation)"]))
		and (exists (["Procedure" : "Plasma free carnitine level (procedure)"]P
		where P.outcome = 40 'micromol/L' )) 
		and (exists (["Condition" : "Erythropoietin resistance in anemia of chronic kidney disease (disorder)"]))
		)
		
define "Covered":
		"Covered 1" and "Covered 2"
		
define "Not Covered": 
		 "Cover Condition"  and (exists (["MedicationAdministration": "Levocarnitine"] L
		 where duration in months of (L.effective) = 6)
		 and not (exists (["Encounter":"Patient's condition improved (finding)"]))
		 )
	
define "Coverage":
		"Covered" and "Not Covered"
