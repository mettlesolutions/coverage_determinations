library ScreeningForDepressionInAdults

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

valueset "Adult depression screening ICD10": '2.16.840.1.113883.3.600.456'
valueset "Telephone call by physician to patient or for consultation (procedure)": '2.16.840.1.113762.1.4.1116.438'
valueset "Counseling (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Depressive disorder (disorder)": '2.16.840.1.113883.3.600.145'
valueset "Physician assistant (occupation)": '2.16.840.1.113762.1.4.1096.129'
valueset "Physician (occupation)": '2.16.840.1.113762.1.4.1096.129'
valueset "Nurse practitioner (occupation)": '2.16.840.1.113762.1.4.1096.129'
valueset "Referral to mental health counselor (procedure)": '2.16.840.1.113762.1.4.1182.103'
//self-help materials


context Patient

define "Practitioners":
         ( exists ([Practitioner: "Physician assistant (occupation)"])
         or ( exists ([Practitioner: "Nurse practitioner (occupation)"]) ) )

define "Covered":
         ( exists ([Condition: "Depressive disorder (disorder)"])
         and ( exists ([Observation: "Adult depression screening ICD10"] AD
         where duration in minutes of AD.effective = 15 and "Practitioners"
         ) )
         and ( exists ([Practitioner: "Physician (occupation)"])
             and ( exists ([Procedure: "Referral to mental health counselor (procedure)"]) ) ) )

define "Condition 1(Not Covered)":
          ( exists ([Observation: "Adult depression screening ICD10"]A
          where duration in months of A.effective < 12 and A.component= 2) )
          
define "Condition 2(Not Covered)":
            ( exists ([Procedure: "Telephone call by physician to patient or for consultation (procedure)"])
            or ( exists ([Procedure: "Counseling (procedure)"]) ) )
            
define "Not Covered": 
            "Condition 1(Not Covered)" or "Condition 2(Not Covered)"  
            
define "Coverage":
          "Covered"    

          
