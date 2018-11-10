//Sweat Test
library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)


valueset "Sweat test (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Cystic fibrosis (disorder)": '2.16.840.1.113883.3.464.1003.102.12.1002'
valueset "Peripheral vascular disease (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Sympathectomy (procedure)": '2.16.840.1.113883.3.88.12.80.28'

context Patient

define "Indications and Limitations":
          (exists (["Diagnosis": "Cystic fibrosis (disorder)"]) and  (exists (["Laboratory Test, Performed": "Sweat test (procedure)"])))
          
define "Not Covered":
       (exists (["Diagnosis": "Peripheral vascular disease (disorder)"]) and  (exists (["Procedure, Performed": "Sympathectomy (procedure)"]))
       and (exists (["Laboratory Test, Performed": "Sweat test (procedure)"]))
       )
       
define "Coverage":
        "Indications and Limitations" and not "Not Covered"
