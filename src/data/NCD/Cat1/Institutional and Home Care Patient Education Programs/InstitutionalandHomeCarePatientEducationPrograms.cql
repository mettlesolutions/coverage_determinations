library InstitutionalandHomeCarePatientEducationPrograms

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Education programs education, guidance and counseling (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Procedure needed (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Illness (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Treatment intent (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Sickness/injury care education, guidance, and counseling (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Prevention education (procedure)":'2.16.840.1.113883.3.88.12.80.28'

define "Covered":
	exists(["Procedure, Performed": "Sickness/injury care education, guidance, and counseling (procedure)"])
	and exists(["Assessment, Performed": "Procedure needed (situation)"])
	and (exists(["Diagnosis": "Illness (finding)"])
		and exists(["Assessment, Performed": "Treatment intent (situation)"]))
		
define "Not Covered":
	exists(["Procedure, Performed": "Prevention education (procedure)"])

define "Coverage":
	"Covered" and not "Not Covered"
