library AnesthesiaInCardiacPacemakerSurgery version '1'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Anesthesia for transvenous pacemaker insertion (procedure)":'2.16.840.1.113883.6.96'
valueset "Implantation of cardiac temporary transvenous pacemaker system during and immediately following cardiac surgery (procedure)":'2.16.840.1.113883.6.96'

define "Covered":
	exists(["Procedure, Performed":"Implantation of cardiac temporary transvenous pacemaker system during and immediately following cardiac surgery (procedure)"])
	

define "Coverage":
	"Covered"
