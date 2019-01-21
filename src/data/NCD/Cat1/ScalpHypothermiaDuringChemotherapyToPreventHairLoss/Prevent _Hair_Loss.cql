//Scalp Hypothermia During Chemotherapy to Prevent Hair Loss
library ScalpHypothermiaDuringChemotherapytoPreventHairLoss

using FHIR version '1.8'
include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'


valueset "Scalp cooling (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Chemotherapy (procedure)": '2.16.840.1.113762.1.4.1047.451'
valueset "Application of ice collar, cap or bag (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Application of bandage (procedure)": '2.16.840.1.113883.3.88.12.80.28'

context Patient

define "Devices for Chemotherapy":
         ( exists (["Procedure": "Application of ice collar, cap or bag (procedure)"])
          or ( exists (["Procedure": "Application of bandage (procedure)"]) )
          or ( exists (["Procedure": "Scalp cooling (procedure)"]) )
         ) 
          
define "Coverage":
          ( exists (["Procedure": "Chemotherapy (procedure)"]) ) and "Devices for Chemotherapy"



