library ChlamydiaScreening_Common version '2'

using QDM version '5.3'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
valueset "Transplantation of liver (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Congenital biliary atresia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "End Stage Liver Disease": '2.16.840.1.113883.17.4077.2.1002'
valueset "Viremia (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Pediatric emergency hospital admission (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//extrahepatic biliary atresia
