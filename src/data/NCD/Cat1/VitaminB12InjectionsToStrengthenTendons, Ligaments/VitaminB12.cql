library ChlamydiaScreening_Common version '2'

using QDM version '5.3'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

//valueset "Vitamin B12 injections started (situation)": '2.16.840.1.113883.3.88.12.3221.7.4'
//valueset "Vitamin B12 injections stopped (situation)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Nonsurgical manipulation procedure (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Vitamin B12 injection education (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Disorder of tendon (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Lesion of ligaments of foot region (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
