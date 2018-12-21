library CryosurgeryofProstate

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

valueset "Radiation therapy procedure or service (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Clinical trial (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Absence of therapeutic response (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Tumor stage T2b (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Gleason score in Specimen Qualitative":'2.16.840.1.113883.6.1'
valueset "Prostate-Specific Antigen [Chemical/Ingredient]":'2.16.840.1.113883.3.26.1.5'
valueset "Cryosurgery (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Cryotherapy (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Prostate-specific antigen monitoring (regime/therapy)":'2.16.840.1.113883.3.88.12.80.28'
valueset "nanogram per millliiter":'2.16.840.1.113883.1.11.12839'

define "Conditions":
	exists([Condition: "Tumor stage T2b (finding)"])
	or exists([Observation: "Gleason score in Specimen Qualitative"]G where G.value<9)
	or exists([Procedure: "Prostate-specific antigen monitoring (regime/therapy)"]PSA where PSA.outcome = 8 'nanogram per millliiter')


define "Covered":
	if (exists([Procedure: "Cryotherapy (procedure)"])
		and (exists([Procedure: "Radiation therapy procedure or service (procedure)"])
			and exists([Observation: "Absence of therapeutic response (finding)"])
			and exists([Procedure: "Clinical trial (procedure)"]))
		and "Conditions")
	then true
	else false
	
define "Not Covered":
	exists([Observation: "Absence of therapeutic response (finding)"])
	and not exists([Procedure: "Cryosurgery (procedure)"])
	
define "Coverage":
	"Covered" and not "Not Covered"
