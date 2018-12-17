library CardiacOutputMonitoringbyThoracicElectricalBioimpedance

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

valueset "Dyspnea (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Shortness of breath":'2.16.840.1.113883.6.103'
valueset "Symptom started suddenly (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Disorder of cardiac function (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Disorder of lung (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'

valueset "Gathering of past medical history (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Interview, history AND/OR physical examination (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Medical assessment (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Unable to analyze information (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Attending physician (occupation)":'2.16.840.1.113762.1.4.1099.14'
valueset "Monitoring of cardiac output using thoracic impedance cardiography (regime/therapy)":'2.16.840.1.113883.3.88.12.80.28'
valueset "History and physical examination with evaluation and management of patient (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Patient management procedure (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Laboratory test not necessary (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Medication therapy unnecessary (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'

valueset "Atrioventricular sequential pacing (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Congestive heart failure (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Terminal illness (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Awaiting transplantation of organ (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Transplantation of heart (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Patient awaiting procedure (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Home (environment)":'2.16.840.1.113762.1.4.1096.130'
valueset "Preferred place of death discussed with patient (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Determination of outcome, death unavoidable (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'

valueset "Documentation procedure (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Myocardial biopsy (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Heart transplant failure and rejection (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Management of fluid therapy (procedure)":'2.16.840.1.113883.3.88.12.80.28'

valueset "Aortic valve regurgitation (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Disease suspected (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Disease, alleged but not proven (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Mandatory minute volume ventilation (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Coronary artery bypass grafting (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Minute ventilation (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Procedure started (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hypertension":'2.16.840.1.113762.1.4.1032.9'
valueset "Management procedure (procedure)":'2.16.840.1.113883.3.88.12.80.28'

define "Condition1":
	exists([Condition: "Dyspnea (finding)"])
	and exists([Condition: "Shortness of breath"])
	and (exists([Procedure: "Interview, history AND/OR physical examination (procedure)"])
		and exists([Procedure: "Gathering of past medical history (procedure)"])
		and exists([Procedure: "Medical assessment (procedure)"])
		and exists([Observation: "Unable to analyze information (finding)"]))
	and (exists([Encounter: "Attending physician (occupation)"])
		and exists([ProcedureRequest: "Monitoring of cardiac output using thoracic impedance cardiography (regime/therapy)"])
		and not exists([Observation: "Medication therapy unnecessary (finding)"]))

define "Condition2":
	exists([Procedure: "Atrioventricular sequential pacing (procedure)"])
	and (exists([Procedure: "Interview, history AND/OR physical examination (procedure)"])
		and exists([Procedure: "Gathering of past medical history (procedure)"])
		and exists([Procedure: "Medical assessment (procedure)"])
		and exists([Observation: "Unable to analyze information (finding)"]))
	and (exists([Encounter: "Attending physician (occupation)"])
		and exists([ProcedureRequest: "Monitoring of cardiac output using thoracic impedance cardiography (regime/therapy)"])
		and not exists([Observation: "Medication therapy unnecessary (finding)"]))

define "Condition3":
	exists([Condition: "Congestive heart failure (disorder)"])
	and exists([Condition: "Terminal illness (finding)"])
	and (exists([Observation: "Awaiting transplantation of organ (situation)"])
		and exists([Procedure: "Transplantation of heart (procedure)"])
		and exists("Home (environment)")
		and exists([Observation: "Preferred place of death discussed with patient (situation)"])
		and exists([Observation: "Determination of outcome, death unavoidable (finding)"]))

define "Condition4":
	exists([Condition: "Heart transplant failure and rejection (disorder)"])
	and (not exists([Procedure: "Myocardial biopsy (procedure)"])
		or (if (exists([ProcedureRequest: "Myocardial biopsy (procedure)"])
				and exists([Procedure: "Monitoring of cardiac output using thoracic impedance cardiography (regime/therapy)"]))
			then ((not exists([Observation: "Medication therapy unnecessary (finding)"])
				and exists([ProcedureRequest: "Myocardial biopsy (procedure)"]))
				and exists([Procedure: "Documentation procedure (procedure)"]))
			else false))

define "Condition5":
	exists([Condition: "Congestive heart failure (disorder)"])
	and exists([Procedure: "Management of fluid therapy (procedure)"])
	and (exists([Procedure: "Interview, history AND/OR physical examination (procedure)"])
		and exists([Procedure: "Gathering of past medical history (procedure)"])
		and exists([Procedure: "Medical assessment (procedure)"])
		and exists([Observation: "Unable to analyze information (finding)"]))
	and (exists([Encounter: "Attending physician (occupation)"])
		and exists([ProcedureRequest: "Monitoring of cardiac output using thoracic impedance cardiography (regime/therapy)"])
		and not exists([Observation: "Medication therapy unnecessary (finding)"]))

define "Covered":
	if (exists([Procedure:"Monitoring of cardiac output using thoracic impedance cardiography (regime/therapy)"])
	and ("Condition1" or "Condition2" or "Condition3" or "Condition3" or "Condition4"))
	then true
	else false
	
define "Not Covered":
	(exists([Condition: "Aortic valve regurgitation (disorder)"])
	and (exists([Observation: "Disease suspected (situation)"])
		or not exists([Observation: "Disease, alleged but not proven (finding)"])))
	or exists([Procedure: "Mandatory minute volume ventilation (procedure)"])
	or (exists([Observation: "Procedure started (situation)"])
		and exists([Procedure: "Coronary artery bypass grafting (procedure)"]))
	or (exists([Condition: "Hypertension"])
		and exists([Procedure: "Management procedure (procedure)"]))
	
define "Coverage":
	"Covered" and not "Not Covered"
