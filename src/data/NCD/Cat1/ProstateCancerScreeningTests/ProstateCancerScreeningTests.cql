//Prostate Cancer Screening Test
library ProstateCancerScreeningTest

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

valueset "Malignant tumor of exocrine pancreas (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Prostate Specific Antigen Test": '2.16.840.1.113883.3.526.3.401'
valueset "Age more than 50 years, male (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Seen by nurse practitioner (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Seen by physician (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Referred by physician assistant (finding)": '2.16.840.1.113762.1.4.1096.216'

parameter "Measurement Period" Interval<DateTime>
parameter MeasurementPeriod1 default @2006-06-19T00:00:00.0

context Patient

define "Prostate Cancer Screening Test":
           (exists (["Procedure": "Digital examination of rectum (procedure)"]D
           where D.performed during MeasurementPeriod1)
            and (exists (["Observation": "Prostate Specific Antigen Test"])
           ))
define "Practitioner":
       (exists (["Encounter": "Seen by nurse practitioner (finding)"]))
        	or (exists (["Encounter": "Referred by physician assistant (finding)"]))
         	or (exists (["Encounter": "Seen by physician (finding)"]))
        	or (exists (["Encounter": "Referral to clinical nurse specialist (procedure)"]))
         	or (exists (["Encounter": "Referral to nurse midwife (procedure)"]))
         
         

define "General(Coverage)":
         (exists (["Condition": "Prostate Cancer"])) and "Prostate Cancer Screening Test"

define "Condition 1(Screening Digital Rectal Examinations)":
         (exists (["Patient": "Age more than 50 years, male (finding)"])
              and (exists (["Procedure": "Digital examination of rectum (procedure)"]) DE
               where duration in months of (DE.performed) >= 12 and DE.performer="Practitioner" and DE.performed during MeasurementPeriod1 ))
               
define "Condition 2(Screening Digital Rectal Examinations)":
            (exists (["Condition": "Prostate nodule (disorder)"]) and (exists (["Procedure": "Digital examination of rectum (procedure)"] D
              where D.performer.role= "Practitioner" )))
              or (exists (["Condition": "Prostate specific antigen abnormal (finding)"]) and (exists (["Procedure": "Digital examination of rectum (procedure)"] R
              where R.performer.role= "Practitioner")))

define "Screening Digital Rectal Examinations":
              "Condition 1(Screening Digital Rectal Examinations)" and "Condition 2(Screening Digital Rectal Examinations)"       
                       
define "Condition 1(Screening Prostate Specific Antigen Tests)":
                (exists (["Patient": "Age more than 50 years, male (finding)"])
              and (exists (["Observation": "Prostate Specific Antigen Test"]) PSA
               where duration in months of (PSA.effective) >= 12  and PSA.performer= "Practitioner" and (PSA.effective) during MeasurementPeriod1))

define "Condition 2(Screening Prostate Specific Antigen Tests)":
		(exists (["Condition" :"Adenocarcinoma of prostate (disorder)"])
		 and (exists (["Condition":"Malignant tumor of exocrine pancreas (disorder)"]))
                and (exists (["Observation": "Prostate Specific Antigen Test"]) P
               where P.performer= "Practitioner"))
 
define "Condition 3(Screening Prostate Specific Antigen Tests)":
                  (exists (["Condition": "Primary malignant neoplasm of prostate (disorder)"]) and
                  (exists (["Observation": "Prostate Specific Antigen Test"])) and 
                  (exists (["Procedure": "Immunocytochemical procedure (procedure)"])))           
 
define "Screening Prostate Specific Antigen Tests":
           "Condition 1(Screening Prostate Specific Antigen Tests)" and "Condition 2(Screening Prostate Specific Antigen Tests)" 
           and "Condition 3(Screening Prostate Specific Antigen Tests)"                

define "Covered":
          "General(Coverage)" or "Screening Digital Rectal Examinations" or "Screening Prostate Specific Antigen Tests" 
