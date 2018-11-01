//Vagus Nerve Stimulation (VNS)
library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT": '2.16.840.1.113883.3.88.12.80.28'

valueset "Insertion of vagal nerve stimulator (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Partial seizure (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Surgery care (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Depressive disorder (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Failed moderate sedation during procedure, initial encounter": '2.16.840.1.113883.3.3157.1411'

context Patient

define "Condition (Covered)":
           ( exists (["Diagnosis": "Partial seizure (disorder)"]) and ( exists (["Procedure, Not Recommended": "Surgery care (regime/therapy)"]) ) )
           or ( exists (["Diagnosis": "Partial seizure (disorder)"]) and ( exists (["Procedure, Performed": "Failed moderate sedation during procedure, initial encounter"]) )
           )
           
define "Covered":
         "Condition (Covered)" and ( exists (["Procedure, Performed": "Insertion of vagal nerve stimulator (procedure)"]) )   
         
define "Not Covered":
         ["Diagnosis": "Depressive disorder (disorder)"]
         
define "Coverage":
         "Covered"
          
