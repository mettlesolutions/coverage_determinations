library DiagnosisandTreatmentofImpotence

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

valueset "Victim of abuse (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Suspected victim of adult abuse (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Copy of document requested (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Mental disorder (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Inpatient stay (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Impotence (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Procedure aiding diagnosis (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Treatment completed (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'

define "Abuse Conditions":
	if (exists([Observation: "Suspected victim of adult abuse (situation)"]))
	then exists([Observation: "Copy of document requested (situation)"])
	else false

define "Outpatient Conditions":
	if (exists([Condition: "Mental disorder (disorder)"])
		and not exists([Observation: "Inpatient stay (finding)"]))
	then true
	else false

define "Covered":
	if (exists([Condition: "Impotence (disorder)"])
		and exists([Observation: "Treatment completed (situation)"])
		and exists([Procedure: "Procedure aiding diagnosis (procedure)"])
		and ("Abuse Conditions"
			or (if exists([Condition: "Impotence (disorder)"]) then true else false)
			or "Outpatient Conditions"))
	then true
	else false
	
define "Coverage":
	"Covered"
