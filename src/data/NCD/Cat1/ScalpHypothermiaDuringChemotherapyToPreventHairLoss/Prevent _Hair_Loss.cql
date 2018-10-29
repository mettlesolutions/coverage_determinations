//Scalp Hypothermia During Chemotherapy to Prevent Hair Loss
library ChlamydiaScreening_Common version '2'

using QDM version '5.3'

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
         ( exists (["Device, Applied": "Application of ice collar, cap or bag (procedure)"])
          or ( exists (["Device, Applied": "Application of bandage (procedure)"]) )
          or ( exists (["Device, Applied": "Scalp cooling (procedure)"]) )
         ) 
          
define "Coverage":
          ( exists (["Procedure, Performed": "Chemotherapy (procedure)"]) ) and "Devices for Chemotherapy"



