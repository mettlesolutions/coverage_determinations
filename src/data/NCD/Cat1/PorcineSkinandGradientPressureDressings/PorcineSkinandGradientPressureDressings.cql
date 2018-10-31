//PorcineSkinandGradientPressureDressings
library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT": '2.16.840.1.113883.3.88.12.80.28'

valueset "Guinea pig skin extract": '2.16.840.1.113762.1.4.1010.1'
valueset "Burn (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Homograft of skin (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Pressure ulcer (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
//Gradient pressure dressing
valueset "": ''

context Patient
 
define "Condition For Porcine Skin":
        ( exists (["Diagnosis": "Burn (disorder)"])
        or ( exists (["Diagnosis": "Pressure ulcer (disorder)"]) )
        or ( exists (["Procedure, Performed": "Homograft of skin (procedure)"]) )
        )
        
define "Porcine Skin Covered":
         "Condition For Porcine Skin" and ( exists (["Procedure, Performed": "Guinea pig skin extract"]) )
         
     
