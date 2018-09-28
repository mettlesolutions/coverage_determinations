//Prostate Cancer Screening Test
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
codesystem "LOINC": '2.16.840.1.113883.3.526.3.401'
valueset "Patient advised about prostate cancer screening (situation)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Digital examination of rectum (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Prostate-specific antigen monitoring (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Clinical examination education (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Prostate nodule (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Prostate specific antigen abnormal (finding)": '2.16.840.1.113762.1.4.1018.240'
valueset "Osteopathy (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Referral to physician assistant (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Referral to nurse practitioner (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Referral to clinical nurse specialist (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Referral to nurse midwife (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Adenocarcinoma of prostate (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Immunocytochemical procedure (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Physician service (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Prostate Cancer": '2.16.840.1.113762.1.4.1116.306'
//valueset "Prostate-Specific Antigen [Chemical/Ingredient]": '2.16.840.1.113762.1.4.1010.1'
valueset "Primary malignant neoplasm of prostate (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
//Metastatic adenocarcinoma
valueset "Prostate Specific Antigen Test": '2.16.840.1.113883.3.526.3.401'
valueset "Age more than 50 years, male (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Seen by nurse practitioner (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Seen by physician (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Referred by physician assistant (finding)": '2.16.840.1.113762.1.4.1096.216'
parameter "Measurement Period" Interval<DateTime>

define "Prostate Cancer Screening Test":
           ["Procedure, Performed": "Digital examination of rectum (procedure)"] union ["Laboratory Test, Performed": "Prostate Specific Antigen Test"]
           
define "Practitioner":
         ["Physical Exam, Performed": "Seen by nurse practitioner (finding)"]
         or ["Physical Exam, Performed": "Referred by physician assistant (finding)"]
         or ["Physical Exam, Performed": "Seen by physician (finding)"]
         or ["Physical Exam, Performed": "Referral by clinical nurse specialist (procedure)"]
         or ["Physical Exam, Performed": "Referral to nurse midwife (procedure)"]
         

define "General(Coverage)":
          ["Diagnosis": "Prostate Cancer"] union "Prostate Cancer Screening Test"

define "Condition 1(Screening Digital Rectal Examinations)":
         ["Condition": "Age more than 50 years, male (finding)"]
              union ["Procedure, Performed": "Digital examination of rectum (procedure)"] DE
               where  DE.Author dateTime >= 12 months and DE.Author= "Practitioner"
               
define "Condition 2(Screening Digital Rectal Examinations)":
             ["Diagnosis": "Prostate nodule (disorder)"] union ["Procedure, Performed": "Digital examination of rectum (procedure)"] D
              where D.Author= "Practitioner"
              or ["Diagnosis": "Prostate specific antigen abnormal (finding)"] union ["Procedure, Performed": "Digital examination of rectum (procedure)"]R
              where R. Author= "Practitioner"

define "Screening Digital Rectal Examinations":
              "Condition 1(Screening Digital Rectal Examinations)" union "Condition 2(Screening Digital Rectal Examinations)"       
                       
define "Condition 1(Screening Prostate Specific Antigen Tests)":
                ["Patient Characteristic": "Age more than 50 years, male (finding)"]
              union ["Laboratory Test, Order": "Prostate Specific Antigen Test"] PSA
               where PSA.Author dateTime >= 12 months and PSA.Author= "Practitioner"

define "Condition 2(Screening Prostate Specific Antigen Tests)":
                ["Laboratory Test, Recommended": "Prostate Specific Antigen Test"] P
              where P. Reason = "Adenocarcinoma of prostate (disorder)" and P.Author= "Practitioner"
 
define "Condition 3(Screening Prostate Specific Antigen Tests)":
                  ["Diagnosis": "Primary malignant neoplasm of prostate (disorder)"] union
                  ["Laboratory Test, Recommended": "Prostate Specific Antigen Test"] union ["Procedure, Performed": "Immunocytochemical procedure (procedure)"]            
 
define "Screening Prostate Specific Antigen Tests":
           "Condition 1(Screening Prostate Specific Antigen Tests)" union "Condition 2(Screening Prostate Specific Antigen Tests)" union "Condition 3(Screening Prostate Specific Antigen Tests)"                

define "Covered":
          "General(Coverage)" union "Screening Digital Rectal Examinations" union "Screening Prostate Specific Antigen Tests" 
                   
