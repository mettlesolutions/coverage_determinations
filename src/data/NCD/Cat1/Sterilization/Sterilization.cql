//Sterilization
library Sterilization
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
codesystem "LOINC": '2.16.840.1.113883.3.526.3.401'
codesystem "AdministrativeGender": '2.16.840.1.113883.5.1'

valueset "Sweat test (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Cystic fibrosis (disorder)": '2.16.840.1.113883.3.464.1003.102.12.1002'
valueset "Peripheral vascular disease (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Sympathectomy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Sterilization procedure done (situation)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Illness (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hysterectomy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Oophorectomy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Bilateral oophorectomy (procedure)": '2.16.840.1.113883.3.526.2.469'
valueset "Bilateral orchidectomy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Carcinoma of prostate (disorder)": '2.16.840.1.113883.3.464.1003.108.12.1011'
valueset "Tubal ligation done (situation)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Vasectomy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Multigravida (finding)": '2.16.840.1.113762.1.4.1018.240'
valueset "Diagnosis deferred (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Sterilization procedure (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Falling injury (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "General treatment (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "General health deterioration (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Female": '2.16.840.1.113883.3.560.100.2'

context Patient

define "Condition 1(Coverage)":
          ( exists (["Condition": "Illness (finding)"]) and ( exists (["Procedure": "Sterilization procedure (procedure)"]) )
          or ( exists(["Condition": "Falling injury (disorder)"]) ) and ( exists(["Procedure": "Sterilization procedure (procedure)"] ) )
         )
          
define "Condition for Condition 2(Coverage)":
          ( exists ["Condition": "Carcinoma of prostate (disorder)"] and (exists["Procedure": "Bilateral oophorectomy (procedure)"])
           or (exists (["Condition": "Carcinoma of prostate (disorder)"]) and(exists ["Procedure": "Bilateral orchidectomy (procedure)"]) )
           )
           
define "Condition 2(Coverage)":
            "Condition for Condition 2(Coverage)" and ( exists(["Procedure": "Sterilization procedure (procedure)"]) )
           
define "Covered":
        "Condition 1(Coverage)" or "Condition 2(Coverage)"
        
define "Condition 1(Not Covered)":
        ( exists (["Procedure": "Hysterectomy (procedure)"]) and ( exists (["Procedure": "Sterilization procedure (procedure)"]) )
         or ( exists (["Procedure": "Tubal ligation done (situation)"]) ) and ( exists (["Procedure": "Sterilization procedure (procedure)"]) )
         or ( exists (["Procedure": "Vasectomy (procedure)"]) ) and ( exists (["Procedure": "Sterilization procedure (procedure)"] ) )
        ) 
         
define "Condition for Condition 2(Not Covered)":
         ( exists (["Condition": "Multigravida (finding)"]) and ( exists (["Condition": "General health deterioration (finding)"]) )
          and Patient.gender= "Female" 
           and not (( exists (["Condition": "Illness (finding)"]) ) or ( exists (["Condition": "Falling injury (disorder)"] ) ) )
          )
         
define "Condition 2(Not Covered)":
           
        "Condition for Condition 2(Not Covered)" and ( exists (["Procedure": "Sterilization procedure (procedure)"]) )
                         
define "Not Covered":
         "Condition 1(Not Covered)" and "Condition 2(Not Covered)" 

define "Coverage":
         "Covered" and not "Not Covered"  

