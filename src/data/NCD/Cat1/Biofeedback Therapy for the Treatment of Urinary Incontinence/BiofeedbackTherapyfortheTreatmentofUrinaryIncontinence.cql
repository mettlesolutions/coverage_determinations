library BiofeedbackTherapyfortheTreatmentofUrinaryIncontinence version '1'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Genuine stress incontinence (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Urge incontinence of urine (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Impaired cognition (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Pelvic floor exercises (regime/therapy)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Absence of therapeutic response (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Home (environment)":'2.16.840.1.113762.1.4.1096.130'


define "Not Covered":
	exists(["Encounter, Performed": "Home (environment)"])
	
		
define "Covered":
	(exists(["Assessment, Performed": "Genuine stress incontinence (finding)"])
	or exists(["Assessment, Performed": "Urge incontinence of urine (finding)"]) )
	and not exists(["Assessment, Performed": "Impaired cognition (finding)"])
	and (exists(["Procedure, Performed": "Pelvic floor exercises (regime/therapy)"])
		and exists(["Assessment, Performed": "Absence of therapeutic response (finding)"]))
	
	
define "Coverage":
	"Covered" and not "Not Covered"
