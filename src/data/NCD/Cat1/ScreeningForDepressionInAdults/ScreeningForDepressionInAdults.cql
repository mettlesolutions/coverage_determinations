//ScreeningForDepressionInAdults

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

valueset "Adult depression screening ICD10": '2.16.840.1.113883.3.600.456'
valueset "Telephone call by physician to patient or for consultation (procedure)": '2.16.840.1.113762.1.4.1116.438'
valueset "Counseling (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Depressive disorder (disorder)": '2.16.840.1.113883.3.600.145'
valueset "Physician assistant (occupation)": '2.16.840.1.113762.1.4.1096.129'
valueset "Physician (occupation)": '2.16.840.1.113762.1.4.1096.129'
valueset "Nurse practitioner (occupation)": '2.16.840.1.113762.1.4.1096.129'
valueset "Referral to mental health counselor (procedure)": '2.16.840.1.113762.1.4.1182.103'
//self-help materials
valueset "": ''


context Patient

define "Practitioners":
         ( exists (["Provider Characteristic": "Physician assistant (occupation)"]) 
         or ( exists (["Provider Characteristic": "Nurse practitioner (occupation)"]) ) )

define "Covered":
         ( exists (["Diagnosis": "Depressive disorder (disorder)"])
         and ( exists (["Physical Exam, Performed": "Adult depression screening ICD10"] AD
         where duration in minutes of AD.relevantPeriod = 15 and "Practitioners"
         ) ) 
         and ( exists (["Provider Characteristic": "Physician (occupation)"]) 
             and ( exists (["Procedure, Performed": "Referral to mental health counselor (procedure)"]) ) ) )
             
define "Condition 1(Not Covered)":
          ( exists (["Physical Exam, Performed": "Adult depression screening ICD10"]A
          where duration in months of A.relevantPeriod < 12 and A.components= 2) )
          
define "Condition 2(Not Covered)":
            ( exists (["Procedure, Performed": "Telephone call by physician to patient or for consultation (procedure)"]) 
            or ( exists (["Procedure, Performed": "Counseling (procedure)"]) ) )   
            
define "Not Covered": 
            "Condition 1(Not Covered)" or "Condition 2(Not Covered)"  
            
define "Coverage":
          "Covered"    

          
