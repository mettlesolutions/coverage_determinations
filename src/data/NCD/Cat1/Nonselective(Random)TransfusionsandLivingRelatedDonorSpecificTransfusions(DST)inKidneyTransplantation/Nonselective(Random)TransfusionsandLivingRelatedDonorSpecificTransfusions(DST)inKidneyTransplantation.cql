//Nonselective(Random)TransfusionsandLivingRelatedDonorSpecificTransfusions(DST)inKidneyTransplantation
library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'
valueset "Blood Transfusion": '2.16.840.1.113762.1.4.1056.80'
valueset "Transplant of kidney (procedure)" : '2.16.840.1.113883.3.88.12.80.28'

context Patient

define "Covered":
		if
		   (exists["Procedure, Performed":"Blood Transfusion"]) then
		   ["Procedure, Performed": "Transplant of kidney (procedure)"]
		else
		  null
