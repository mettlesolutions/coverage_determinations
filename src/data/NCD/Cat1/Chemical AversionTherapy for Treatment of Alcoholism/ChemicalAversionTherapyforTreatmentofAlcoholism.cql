library ChemicalAversionTherapyforTreatmentofAlcoholism

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Medication therapy unnecessary (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Seen by physician (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Alcoholism (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Alcoholism counseling (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Aversion therapy - alcoholism (regime/therapy)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Patient referral for alcoholism rehabilitation (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Inpatient": '2.16.840.1.113883.3.666.5.307'
valueset "Inpatient care (regime/therapy)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Follow-up in outpatient clinic (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hospital admission, precertified by medical audit action (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Hospital admission (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Documentation procedure (procedure)":'2.16.840.1.113883.3.88.12.80.28'

define "Necessary":
	exists(["Assessment, Performed": "Seen by physician (finding)"]) 
	and not exists(["Assessment, Performed": "Medication therapy unnecessary (finding)"])
	and exists(["Diagnosis": "Alcoholism (disorder)"])

define "Inpatient Care":
	if (exists(["Encounter, Performed": "Inpatient"]) and exists(["Procedure, Performed": "Aversion therapy - alcoholism (regime/therapy)"]))
		then exists(["Procedure, Performed": "Inpatient care (regime/therapy)"])
	else null

define "Outpatient Follow-up":
	if exists(["Procedure, Performed": "Aversion therapy - alcoholism (regime/therapy)"])
		then exists(["Assessment, Performed": "Follow-up in outpatient clinic (finding)"])
	else null

define "Inpatient Admission":
	if exists(["Procedure, Performed": "Hospital admission (procedure)"])
		then (exists(["Procedure, Performed": "Hospital admission, precertified by medical audit action (procedure)"])
			and exists(["Assessment, Performed": "Seen by physician (finding)"]))
	else null

define "Covered":
	"Necessary" 
	and "Inpatient Care"
	and "Outpatient Follow-up"
	and "Inpatient Admission"
	
define "Coverage": 
	"Covered"
