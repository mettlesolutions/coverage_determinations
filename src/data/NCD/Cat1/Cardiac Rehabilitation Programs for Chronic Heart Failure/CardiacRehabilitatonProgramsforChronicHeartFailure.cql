library CardiacRehabilitationProgramsforChronicHeartFailure version '1'

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

valueset "Cardiac rehabilitation (regime/therapy)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Chronic heart failure (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Left ventricular Ejection fraction":'2.16.840.1.113883.6.1'
valueset "New York Heart Association Classification - Class II (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "New York Heart Association Classification - Class III (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "New York Heart Association Classification - Class IV (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Associated symptom (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Cardiovascular therapy (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Acute myocardial infarction (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Coronary artery bypass grafting (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Stable angina (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Repair of heart valve (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Heart valve replacement (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Percutaneous transluminal coronary angioplasty (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Transplantation of heart (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Allotransplant of heart and lung (procedure)":'2.16.840.1.113883.3.88.12.80.28'

parameter "Measurement Period" Interval<DateTime>

define "Stable Patients":
	[Procedure: "Cardiovascular therapy (procedure)"]CV
	where duration in weeks of CV.performed <= 6 or duration in months of CV.performed <= 6

define "Conditions":
	exists([Condition: "Acute myocardial infarction (disorder)"])
	or exists([Procedure: "Coronary artery bypass grafting (procedure)"])
	or exists([Condition: "Stable angina (disorder)"])
	or exists([Procedure: "Heart valve replacement (procedure)"])
	or exists([Procedure: "Repair of heart valve (procedure)"])
	or exists([Procedure: "Percutaneous transluminal coronary angioplasty (procedure)"])
	or exists([Procedure: "Transplantation of heart (procedure)"])
	or exists([Procedure: "Allotransplant of heart and lung (procedure)"])

define "Covered":
	if (exists([Procedure:"Cardiac rehabilitation (regime/therapy)"])
	and ((exists("Stable Patients")
		and exists([Condition: "Chronic heart failure (disorder)"])
		and exists([Observation: "Left ventricular Ejection fraction"]L where L.value <= 35 '%')
		and ((exists([Observation: "New York Heart Association Classification - Class II (finding)"])
			or exists([Observation: "New York Heart Association Classification - Class III (finding)"])
			or exists([Observation: "New York Heart Association Classification - Class IV (finding)"]))
			and exists([Observation: "Associated symptom (finding)"]))))
		and "Conditions")
	then true
	else false

define "Coverage":
	"Covered"
