//Human Chorionic Gonadotropin

library HumanChorionicGonadotropin

using FHIR
include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
codesystem "ICD10CM": '2.16.840.1.113883.6.90'

valueset "Human chorionic gonadotropin measurement (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Germ cell tumor of ovary (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Germ cell tumor of testis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Malignant germ cell neoplasm of mediastinum (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Malignant neoplasm of retroperitoneum": '2.16.840.1.113883.3.526.2.1078'
valueset "Malignant neoplasm of brain, unspecified": '1.3.6.1.4.1.6997.4.1.2.234.999.4.2'
//Germ Cell Tumor Of Central Nervous System
valueset "Vaginal bleeding complicating early pregnancy (disorder)": '2.16.840.1.113883.3.464.1003.111.11.1023'
valueset "Fetal death (event)": '2.16.840.1.113762.1.4.1018.240'
valueset "Germ cell tumor (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hypertension": '2.16.840.1.113883.3.464.1003.104.11.1038'
//Qualitative hCG assays

context Patient

define "Problems":
        ( exists (["Condition": "Germ cell tumor of ovary (disorder)"])
          or ( exists (["Condition": "Germ cell tumor of testis (disorder)"]) )
          or ( exists (["Condition": "Malignant germ cell neoplasm of mediastinum (disorder)"]) )
          or ( exists (["Condition": "Malignant neoplasm of retroperitoneum"]) )
          or ( exists (["Condition": "Vaginal bleeding complicating early pregnancy (disorder)"]) )
           or ( exists (["Condition": "Hypertension"]) )
           or ( exists (["Condition": "Fetal death (event)"]) ) )

define "Condition 1(Indications)":
           "Problems" and ( exists (["Procedure": "Human chorionic gonadotropin measurement (procedure)"]) )
         
      
define "Indications":
          "Condition 1(Indications)"
          
define "Limitations":
           if "Problems"
            then ( exists (["Procedure": "Human chorionic gonadotropin measurement (procedure)"]H
            where duration in months of H.performed = 1 and Count(["Procedure": "Human chorionic gonadotropin measurement (procedure)"]) = 2) )
           else null
           
define "Coverage":
           "Indications" or "Limitations" 
           

            
           
