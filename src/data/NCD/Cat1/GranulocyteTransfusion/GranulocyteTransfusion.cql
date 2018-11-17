//GranulocyteTransfusion
library ChlamydiaScreening_Common version '2'

using QDM version '5.3'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
codesystem "ICD10CM": '2.16.840.1.113883.6.90'

valueset "Transfusion of granulocytes (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Chronic benign granulocytopenia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Gram-negative sepsis, unspecified": '2.16.840.1.113883.17.4077.2.2044'
valueset "Febrile granulocytopenia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Antibiotic therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Failed attempted procedure (situation)": '2.16.840.1.113883.3.88.12.3221.7.4'

context Patient

define "Covered":
         ( exists (["Diagnosis": "Chronic benign granulocytopenia (disorder)"]) and ( exists (["Diagnosis": "Gram-negative sepsis, unspecified"]) ) )
          or if ( exists (["Diagnosis": "Febrile granulocytopenia (disorder)"]) and ( exists (["Diagnosis": "Gram-negative sepsis, unspecified"]) ) )
              then  (exists (["Procedure, Performed": "Antibiotic therapy (procedure)"]A
          where A.status="Failed attempted procedure (situation)") )
          else null
       
define "Coverage":
         "Covered" and ( exists (["Procedure, Performed": "Transfusion of granulocytes (procedure)"]) )
