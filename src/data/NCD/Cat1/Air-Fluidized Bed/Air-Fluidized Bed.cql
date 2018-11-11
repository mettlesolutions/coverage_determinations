library AirFluidizedBed version '1'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Pressure ulcer (disorder)":'2.16.840.1.113883.6.96'
valueset "Pressure ulcer stage 3 (disorder)":'2.16.840.1.113883.6.96'
valueset "Pressure ulcer stage 4 (disorder)":'2.16.840.1.113883.6.96'
valueset "Bed-ridden (finding)":'2.16.840.1.113883.6.96'
valueset "Confined to chair (finding)":'2.16.840.1.113883.6.96'
valueset "Institutionalized (finding)":'2.16.840.1.113883.6.96'

valueset "Attending physician (occupation)":'2.16.840.1.113883.6.96'
valueset "assessment of a patient":'2.16.840.1.113883.6.13'
valueset "Comprehensive interview and evaluation (procedure)":'2.16.840.1.113883.6.96'
valueset "Conservative therapy (regime/therapy)":'2.16.840.1.113883.6.96'
valueset "Treatment completed (situation)":'2.16.840.1.113883.6.96'
valueset "Wound, non-healed (morphologic abnormality)":'2.16.840.1.113883.6.96'
valueset "Wound care assessment (procedure)":'2.16.840.1.113883.6.96'
valueset "month":'1.3.6.1.4.1.12009.10.3.1'
valueset "Indication for procedure (observable entity)":'2.16.840.1.113883.6.96'
valueset "Inpatient stay (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Documentation of medication related action plan (procedure)":'2.16.840.1.113883.6.96'

valueset "Debridement of wound of skin (procedure)":'2.16.840.1.113883.6.96'
valueset "Dressing of wound (procedure)":'2.16.840.1.113883.6.96'
valueset "Caregiver support (regime/therapy)":'2.16.840.1.113883.6.96'
valueset "Assisting with activity of daily living (procedure)":'2.16.840.1.113883.6.96'
valueset "Fluid balance regulation (procedure)":'2.16.840.1.113883.6.96'
valueset "Dry skin (finding)":'2.16.840.1.113883.6.96'
valueset "Repositioning (procedure)":'2.16.840.1.113883.6.96'
valueset "Altered mental status (finding)":'2.16.840.1.113883.6.96'
valueset "Management procedure (procedure)":'2.16.840.1.113883.6.96'
valueset "Dietary needs education (procedure)":'2.16.840.1.113883.6.96'
valueset "Prescribed medication education (procedure)":'2.16.840.1.113883.6.96'
valueset "Prescription (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Medical equipment or device education (procedure)":'2.16.840.1.113883.6.96'
valueset "Absence of therapeutic response (finding)":'2.16.840.1.113883.6.96'
valueset "Home (environment)":'2.16.840.1.113883.6.96'
valueset "Seen by physician (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'

valueset "Assisting to stand for pressure area relief (procedure)":'2.16.840.1.113883.6.96'
valueset "Pressure point of skin over bony prominence (finding)":'2.16.840.1.113883.6.96'
valueset "Pressure ulcer care (regime/therapy)":'2.16.840.1.113883.6.96'
valueset "Pressure ulcer (morphologic abnormality)":'2.16.840.1.113883.6.96'
valueset "Healing ulcer (morphologic abnormality)":'2.16.840.1.113883.6.96'
valueset "Pressure ulcer prevention (procedure)":'2.16.840.1.113883.6.96'
valueset "Wound care (regime/therapy)":'2.16.840.1.113883.6.96'
valueset "Wound Infection (SNOMED)":'2.16.840.1.113762.1.4.1146.711'
valueset "Nutrition management (regime/therapy)":'2.16.840.1.113883.6.96'
valueset "Debridement (procedure)":'2.16.840.1.113883.6.96'
valueset "Eschar of wound bed (finding)":'2.16.840.1.113883.6.96'
valueset "Impaired tissue repair (morphologic abnormality)":'2.16.840.1.113883.6.96'
valueset "Granulation tissue (morphologic abnormality)":'2.16.840.1.113883.6.96'

valueset "Chronic obstructive lung disease (disorder)":'2.16.840.1.113883.6.96'
valueset "Soak (procedure)":'2.16.840.1.113883.6.96'
valueset "Caregiver difficulty performing caretaking (finding)":'2.16.840.1.113883.6.96'
valueset "Supporting Structures":'2.16.840.1.113883.6.13'
valueset "Equipment maintenance status (finding)":'2.16.840.1.113883.6.96'


define "Conservative Treatment":
	(["Procedure, Performed": "Repositioning (procedure)"]
		union ["Procedure, Performed": "Assisting to stand for pressure area relief (procedure)"]
		union ["Assessment, Performed": "Pressure point of skin over bony prominence (finding)"])
	union (["Procedure, Performed":"Pressure ulcer care (regime/therapy)"]
		union ["Diagnosis":"Healing ulcer (morphologic abnormality)"]
		union ["Procedure, Performed":"Pressure ulcer prevention (procedure)"])
	union (["Diagnosis":"Wound Infection (SNOMED)"]
		union ["Procedure, Performed":"Wound care (regime/therapy)"])
	union (["Diagnosis":"Wound Infection (SNOMED)"]
		union ["Procedure, Performed":"Nutrition management (regime/therapy)"])
	union (["Diagnosis":"Debridement (procedure)"]
		union ["Diagnosis":"Impaired tissue repair (morphologic abnormality)"]
		union ["Assessment, Performed": "Eschar of wound bed (finding)"])

define "Eval Condition":
	if (exists(["Procedure, Performed":"Conservative Treatment"]) and not exists(["Assessment, Performed": "Absence of therapeutic response (finding)"]) 
		and exists(["Assessment, Performed": "Wound, non-healed (morphologic abnormality)"])) 
		then (exists(["Encounter, Performed": "Attending physician (occupation)"])
			and exists(["Assessment, Performed": "assessment of a patient"])
			and exists(["Procedure, Performed":"Prescription (procedure)"])
			and exists(["Procedure, Performed":"Comprehensive interview and evaluation (procedure)"])
			and exists(["Assessment, Performed": "Indication for procedure (observable entity)"])
			and exists(["Procedure, Performed":"Documentation of medication related action plan (procedure)"])
			and exists(["Assessment, Performed": "Inpatient stay (finding)"]))
		else false

define "Debridement condition":
	exists(exists(["Procedure, Performed":"Debridement of wound of skin (procedure)"])
	and exists(["Procedure, Performed":"Dressing of wound (procedure)"])) during ["Procedure, Performed":"Conservative Treatment"]

define "Caregiver":
	exists(["Procedure, Performed": "Caregiver support (regime/therapy)"])
	and exists(["Procedure, Performed":"Assisting with activity of daily living (procedure)"])
	and exists(["Procedure, Performed":"Fluid balance regulation (procedure)"])
	and exists(["Assessment, Performed": "Dry skin (finding)"])
	and exists(["Procedure, Performed":"Repositioning (procedure)"])
	and (exists(["Assessment, Performed": "Altered mental status (finding)"]) and exists(["Procedure, Performed":"Management procedure (procedure)"]))
	and exists(["Procedure, Performed":"Dietary needs education (procedure)"])
	and exists(["Procedure, Performed":"Prescribed medication education (procedure)"])	

define "Covered":
	((exists(["Diagnosis":"Pressure ulcer stage 3 (disorder)"])
		or exists(["Diagnosis":"Pressure ulcer stage 4 (disorder)"]))
	or (exists(["Assessment, Performed": "Bed-ridden (finding)"])
		or exists(["Assessment, Performed": "Confined to chair (finding)"]))
	or (if exists("Not Covered") then exists(["Assessment, Performed": "Institutionalized (finding)"]) else false)
	or "Eval Condition"
	or exists("Debridement condition"))
	and "Caregiver"
	and (exists(["Encounter, Performed": "Seen by physician (finding)"]) and exists(["Encounter, Performed": "Home (environment)"]))		

	
define "Not Covered":
	if ((exists(["Diagnosis":"Pressure ulcer (disorder)"]) and exists(["Diagnosis":"Chronic obstructive lung disease (disorder)"]))
		and exists(["Assessment, Performed": "Caregiver difficulty performing caretaking (finding)"])) 
	then not exists(["Encounter, Performed": "Home (environment)"]) 
	else false

define "Coverage":
	"Covered" and not "Not Covered"
