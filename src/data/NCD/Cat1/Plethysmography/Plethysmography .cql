//Plethysmography 
library Plethysmography

using FHIR

include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'
//valueset "Plethysmography (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Regional plethysmography (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Pulse volume recorder plethysmography (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Diagnostic Doppler ultrasonography (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Peripheral vascular disease (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'


valueset "Impedance plethysmography (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Color doppler ultrasound (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Ocular plethysmography (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Strain gauge plethysmography (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Photoplethysmography (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Venous occlusion plethysmography (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
//Segmental Plethysmography 
// recording oscillometer
//Electrical Impedance Plethysmography
//Inductance Plethysmograpgy
//Capacitance Plethysmography
//Mechanical Oscillometry 

parameter MeasurementPeriod default @1980-11-15T00:00:00.0
context Patient

define "Segmental Plethysmography":
		(exists (["Procedure":"Regional plethysmography (procedure)"]R
		where R.performed during MeasurementPeriod)
		and(exists (["Procedure":"Impedance plethysmography (procedure)"]I
		where I.performed during MeasurementPeriod))
		and(exists (["Procedure":"Pulse volume recorder plethysmography (procedure)"]P
		where P.performed during MeasurementPeriod))
		)

define "Ultrasonic Measurement of Blood Flow (Doppler)":
		(exists (["Condition" : "Peripheral vascular disease (disorder)"])
		and (exists (["Procedure":"Color doppler ultrasound (procedure)"]D
		where D.performed during MeasurementPeriod))
		)

define "Covered":
	"Segmental Plethysmography"  and "Ultrasonic Measurement of Blood Flow (Doppler)" and 
	( exists (["Procedure": "Ocular plethysmography (procedure)"]O
	where O.performed during MeasurementPeriod) ) 
	and ( exists (["Procedure": "Strain gauge plethysmography (procedure)"]S
	where S.performed during MeasurementPeriod) ) 

define "Not Covered":
		 (exists (["Procedure":"Photoplethysmography (procedure)"])
		and (exists (["Procedure":"Impedance plethysmography (procedure)"]))
		and (exists (["Procedure":"Venous occlusion plethysmography (procedure)" ]))
		)
		
define "Coverage":
		"Covered" and  "Not Covered" during MeasurementPeriod
