library ChallengeIngestionFoodTesting


using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Encounter Hospital Outpatient":'2.16.840.1.113883.3.3157.1002.14'
valueset "Rheumatoid Arthritis":'2.16.840.1.113883.3.464.1003.113.11.1081'
valueset "Depression diagnosis":'2.16.840.1.113883.3.600.145'
valueset "Respiratory Problems S":'2.16.840.1.113883.3.666.5.1727'

define "Not Covered":
	exists(["Diagnosis": "Rheumatoid Arthritis"])
	or exists(["Diagnosis": "Depression diagnosis"])
	or exists(["Diagnosis": "Respiratory Problems S"])

define "Covered":
	exists(["Encounter, Performed": "Encounter Hospital Outpatient"])

define "Coverage":
	"Covered" and not "Not Covered"

