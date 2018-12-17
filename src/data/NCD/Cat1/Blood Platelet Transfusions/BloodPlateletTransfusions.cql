library BloodPlateletTransfusions version '1'

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

valueset "Blood disorder monitoring status (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Blood disorder - initial assessment (regime/therapy)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Blood disorder - follow-up assessment (regime/therapy)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Medication therapy unnecessary (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Platelet transfusion (procedure)":'2.16.840.1.113883.3.88.12.80.28'

define "Covered":
	if (exists([Procedure: "Platelet transfusion (procedure)"])
	and ((exists([Procedure: "Blood disorder - initial assessment (regime/therapy)"])
		or exists([Procedure: "Blood disorder - follow-up assessment (regime/therapy)"]))
		and not exists([Observation: "Medication therapy unnecessary (finding)"])))
	then true
	else false
	
	
define "Coverage":
	"Covered"
