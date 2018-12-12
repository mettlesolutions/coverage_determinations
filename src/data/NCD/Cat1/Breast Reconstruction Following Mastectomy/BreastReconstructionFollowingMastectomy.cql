library BreastReconstructionFollowingMastectomy version '1'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Reconstruction of breast (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Cosmetic surgery (procedure)":'2.16.840.1.113883.3.88.12.80.28'

define "Not Covered":
	exists(["Procedure, Performed": "Reconstruction of breast (procedure)"])
	and exists(["Procedure, Performed": "Cosmetic surgery (procedure)"])

define "Coverage": 
	not "Not Covered"
