library ConsultationswithaBeneficiarysFamilyandAssociates

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

valueset "Consulting with (procedure)":'2.16.840.1.113883.3.88.12.80.28'

valueset "Physician service (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Mental disorder (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Psychoneurotic personality disorder (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Personality disorder (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'

valueset "Family counseling (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Inpatient stay (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Patient's condition improved (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Finding of sense of purpose (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Purposeless (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Management procedure (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Patient counseling management (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Patient condition assessed (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Assisting with procedure (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Family counseled (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Procedure on family member (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'

define "Condition1":
	not exists([Encounter: "Inpatient stay (finding)"])
	and exists([Procedure: "Physician service (procedure)"])
	and (exists([Condition: "Mental disorder (disorder)"])
		or exists([Condition: "Psychoneurotic personality disorder (disorder)"])
		or exists([Condition: "Personality disorder (disorder)"]))

define "Family Counseling Conditions":
	if (exists([Procedure: "Family counseling (procedure)"])
		and exists([Observation: "Patient's condition improved (finding)"])
		and not exists([Observation: "Purposeless (finding)"]))
	then true
	else false

define "Management Conditions":
	if (exists([Procedure: "Family counseling (procedure)"])
		and exists([Procedure: "Management procedure (procedure)"])
		and exists([Observation: "Patient condition assessed (procedure)"]))
	then true
	else false

define "Covered":
	if (exists([Procedure: "Consulting with (procedure)"])
	and exists([Observation: "Procedure on family member (situation)"])
	and ("Condition1"
		or (if "Family Counseling Conditions" then true else false)
		or (if "Management Conditions" then true else false)))
	then true
	else false
	
define "Coverage":
	"Covered"
