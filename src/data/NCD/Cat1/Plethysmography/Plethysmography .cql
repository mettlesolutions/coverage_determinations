//Plethysmography 
library ChlamydiaScreening_Common version '2'

using QDM

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



context Patient

define "Segmental Plethysmography":
		(exists (["Procedure, Performed":"Regional plethysmography (procedure)"])
		and(exists (["Procedure, Performed":"Impedance plethysmography (procedure)"]))
		and(exists (["Procedure, Performed":"Pulse volume recorder plethysmography (procedure)"]))
		)

define "Ultrasonic Measurement of Blood Flow (Doppler)":
		(exists (["Diagnosis" : "Peripheral vascular disease (disorder)"])
		and (exists (["Procedure, Performed":"Color doppler ultrasound (procedure)"]))
		)

define "Covered":
	"Segmental Plethysmography" and "Ultrasonic Measurement of Blood Flow (Doppler)" and 
	( exists (["Procedure, Performed": "Ocular plethysmography (procedure)"]) ) 
	and ( exists (["Procedure, Performed": "Strain gauge plethysmography (procedure)"]) ) 

define "Not Covered":
		 (exists (["Procedure, Performed":"Photoplethysmography (procedure)"])
		and (exists (["Procedure, Performed":"Impedance plethysmography (procedure)"]))
		and (exists (["Procedure, Performed":"Venous occlusion plethysmography (procedure)" ]))
		)
		
define "Coverage":
		"Covered" and "Not Covered"
