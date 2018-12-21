library CounselingtoPreventTobaccoUse


using FHIR version '1.8'//include otherLibrary version 'x.x' called otherLibrary//codesystem codeSystemName : 'OID' version 'x.x'//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}//code codeName : 'OID' from codeSystemName display 'displayName'//concept conceptName : {codeName1, codeName2, etc} display 'displayName'//parameter parameterName (dataType or default value)codesystem "SNOMEDCT": 'http://snomed.info/sct'codesystem "HCPCS": 'https://hcpcs.codes/'codesystem "ICD9CM": 'https://www.cdc.gov/nchs/icd/icd9.htm'codesystem "RXNORM": 'https://www.nlm.nih.gov/research/umls/rxnorm/'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Tobacco user (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Tobacco use disorder":'2.16.840.1.113883.6.103'
valueset "Associated symptom (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Mentally alert (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Counseling about tobacco use (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Procedure started (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Smoking cessation therapy (regime/therapy)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Smoking and tobacco use cessation counseling visit; intermediate, greater than 3 minutes up to 10 minutes":'2.16.840.1.113883.6.12'
valueset "Smoking and tobacco use cessation counseling visit; intensive, greater than 10 minutes":'2.16.840.1.113883.6.12'
valueset "Inpatient stay (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'


define "Not Covered":
	if (exists([Observation: "Inpatient stay (finding)"])
		and exists([Condition: "Tobacco use disorder"]))
	then true
	else false

define "Condition1":
	exists([Observation: "Tobacco user (finding)"])
	and (exists([Condition: "Tobacco use disorder"])
		and exists([Observation: "Associated symptom (finding)"]))
		
define "Condition2":
	exists([Observation: "Mentally alert (finding)"])
	and exists([Procedure: "Counseling about tobacco use (procedure)"])
		
define "Covered":
	if ("Condition1" and "Condition2") 
	then (exists([Encounter: "Smoking and tobacco use cessation counseling visit; intermediate, greater than 3 minutes up to 10 minutes"])
		or exists([Encounter: "Smoking and tobacco use cessation counseling visit; intensive, greater than 10 minutes"]))
	else false
	
define "Coverage":
	"Covered" and not "Not Covered"
