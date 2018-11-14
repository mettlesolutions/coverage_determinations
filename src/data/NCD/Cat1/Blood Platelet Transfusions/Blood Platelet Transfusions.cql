library BloodPlateletTransfusions version '1'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Blood disorder monitoring status (finding)":'2.16.840.1.113883.6.96'
valueset "Blood disorder - initial assessment (regime/therapy)":'2.16.840.1.113883.6.96'
valueset "Blood disorder - follow-up assessment (regime/therapy)":'2.16.840.1.113883.6.96'
valueset "Medication therapy unnecessary (finding)":'2.16.840.1.113883.6.96'

define "Covered":
	(exists(["Assessment, Performed": "Blood disorder - initial assessment (regime/therapy)"])
	or exists(["Assessment, Performed": "Blood disorder - follow-up assessment (regime/therapy)"]))
	and not exists(["Assessment, Performed": "Medication therapy unnecessary (finding)"])
	
	
define "Coverage":
	"Covered"
