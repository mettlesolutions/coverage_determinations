library AutogenousEpiduralBloodGraft version '1'

using FHIR

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": 'http://snomed.info/sct'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "ICD9CM": 'https://www.cdc.gov/nchs/icd/icd9.htm'
codesystem "RXNORM": 'https://www.nlm.nih.gov/research/umls/rxnorm/'

valueset "Anesthesia for procedure on spine (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Headache (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Myelogram (procedure)":'2.16.840.1.113883.3.88.12.80.28'

define "Procedures Performed":
	exists([Procedure: "Anesthesia for procedure on spine (procedure)"])
	or exists([Procedure: "Myelogram (procedure)"])

define "Covered":
	"Procedures Performed"
	and exists([Condition: "Headache (finding)"])
	
	
define "Coverage":
	"Covered"
