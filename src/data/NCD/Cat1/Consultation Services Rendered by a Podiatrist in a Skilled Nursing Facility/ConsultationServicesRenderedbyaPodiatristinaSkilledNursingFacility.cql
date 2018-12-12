library ConsultationServicesRenderedbyaPodiatristinaSkilledNursingFacility

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Treatment given (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Acquired pes planus (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Congenital pes planus (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Dislocation or subluxation of foot (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Foot care (regime/therapy)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Routine procedure (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Physical examination procedure (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Disorder of foot (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Associated symptom (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Consultation (procedure)":'2.16.840.1.113883.3.88.12.80.28'

define "Condition1":
	exists(["Assessment, Performed": "Treatment given (situation)"])
		and (exists(["Diagnosis": "Acquired pes planus (disorder)"])
			or exists(["Diagnosis": "Congenital pes planus (disorder)"])
			or exists(["Diagnosis": "Dislocation or subluxation of foot (disorder)"]))

define "Condition2":
	if not exists(["Diagnosis": "Disorder of foot (disorder)"])
	then (exists(["Procedure, Performed": "Physical examination procedure (procedure)"]) 
		and exists(["Procedure, Performed": "Routine procedure (procedure)"]))
	else false

define "Not Covered":
	"Condition1"
	or exists(["Procedure, Performed": "Foot care (regime/therapy)"]) 
	or "Condition2"
	
define "Coverage": 
	not "Not Covered"
