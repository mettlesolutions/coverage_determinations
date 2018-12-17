library AirFluidizedBed

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


valueset "Pressure ulcer (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Pressure ulcer stage 3 (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Pressure ulcer stage 4 (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Bed-ridden (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Confined to chair (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Institutionalized (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'

valueset "Attending physician (occupation)":'2.16.840.1.113762.1.4.1099.14'
valueset "assessment of a patient":'2.16.840.1.113762.1.4.1182.80'
valueset "Comprehensive interview and evaluation (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Conservative therapy (regime/therapy)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Treatment completed (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Wound, non-healed (morphologic abnormality)":'2.16.840.1.113883.3.88.12.3221.8.9'
valueset "Wound care assessment (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "month":'2.16.840.1.113883.1.11.12839'
valueset "Indication for procedure (observable entity)":'2.16.840.1.113883.17.4077.2.2007'
valueset "Inpatient stay (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Documentation of medication related action plan (procedure)":'2.16.840.1.113883.3.88.12.80.28'

valueset "Debridement of wound of skin (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Dressing of wound (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Caregiver support (regime/therapy)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Assisting with activity of daily living (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Fluid balance regulation (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Dry skin (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Repositioning (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Altered mental status (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Management procedure (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Dietary needs education (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Prescribed medication education (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Prescription (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Medical equipment or device education (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Absence of therapeutic response (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Home (environment)":'2.16.840.1.113762.1.4.1096.130'
valueset "Seen by physician (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'

valueset "Assisting to stand for pressure area relief (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Pressure point of skin over bony prominence (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Pressure ulcer care (regime/therapy)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Pressure ulcer (morphologic abnormality)":'2.16.840.1.113883.3.88.12.3221.8.9'
valueset "Healing ulcer (morphologic abnormality)":'2.16.840.1.113883.3.88.12.3221.8.9'
valueset "Pressure ulcer prevention (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Wound care (regime/therapy)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Wound Infection (SNOMED)":'2.16.840.1.113762.1.4.1146.711'
valueset "Nutrition management (regime/therapy)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Debridement (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Eschar of wound bed (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Impaired tissue repair (morphologic abnormality)":'2.16.840.1.113883.3.88.12.3221.8.9'
valueset "Granulation tissue (morphologic abnormality)":'2.16.840.1.113883.3.88.12.3221.8.9'

valueset "Chronic obstructive lung disease (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Soak (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Caregiver difficulty performing caretaking (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Supporting Structures":'2.16.840.1.113883.6.13'
valueset "Equipment maintenance status (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'


define "Conservative Treatment":
	([Procedure: "Repositioning (procedure)"]
		union [Procedure: "Assisting to stand for pressure area relief (procedure)"]
		union [Observation: "Pressure point of skin over bony prominence (finding)"])
	union ([Procedure:"Pressure ulcer care (regime/therapy)"]
		union [Condition:"Healing ulcer (morphologic abnormality)"]
		union [Procedure:"Pressure ulcer prevention (procedure)"])
	union ([Condition:"Wound Infection (SNOMED)"]
		union [Procedure:"Wound care (regime/therapy)"])
	union ([Condition:"Wound Infection (SNOMED)"]
		union [Procedure:"Nutrition management (regime/therapy)"])
	union ([Condition:"Debridement (procedure)"]
		union [Condition:"Impaired tissue repair (morphologic abnormality)"]
		union [Observation: "Eschar of wound bed (finding)"])

define "Eval Condition":
	if (exists([Procedure:"Conservative Treatment"]) and not exists([Observation: "Absence of therapeutic response (finding)"]) 
		and exists([Observation: "Wound, non-healed (morphologic abnormality)"])) 
		then (exists([Encounter: "Attending physician (occupation)"])
			and exists([Observation: "assessment of a patient"])
			and exists([Procedure:"Prescription (procedure)"])
			and exists([Procedure:"Comprehensive interview and evaluation (procedure)"])
			and exists([Observation: "Indication for procedure (observable entity)"])
			and exists([Procedure:"Documentation of medication related action plan (procedure)"])
			and exists([Observation: "Inpatient stay (finding)"]))
		else false

define "Debridement condition":
	exists(exists([Procedure:"Debridement of wound of skin (procedure)"])
	and exists([Procedure:"Dressing of wound (procedure)"])) during [Procedure:"Conservative Treatment"]

define "Caregiver":
	exists([Procedure: "Caregiver support (regime/therapy)"])
	and exists([Procedure:"Assisting with activity of daily living (procedure)"])
	and exists([Procedure:"Fluid balance regulation (procedure)"])
	and exists([Condition: "Dry skin (finding)"])
	and exists([Procedure:"Repositioning (procedure)"])
	and (exists([Observation: "Altered mental status (finding)"]) and exists([Procedure:"Management procedure (procedure)"]))
	and exists([Procedure:"Dietary needs education (procedure)"])
	and exists([Procedure:"Prescribed medication education (procedure)"])	

define "Covered":
	((exists([Condition:"Pressure ulcer stage 3 (disorder)"])
		or exists([Condition:"Pressure ulcer stage 4 (disorder)"]))
	or (exists([Observation: "Bed-ridden (finding)"])
		or exists([Observation: "Confined to chair (finding)"]))
	or (if "Not Covered" then exists([Observation: "Institutionalized (finding)"]) else false)
	or "Eval Condition"
	or "Debridement condition")
	and "Caregiver"
	and (exists([Encounter: "Seen by physician (finding)"]) and exists([Encounter: "Home (environment)"]))		

	
define "Not Covered":
	if ((exists([Condition:"Pressure ulcer (disorder)"]) and exists([Condition:"Chronic obstructive lung disease (disorder)"]))
		and exists([Observation: "Caregiver difficulty performing caretaking (finding)"])) 
	then not exists([Encounter: "Home (environment)"]) 
	else false

define "Coverage":
	"Covered" and not "Not Covered"
