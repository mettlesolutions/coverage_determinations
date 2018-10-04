library PosturalDrainageProceduresAndPulmonaryExercises

using QDM 
//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)


codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
codesystem "CPT": '2.16.840.1.113883.6.12'
codesystem "NUCCPT": '2.16.840.1.113883.6.101'

valueset "Postural drainage therapy (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Pulmonary rehabilitation (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Respiratory therapist (occupation)": '2.16.840.1.113762.1.4.1096.129'
valueset "Physical Therapy": '2.16.840.1.113883.3.464.1003.118.12.1039'
valueset "Respiratory therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Inpatient care (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Outpatient care management (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Nursing Home or Extended Care Facility": '2.16.840.1.113883.3.666.5.2202'
valueset "Respiratory, Developmental, Rehabilitative and Restorative Service Providers": '2.16.840.1.114222.4.11.1066'
valueset "Physical Therapist": '2.16.840.1.114222.4.11.1066'
valueset "Home Healthcare Services": '2.16.840.1.113883.3.464.1003.101.11.1080'
valueset "Under care of clinical nurse specialist (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Severe chronic obstructive pulmonary disease (disorder)": '2.16.840.1.113883.3.464.1003.102.11.1019'
valueset "Referral by respiratory physician (procedure)": '2.16.840.1.113883.3.88.12.80.28'


context Patient

define "Postural drainage":
	["Procedure, Recommended": "Postural drainage therapy (regime/therapy)"] union ["Procedure, Performed": "Under care of clinical nurse specialist (finding)"]

define "Severe pulmonary conditions":
	["Diagnosis": "Severe chronic obstructive pulmonary disease (disorder)"] union ["Procedure, Performed": "Postural drainage therapy (regime/therapy)"] union ["Procedure, Performed": "Respiratory therapist (occupation)"]
	or ["Diagnosis": "Severe chronic obstructive pulmonary disease (disorder)"] union ["Procedure, Performed": "Postural drainage therapy (regime/therapy)"] union ["Procedure, Performed": "Physical Therapist"]
	
define "Services covered":
	["Procedure, Performed": "Referral by respiratory physician (procedure)"] union ["Encounter, Performed": "Inpatient care (regime/therapy)"]
	or ["Procedure, Performed": "Referral by respiratory physician (procedure)"] union ["Encounter, Performed": "Nursing Home or Extended Care Facility"]
	or ["Procedure, Performed": "Referral by respiratory physician (procedure)"] union ["Encounter, Performed": "Home Healthcare Services"]
	or ["Procedure, Performed": "Referral by respiratory physician (procedure)"] union ["Encounter, Performed": "Outpatient care management (procedure)"] union ["Encounter, Performed": "Physical Therapy"]

define "Coverage":
	"Postural drainage" union "Severe pulmonary conditions" union "Services covered"
