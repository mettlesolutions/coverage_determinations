library BiofeedbackTherapy version '1'

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

valueset "Muscular re-education (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Biofeedback procedure (regime/therapy)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Abnormal muscle function (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Spasticity (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Muscle spasm":'2.16.840.1.113883.6.90'
valueset "Weakness present (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Muscle tension (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Psychosomatic rheumatism (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'


define "Not Covered":
	exists([Observation: "Muscle tension (finding)"])
	or exists([Condition: "Psychosomatic rheumatism (disorder)"])


define "Covered":
	if (exists([Procedure: "Biofeedback procedure (regime/therapy)"])
	and (exists([Procedure: "Muscular re-education (procedure)"])
		or (exists([Observation: "Abnormal muscle function (finding)"])
			and (exists([Condition: "Spasticity (finding)"])
				or exists([Condition: "Muscle spasm"])
				or exists([Condition: "Weakness present (finding)"])))))
	then true
	else false
	
define "Coverage":
	"Covered" and not "Not Covered"
