library ChlamydiaScreening_Common version '2'

using QDM version '5.3'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)


codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
valueset "Pulmonary rehabilitation (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Chronic respiratory failure (disorder)": '2.16.840.1.113883.3.666.5.2319'
valueset  "Bronchial hygiene (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Physiological monitoring regime (regime/therapy)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Patient education (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Disorder of dental prosthesis (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'

