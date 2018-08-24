
library ChlamydiaScreening_Common version '2'

using QDM version '5.3'

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


context Patient

define "Indications":
	["Symptom": "Acute postoperative pain (finding)"] union ["Device, Applied": "Transcutaneous electrical nerve stimulation (regime/therapy)"]D
	where D.relevantPeriod < 30 days

define "Limitation":
	["Symptom": "Chronic pain (finding)"] union ["Device, Applied": "Transcutaneous electrical nerve stimulation (regime/therapy)"]De
	where De.relevantPeriod > 30 days
	
define "Coverage":
	"Indications" union "Limitation"
