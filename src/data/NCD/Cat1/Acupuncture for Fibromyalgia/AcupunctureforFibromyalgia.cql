library AcupunctureforFibromyalgia

using FHIR version '1.8'//include otherLibrary version 'x.x' called otherLibrary//codesystem codeSystemName : 'OID' version 'x.x'//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}//code codeName : 'OID' from codeSystemName display 'displayName'//concept conceptName : {codeName1, codeName2, etc} display 'displayName'//parameter parameterName (dataType or default value)codesystem "SNOMEDCT": 'http://snomed.info/sct'codesystem "HCPCS": 'https://hcpcs.codes/'codesystem "ICD9CM": 'https://www.cdc.gov/nchs/icd/icd9.htm'codesystem "RXNORM": 'https://www.nlm.nih.gov/research/umls/rxnorm/'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

context Patient

define "Coverage": 
	false
