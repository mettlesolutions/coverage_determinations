//Laetrile and Related Substances
library LaetrileandRelatedSubstances

using FHIR

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Amygdalin (substance)" : '2.16.840.1.113762.1.4.1010.2'
valueset "Hospital admission (procedure)" : '2.16.840.1.113883.3.88.12.80.28'

context Patient

define "Not Covered":
		(exists (["Encounter":"Hospital admission (procedure)"])
		and (exists (["MedicationAdministration" : "Amygdalin (substance)"]))
		)
		
define "Coverage":
		not "Not Covered"
