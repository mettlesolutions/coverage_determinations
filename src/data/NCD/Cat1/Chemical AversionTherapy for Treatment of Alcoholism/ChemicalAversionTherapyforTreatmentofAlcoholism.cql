library ChemicalAversionTherapyforTreatmentofAlcoholism

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

valueset "Aversion therapy - alcoholism (regime/therapy)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Medication therapy unnecessary (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Seen by physician (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Alcoholism (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Alcoholism counseling (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Patient referral for alcoholism rehabilitation (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Inpatient": '2.16.840.1.113883.3.666.5.307'
valueset "Inpatient care (regime/therapy)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Follow-up in outpatient clinic (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hospital admission, precertified by medical audit action (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Hospital admission (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Documentation procedure (procedure)":'2.16.840.1.113883.3.88.12.80.28'

define "Necessary":
	exists([Observation: "Seen by physician (finding)"])
	and not exists([Observation: "Medication therapy unnecessary (finding)"])
	and exists([Condition: "Alcoholism (disorder)"])

define "Inpatient Care":
	if (exists([Encounter: "Inpatient"]) and exists([Procedure: "Aversion therapy - alcoholism (regime/therapy)"]))
		then exists([Procedure: "Inpatient care (regime/therapy)"])
	else null

define "Outpatient Follow-up":
	if exists([Procedure: "Aversion therapy - alcoholism (regime/therapy)"])
		then exists([Observation: "Follow-up in outpatient clinic (finding)"])
	else null

define "Inpatient Admission":
	if exists([Procedure: "Hospital admission (procedure)"])
		then (exists([Procedure: "Hospital admission, precertified by medical audit action (procedure)"])
			and exists([Observation: "Seen by physician (finding)"]))
	else null

define "Covered":
	if (exists([Procedure:"Aversion therapy - alcoholism (regime/therapy)"])
	and "Necessary"
	and "Inpatient Care"
	and "Outpatient Follow-up"
	and "Inpatient Admission")
	then true
	else false
	
define "Coverage": 
	"Covered"
