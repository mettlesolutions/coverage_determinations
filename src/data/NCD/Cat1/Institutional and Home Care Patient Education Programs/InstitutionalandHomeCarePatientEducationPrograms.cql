library InstitutionalandHomeCarePatientEducationPrograms

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

valueset "Education programs education, guidance and counseling (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Procedure needed (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Illness (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Treatment intent (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Sickness/injury care education, guidance, and counseling (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Prevention education (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Environments of Care":'2.16.840.1.113762.1.4.1096.130'

define "Covered":
	exists("Environments of Care")
	and exists([Procedure: "Education programs education, guidance and counseling (procedure)"])
	and exists([Procedure: "Sickness/injury care education, guidance, and counseling (procedure)"])
	and exists([Observation: "Procedure needed (situation)"])
	and (exists([Condition: "Illness (finding)"])
		and exists([Observation: "Treatment intent (situation)"]))
		
define "Not Covered":
	exists([Procedure: "Prevention education (procedure)"])

define "Coverage":
	"Covered" and not "Not Covered"
