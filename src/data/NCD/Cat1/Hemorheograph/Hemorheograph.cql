library Hemorheograph

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Peripheral vascular disease (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Preoperative procedure (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Postoperative procedure (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Evaluation of diagnostic study results (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Diagnostic procedure (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Disease suspected (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'


define "Covered":
	(exists(["Diagnosis": "Peripheral vascular disease (disorder)"]) 
		and exists(["Assessment, Performed": "Disease suspected (situation)"])) 
	and (exists(["Procedure, Performed": "Diagnostic procedure (procedure)"]) 
		and exists(["Procedure, Performed": "Evaluation of diagnostic study results (procedure)"]) 
		and (exists(["Procedure, Performed": "Preoperative procedure (procedure)"]) 
			or exists(["Procedure, Performed": "Postoperative procedure (procedure)"])))
	
	
define "Coverage":
	"Covered"
