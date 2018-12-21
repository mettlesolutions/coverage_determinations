library DiagnosticPapSmears

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

valueset "Encounter Face to Face": '2.16.840.1.113762.1.4.1111.78'
valueset "Seen by physician (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Treatment completed (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Cancer treatment started (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Abnormal cervical smear (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Cancer Diagnosis":'2.16.840.1.113762.1.4.1116.366'
valueset "Malignant neoplasm of vagina":'2.16.840.1.113883.6.90'
valueset "Malignant neoplasm of cervix uteri, unspecified":'2.16.840.1.113883.6.90'
valueset "Malignant neoplasm of uterus, part unspecified":'2.16.840.1.113883.6.90'
valueset "Vaginal cervix (body structure)":'2.16.840.1.113883.3.88.12.3221.8.9'
valueset "Vaginal part (body structure)":'2.16.840.1.113883.3.88.12.3221.8.9'
valueset "Uterus part (body structure)":'2.16.840.1.113883.3.88.12.3221.8.9'
valueset "Ovarian part (body structure)":'2.16.840.1.113883.3.88.12.3221.8.9'
valueset "Entire uterine adnexa (body structure)":'2.16.840.1.113883.3.88.12.3221.8.9'
valueset "Abnormal finding on evaluation procedure (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Abnormal female reproductive function (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Complaint (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Associated symptom (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Referred by primary care physician (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Gynecological examination abnormal (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Examination of female genital tract under anesthetic and papanicolau smear (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Pap Test":'2.16.840.1.113883.3.464.1003.108.12.1017'

define "Condition1":
	(exists([Condition: "Malignant neoplasm of vagina"])
		or exists([Condition: "Malignant neoplasm of cervix uteri, unspecified"])
		or exists([Condition: "Malignant neoplasm of uterus, part unspecified"]))
	and (exists([Observation: "Cancer treatment started (situation)"])
		or exists([Observation: "Treatment completed (situation)"]))

define "Condition3":
	(exists("Vaginal cervix (body structure)")
		or exists("Vaginal part (body structure)")
		or exists("Uterus part (body structure)")
		or exists("Ovarian part (body structure)")
		or exists("Entire uterine adnexa (body structure)"))
	and exists([Observation: "Abnormal finding on evaluation procedure (finding)"])

define "Conditions":
	"Condition1"
	or exists([Observation: "Abnormal cervical smear (finding)"])
	or "Condition3"
	or (exists([Observation: "Complaint (finding)"])
		and exists([Observation: "Abnormal female reproductive function (finding)"]))
	or (exists([Observation: "Associated symptom (finding)"])
		and exists([Observation: "Gynecological examination abnormal (finding)"])
		and exists([Observation: "Referred by primary care physician (finding)"]))


define "Covered":
	if (exists([Observation: "Pap Test"])
	and (exists([ProcedureRequest: "Examination of female genital tract under anesthetic and papanicolau smear (procedure)"])
		and exists([Encounter: "Encounter Face to Face"])
		and exists([Encounter: "Seen by physician (finding)"])
		and "Conditions"))
	then true
	else false
	
define "Coverage":
	"Covered"
