library ChlamydiaScreening_Common version '2'

using QDM

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
          ["Diagnosis": "Illness (finding)"] union ["Procedure, Performed": "General treatment (procedure)"]
          and ["Procedure, Performed": "Sterilization procedure (procedure)"]
          or ["Diagnosis": "Falling injury (disorder)"] union ["Procedure, Performed": "General treatment (procedure)"] 
          and ["Procedure, Performed": "Sterilization procedure (procedure)"]
         
          
define "Condition 2(Coverage)":
           ["Diagnosis": "Carcinoma of prostate (disorder)"]
           union ["Procedure, Performed": "Bilateral oophorectomy (procedure)"]
           or ["Diagnosis": "Carcinoma of prostate (disorder)"]
           union ["Procedure, Performed": "Bilateral orchidectomy (procedure)"]
           
define "Covered":
        "Condition 1(Coverage)" union "Condition 2(Coverage)"
        
define "Condition 1(Not Covered)":
         ["Procedure, Performed": "Hysterectomy (procedure)"] 
         union ["Procedure, Performed": "Sterilization procedure (procedure)"]
         or ["Procedure, Performed": "Tubal ligation done (situation)"]
         union ["Procedure, Performed": "Sterilization procedure (procedure)"]
         or ["Procedure, Performed": "Vasectomy (procedure)"]
         union ["Procedure, Perfomed": "Sterilization procedure (procedure)"] 
         
define "Condition 2(Not Covered)":
           ["Diagnosis": "Multigravida (finding)"] union ["Diagnosis": "General health deterioration (finding)"] and ["Patient Characteristic Sex": "Female"]
           union not ["Diagnosis": "Illness (finding)"] union ["Procedure, Performed": "General treatment (procedure)"] 
           or not ["Diagnosis": "Falling injury (disorder)"] union ["Procedure, Performed": "General treatment (procedure)"]
           union ["Procedure, Performed": "Sterilization procedure (procedure)"]
                         
define "Not Covered":
         "Condition 1(Not Covered)" union "Condition 2(Not Covered)" 

define "Coverage":
         "Covered" union not "Not Covered"         
