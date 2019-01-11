//InjectionSclerotherapyForEsophagealVaricealBleeding

library InjectionSclerotherapyForEsophagealVaricealBleeding

using FHIR

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'
valueset "Open injection sclerotherapy to esophageal varices (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Esophageal varices with bleeding": '2.16.840.1.113762.1.4.1179.5'

define "Covered":
          ( exists (["Condition": "Esophageal varices with bleeding"])
          and ( exists (["Procedure": "Open injection sclerotherapy to esophageal varices (procedure)"]) ) )
          
define "Coverage":
          "Covered"
