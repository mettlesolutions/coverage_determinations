//Phrenic Nerve Stimulator
library PhrenicNerveStimulator
using FHIR
include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT": '2.16.840.1.113883.3.88.12.80.28'

valueset "Implantation of electronic stimulator into phrenic nerve (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Respiratory insufficiency (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'

context Patient

define "Covered": 
        ( exists (["Condition": "Respiratory insufficiency (disorder)"]) 
         and ( exists (["Procedure": "Implantation of electronic stimulator into phrenic nerve (procedure)"]) ) )
         
define "Coverage":
		"Covered"
