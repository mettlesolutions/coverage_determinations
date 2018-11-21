library AutologousCellularImmunotherapyTreatment version '1'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Hormone refractory prostate cancer (disorder)":'2.16.840.1.113883.6.96'
valueset "Asymptomatic (finding)":'2.16.840.1.113883.6.96'
valueset "Patient's condition improved (finding)":'2.16.840.1.113883.6.96'

define "Condition":
	exists(["Assessment, Performed": "Patient's condition improved (finding)"])
	and (exists(["Diagnosis": "Hormone refractory prostate cancer (disorder)"])
	or (exists(["Assessment, Performed": "Asymptomatic (finding)"])
	and exists(["Diagnosis": "Hormone refractory prostate cancer (disorder)"])))


define "Covered":
	"Condition"
	
define "Coverage":
	"Covered"
