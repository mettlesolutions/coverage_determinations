library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)


valueset "Pressure ulcer (disorder)": '2.16.840.1.113883.3.2066.2046'
valueset "Hydrotherapy (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Ultraviolet light therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//low intensity direct current
//valueset "Chronic wound care (regime/therapy)": '2.16.840.1.113883.3.666.5.719'
//valueset "balsam peru oil": '2.16.840.1.113762.1.4.1010.7'
valueset "Castor Oil / Peruvian balsam": '2.16.840.1.113762.1.4.1010.7'

