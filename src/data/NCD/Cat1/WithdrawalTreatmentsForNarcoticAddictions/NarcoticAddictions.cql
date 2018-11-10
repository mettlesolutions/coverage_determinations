//Withdrawal Treatments for Narcotic Addictions
//Withdrawal Treatments for Narcotic Addictions
library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT": '2.16.840.1.113883.3.88.12.80.28'
valueset "Monitoring drug withdrawal (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Physician service (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Narcotic drug user (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'

define "Coverage":
       (exists  (["Diagnosis": "Narcotic drug user (finding)"])
        or (exists  (["Diagnosis": "Physician service (procedure)"]) 
       and  (exists (["Procedure, Performed": "Monitoring drug withdrawal (regime/therapy)"])))
       )
