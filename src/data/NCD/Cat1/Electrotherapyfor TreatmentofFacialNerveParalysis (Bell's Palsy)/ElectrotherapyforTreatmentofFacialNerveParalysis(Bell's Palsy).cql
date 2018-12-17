//Electrotherapy for Treatment of Facial Nerve Paralysis (Bell's Palsy)
library ElectrotherapyforTreatmentofFacialNerveParalysis

using FHIR

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)


codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'
valueset "Bell's palsy (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Electrotherapy (regime/therapy)":'2.16.840.1.113883.3.88.12.80.28'
context Patient

define "Not Covered":
		(exists (["Condition" :"Bell's palsy (disorder)"])
		and (exists (["Procedure" :"Electrotherapy (regime/therapy)"]))
		)
		
define "Coverage":
		not "Not Covered"
