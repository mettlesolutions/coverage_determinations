library Hemorheograph

using FHIR

include FHIRHelpers version '1.8' called FHIRHelpers

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

valueset "Peripheral vascular disease (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Preoperative procedure (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Postoperative procedure (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Evaluation of diagnostic study results (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Diagnostic procedure (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Disease suspected (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'


define "Covered":
	(exists([Condition: "Peripheral vascular disease (disorder)"])
		and exists([Observation: "Disease suspected (situation)"]))
	and (exists([Procedure: "Diagnostic procedure (procedure)"])
		and exists([Procedure: "Evaluation of diagnostic study results (procedure)"])
		and (exists([Procedure: "Preoperative procedure (procedure)"])
			or exists([Procedure: "Postoperative procedure (procedure)"])))
	
	
define "Coverage":
	"Covered"
