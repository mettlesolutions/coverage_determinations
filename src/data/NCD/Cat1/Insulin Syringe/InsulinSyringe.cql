library InsulinSyringe

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

valueset "Supervision while performing activity (regime/therapy)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Physician service (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Physician (occupation)":'2.16.840.1.113762.1.4.1099.14'
valueset "Emergent Situation":'2.16.840.1.113762.1.4.1116.496'
valueset "Diabetes mellitus (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Seen by physician (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Diabetes Medical Supplies (insulin syringes only)":'2.16.840.1.113762.1.4.1053.8'

define "Procedure":
	exists([Observation: "Seen by physician (finding)"])
	or (exists([Encounter: "Physician (occupation)"])
		and exists([Procedure: "Supervision while performing activity (regime/therapy)"]))


define "Covered":
	exists([MedicationAdministration: "Diabetes Medical Supplies (insulin syringes only)"])
	and exists([Procedure: "Physician service (procedure)"])
	and "Procedure"
	and exists([Observation: "Emergent Situation"])

define "Not Covered":
	exists([Condition: "Emergent Situation"])
	
define "Coverage":
	"Covered" and not "Not Covered"
