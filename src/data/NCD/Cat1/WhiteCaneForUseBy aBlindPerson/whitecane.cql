//White Cane For use by a blind person
library WhiteCaneForusebyablindperson
using FHIR
include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'

valueset "Provision of long cane (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Blindness": '2.16.840.1.113883.3.464.1003.115.11.1251'

context Patient

define "Coverage":
        ( exists (["Condition": "Blindness"]) and ( exists (["Procedure": "Provision of long cane (procedure)"]) ) )
