library InsulinSyringe

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Supervision while performing activity (regime/therapy)":'2.16.840.1.113883.6.96'
valueset "Physician service (procedure)":'2.16.840.1.113883.6.96'
valueset "Physician (occupation)":'2.16.840.1.113883.6.96'
valueset "Emergent Situation":'2.16.840.1.113762.1.4.1116.496'
valueset "Diabetes mellitus (disorder)":'2.16.840.1.113883.6.96'
valueset "Seen by physician (finding)":'2.16.840.1.113883.6.96'

define "Procedure":
	exists(["Assessment, Performed": "Seen by physician (finding)"])
	or (exists(["Encounter, Performed": "Physician (occupation)"])
		and exists(["Procedure, Performed": "Supervision while performing activity (regime/therapy)"]))


define "Covered":
	exists(["Procedure, Performed": "Physician service (procedure)"]) 
	and "Procedure"
	and exists(["Assessment, Performed": "Emergent Situation"])

define "Not Covered":
	exists(["Diagnosis": "Emergent Situation"])
	
define "Coverage":
	"Covered" and not "Not Covered"
