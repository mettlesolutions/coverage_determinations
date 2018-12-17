library AnesthesiaInCardiacPacemakerSurgery version '1'

using FHIR version '1.8'//include otherLibrary version 'x.x' called otherLibrary//codesystem codeSystemName : 'OID' version 'x.x'//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}//code codeName : 'OID' from codeSystemName display 'displayName'//concept conceptName : {codeName1, codeName2, etc} display 'displayName'//parameter parameterName (dataType or default value)codesystem "SNOMEDCT": 'http://snomed.info/sct'codesystem "HCPCS": 'https://hcpcs.codes/'codesystem "ICD9CM": 'https://www.cdc.gov/nchs/icd/icd9.htm'codesystem "RXNORM": 'https://www.nlm.nih.gov/research/umls/rxnorm/'

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
	if (exists([Procedure:"Anesthesia for transvenous pacemaker insertion (procedure)"])
	and (exists([Procedure:"Cardiac pacemaker procedure (procedure)"])
		or exists([Procedure:"Transthoracic cardiac pacing procedure (procedure)"])))
	then true
	else false
	

define "Coverage":
	"Covered"
