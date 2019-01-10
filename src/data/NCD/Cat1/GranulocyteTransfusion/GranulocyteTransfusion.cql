library GranulocyteTransfusion

using FHIR

include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": 'http://snomed.info/sct'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "ICD9CM": 'https://www.cdc.gov/nchs/icd/icd9.htm'
codesystem "RXNORM": 'https://www.nlm.nih.gov/research/umls/rxnorm/'
codesystem "ICD10CM": '2.16.840.1.113883.6.90'
codesystem "NUCCPT":''

valueset "Transfusion of granulocytes (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Chronic benign granulocytopenia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Gram-negative sepsis, unspecified": '2.16.840.1.113883.17.4077.2.2044'
valueset "Febrile granulocytopenia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Antibiotic therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Failed attempted procedure (situation)": '2.16.840.1.113883.3.88.12.3221.7.4'

context Patient

define "Covered":
         ( exists ([Condition: "Chronic benign granulocytopenia (disorder)"]) and ( exists ([Condition: "Gram-negative sepsis, unspecified"]) ) )
          or if ( exists ([Condition: "Febrile granulocytopenia (disorder)"]) and ( exists ([Condition: "Gram-negative sepsis, unspecified"]) ) )
              then  (exists ([Procedure: "Antibiotic therapy (procedure)"]A
          where A.status="Failed attempted procedure (situation)") )
          else false
       
define "Coverage":
         "Covered" and ( exists ([Procedure: "Transfusion of granulocytes (procedure)"]) )
