library DiagnosticEndocardialElectricalStimulation

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Cardiac arrhythmia (disorder)":'2.16.840.1.113883.6.96'
valueset "Symptom severe (finding)":'2.16.840.1.113883.6.96'

define "Covered":
	exists(["Diagnosis": "Cardiac arrhythmia (disorder)"])
	and exists(["Assessment, Performed": "Symptom severe (finding)"])

define "Coverage": 
	"Covered"
