//Pronouncement of Death
library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT": '2.16.840.1.113883.3.88.12.80.28'

valueset "Combined diagnostic and therapeutic (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Death pronouncement (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Physician (occupation)": '2.16.840.1.113762.1.4.1096.129'

context Patient

define "Coverage":
         ( exists (["Procedure, Performed": "Combined diagnostic and therapeutic (procedure)"] DT
           where DT.authorDatetime = "Physician (occupation)") ) and ( exists (["Procedure, Performed": "Death pronouncement (procedure)"]) )



