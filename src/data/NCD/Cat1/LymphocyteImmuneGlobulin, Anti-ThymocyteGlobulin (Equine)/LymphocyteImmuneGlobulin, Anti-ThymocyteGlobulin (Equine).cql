//Lymphocyte Immune Globulin, Anti-Thymocyte Globulin (Equine)

library LymphocyteImmuneGlobulinAntiThymocyteGlobulinEquine

using FHIR

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'
valueset "Renal transplant rejection (disorder)	":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Lymphocyte Immune Globulin, Anti-Thymocyte Globulin" : '2.16.840.1.113762.1.4.1010.7'

context Patient

define "Covered":
		(exists (["Condition": "Renal transplant rejection (disorder)	"])
		and (exists (["MedicationAdministration" : "Lymphocyte Immune Globulin, Anti-Thymocyte Globulin"]))
		)
		
define "Coverage":
		"Covered"
