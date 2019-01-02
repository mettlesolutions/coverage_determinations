library DisplacementCardiography

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

valueset "Electrocardiographic procedure (procedure)":'	2.16.840.1.113883.6.96'
valueset "Stress (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Disorder of coronary artery (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Atypical angina (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Typical angina (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Male":'2.16.840.1.113883.5.1'
valueset "Female":'2.16.840.1.113883.5.1'

context Patient

define "Conditions-Male":
	if (Patient.gender = 'male')
	then exists([Condition: "Atypical angina (disorder)"])
	else false

define "Conditions-Female":
	if (Patient.gender = 'female')
	then (exists([Condition: "Typical angina (disorder)"]) or exists([Condition: "Atypical angina (disorder)"]))
	else false

define "Covered":
	(exists([Procedure: "Electrocardiographic procedure (procedure)"])
	and exists([Observation: "Stress (finding)"])
	and exists([Condition: "Disorder of coronary artery (disorder)"]))
	and ("Conditions-Male" or "Conditions-Female")
	
define "Coverage": 
	"Covered"
