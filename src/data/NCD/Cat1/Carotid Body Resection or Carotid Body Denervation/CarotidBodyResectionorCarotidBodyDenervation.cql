library CarotidBodyResectionOrCarotidBodyDenervation


using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Carotid body tumor (morphologic abnormality)":'2.16.840.1.113883.3.88.12.3221.8.9'
valueset "Excision of carotid body tumor (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Pulmonary sign AND/OR symptom (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Symptom relieving factors (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Symptom control (regime/therapy)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Free of symptoms (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Associated symptom (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Carotid sinus hypersensitivity (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Patient's condition deteriorating (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Absence of therapeutic response (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Denervation of carotid body (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Incision of carotid body (procedure)":'2.16.840.1.113883.3.88.12.80.28'


define "Resection Not Covered":
	exists(["Assessment, Performed": "Pulmonary sign AND/OR symptom (finding)"])
	and exists(["Assessment, Performed": "Symptom relieving factors (finding)"])


define "Resection Covered":
	exists(["Diagnosis": "Carotid body tumor (morphologic abnormality)"])
	and (exists(["Assessment, Performed": "Free of symptoms (situation)"])
		or exists(["Assessment, Performed": "Associated symptom (finding)"]))


define "Denervation Covered":
	exists(["Diagnosis": "Carotid sinus hypersensitivity (disorder)"])
	and exists(["Assessment, Performed": "Absence of therapeutic response (finding)"])
	and exists(["Assessment, Performed": "Patient's condition deteriorating (finding)"])

define "Resection Coverage":
	if ("Resection Covered" and not "Resection Not Covered")
	then exists(["Procedure, Performed": "Incision of carotid body (procedure)"]) 
	else false

define "Denervation Coverage":
	if "Denervation Covered"
	then exists(["Procedure, Performed": "Denervation of carotid body (procedure)"]) 
	else false

define "Coverage":
	"Resection Coverage" or "Denervation Coverage"
