library ClosedLoopBloodGlucoseControlDevice

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

valueset "Insulin dependent diabetes mellitus type IA (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Management procedure (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Crisis (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Inpatient environment (environment)":'2.16.840.1.113762.1.4.1111.126'


define "Covered":
	exists([Condition: "Insulin dependent diabetes mellitus type IA (disorder)"])
	and exists([Procedure: "Management procedure (procedure)"])
	and exists([Observation: "Crisis (finding)"])
	and exists([Encounter: "Inpatient environment (environment)"])


define "Coverage": 
	"Covered"
