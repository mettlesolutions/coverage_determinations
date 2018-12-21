library DiagnosticEndocardialElectricalStimulation

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

valueset "Electrical operative cardiac stimulation (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Cardiac arrhythmia (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Symptom severe (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'

define "Covered":
	if exists([Procedure: "Electrical operative cardiac stimulation (procedure)"])
	and (exists([Condition: "Cardiac arrhythmia (disorder)"])
		and exists([Observation: "Symptom severe (finding)"]))
	then true
	else false

define "Coverage": 
	"Covered"
