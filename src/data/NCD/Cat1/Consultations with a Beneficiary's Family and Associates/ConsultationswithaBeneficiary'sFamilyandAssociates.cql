library ConsultationswithaBeneficiarysFamilyandAssociates

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Physician service (procedure)":'2.16.840.1.113883.6.96'
valueset "Mental disorder (disorder)":'2.16.840.1.113883.6.96'
valueset "Psychoneurotic personality disorder (disorder)":'2.16.840.1.113883.6.96'
valueset "Personality disorder (disorder)":'2.16.840.1.113883.6.96'

valueset "Family counseling (procedure)":'2.16.840.1.113883.6.96'
valueset "Inpatient stay (finding)":'2.16.840.1.113883.6.96'
valueset "Patient's condition improved (finding)":'2.16.840.1.113883.6.96'
valueset "Finding of sense of purpose (finding)":'2.16.840.1.113883.6.96'
valueset "Purposeless (finding)":'2.16.840.1.113883.6.96'
valueset "Management procedure (procedure)":'2.16.840.1.113883.6.96'
valueset "Patient counseling management (procedure)":'2.16.840.1.113883.6.96'
valueset "Patient condition assessed (procedure)":'2.16.840.1.113883.6.96'
valueset "Assisting with procedure (procedure)":'2.16.840.1.113883.6.96'
valueset "Family counseled (situation)":'2.16.840.1.113883.6.96'
valueset "Procedure on family member (situation)":'2.16.840.1.113883.6.96'

define "Condition1":
	not exists(["Encounter, Performed": "Inpatient stay (finding)"]) 
	exists(["Procedure, Performed": "Physician service (procedure)"]) 
	and (exists(["Diagnosis": "Mental disorder (disorder)"])
		or exists(["Diagnosis": "Psychoneurotic personality disorder (disorder)"])
		or exists(["Diagnosis": "Personality disorder (disorder)"]))
		
define "Family Counseling Conditions":
	if (exists(["Procedure, Performed": "Family counseling (procedure)"]) 
		and exists(["Assessment, Performed": "Patient's condition improved (finding)"])
		and not exists(["Assessment, Performed": "Purposeless (finding)"]))
	then true
	else false
	
define "Management Conditions":
	if (exists(["Procedure, Performed": "Family counseling (procedure)"]) 
		and exists(["Procedure, Performed": "Management procedure (procedure)"])
		and exists(["Assessment, Performed": "Patient condition assessed (procedure)"]))
	then true
	else false

define "Covered": 
	"Condition1"
	or (if "Family Counseling Conditions" then true else false)
	or (if "Management Conditions" then true else false)
	
define "Coverage":
	"Covered"
