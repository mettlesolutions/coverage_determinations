library BiofeedbackTherapyfortheTreatmentofUrinaryIncontinence version '1'

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

valueset "Genuine stress incontinence (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Urge incontinence of urine (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Impaired cognition (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Pelvic floor exercises (regime/therapy)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Absence of therapeutic response (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Home (environment)":'2.16.840.1.113762.1.4.1096.130'
valueset "Biofeedback procedure (regime/therapy)":'2.16.840.1.113883.3.88.12.80.28'


define "Not Covered":
	exists([Encounter: "Home (environment)"])


define "Covered":
	if (exists([Procedure: "Biofeedback procedure (regime/therapy)"])
	and (exists([Observation: "Genuine stress incontinence (finding)"])
		or exists([Observation: "Urge incontinence of urine (finding)"]) )
		and not exists([Observation: "Impaired cognition (finding)"])
		and (exists([Procedure: "Pelvic floor exercises (regime/therapy)"])
			and exists([Observation: "Absence of therapeutic response (finding)"])))
	then true
	else false
	
	
define "Coverage":
	"Covered" and not "Not Covered"
