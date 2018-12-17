library BariatricSurgeryforTreatmentofCoMorbidConditionsRelatedtoMorbidObesity version '1'

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

valueset "Body mass index [BMI]":'2.16.840.1.113883.6.103'
valueset "Co-morbid conditions (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Body mass index 30+ - obesity (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Obesity (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Absence of therapeutic response (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Laparoscopic adjustable gastric banding (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Laparoscopic sleeve gastrectomy (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Gastric stapling for obesity (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Stapling of stomach (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Intestinal bypass for morbid obesity (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Insertion of gastric balloon (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Bariatric operative procedure (procedure)":'2.16.840.1.113883.3.88.12.80.28'


define "Not Covered":
	exists([Procedure: "Laparoscopic adjustable gastric banding (procedure)"])
	or exists([Procedure: "Laparoscopic sleeve gastrectomy (procedure)"])
	or exists([Procedure: "Gastric stapling for obesity (procedure)"])
	or exists([Procedure: "Intestinal bypass for morbid obesity (procedure)"])
	or exists([Procedure: "Insertion of gastric balloon (procedure)"])


define "Covered":
	if (exists([Procedure: "Bariatric operative procedure (procedure)"])
	and (exists([Observation: "Body mass index [BMI]"]BMI where (BMI.value) >= 35 '%')
		and (exists([Observation: "Co-morbid conditions (finding)"])
			and exists([Condition: "Obesity (disorder)"]))
		and (exists([Observation: "Absence of therapeutic response (finding)"])
			and exists([Condition: "Obesity (disorder)"]))))
	then true
	else false
	
define "Coverage":
	"Covered" and not "Not Covered"
