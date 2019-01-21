//TENS For Acute Post Operative Pain
library TranscutaneousElectricalNerveStimulationforAcutePostOperativePain

using FHIR
include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Transcutaneous electrical nerve stimulation (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Acute postoperative pain (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Provision of transcutaneous electrical nerve stimulation device (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Chronic pain (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Suppliers; Durable Medical Equipment & Medical Supplies": '2.16.840.1.114222.4.11.1066'
parameter MeasurementPeriod default @2013-07-01T00:00:00.0

context Patient

define "Condition 1(Covered)":
        ( exists (["Condition": "Acute postoperative pain (finding)"]) and 
        ( exists(["Procedure": "Transcutaneous electrical nerve stimulation (regime/therapy)"]T
        where T.performed on or after MeasurementPeriod ) )
        )
        
define "Condition for Indications":
          ( exists (["Procedure": "Transcutaneous electrical nerve stimulation (regime/therapy)"]D
            where duration in days of D.performed < 30 and D.performed on or after MeasurementPeriod ) ) 

define "Indications":
	( exists (["Condition": "Acute postoperative pain (finding)"]) and "Condition for Indications"
	)
	
define "Condition for Limitations":	
        ( exists (["Procedure": "Transcutaneous electrical nerve stimulation (regime/therapy)"]De
	where duration in days of De.performed > 30 and De.performed on or after MeasurementPeriod ))

define "Limitation":
	( exists (["Condition": "Chronic pain (finding)"]) ) and "Condition for Limitations"
	
define "Coverage":
	"Indications" or "Limitation" or "Condition 1(Covered)"
