library AnesthesiaInCardiacPacemakerSurgery version '1'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Anesthesia for transvenous pacemaker insertion (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Cardiac pacemaker procedure (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Transthoracic cardiac pacing procedure (procedure)":'2.16.840.1.113883.3.88.12.80.28'
	

define "Covered":
	exists(["Procedure, Performed":"Cardiac pacemaker procedure (procedure)"])
	or exists(["Procedure, Performed":"Transthoracic cardiac pacing procedure (procedure)"])
	

define "Coverage":
	"Covered"
