//ScreeningPapSmearsandPelvicExaminationsforEarlyDetectionofCervicalorVaginalCancer
library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT": '2.16.840.1.113883.3.88.12.80.28'
codesystem "LOINC": '2.16.840.1.113883.6.1'
codesystem "HCPCS": '2.16.840.1.113883.6.14'

valueset "Pap Test": '2.16.840.1.113883.3.464.1003.108.11.1044'
valueset "Suspected cervical cancer (situation)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Cervical or vaginal cancer screening; pelvic and clinical breast examination": '2.16.840.1.113762.1.4.1047.194'
valueset "Female (finding)": '2.16.840.1.113883.3.2074.1.1.14'
valueset "Physician (occupation)": '2.16.840.1.113762.1.4.1096.129'
valueset "High risk for cervical cancer (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Female genitalia finding (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Urethral meatus finding (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Urethral finding (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Disorder of urinary bladder (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Vaginal problem (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Lesion of uterus (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Uterus part (body structure)": '2.16.840.1.113883.3.88.12.3221.8.9'
valueset "Structure of adnexal orifice of skin (body structure)": '2.16.840.1.113883.3.88.12.3221.8.9'
valueset "Anus part (body structure)": '2.16.840.1.113883.3.88.12.3221.8.9'
valueset "Entire perineum (body structure)": '2.16.840.1.113883.3.88.12.3221.8.9'
valueset "Adnexal tenderness (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Disorder of anus (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Disorder of perineum (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'

parameter "MeasurementPeriod" Interval<DateTime>
parameter "Total" Integer

context Patient

define "Condition for pap test":
         ( exists (["Diagnosis": "Suspected cervical cancer (situation)"]) and  ( exists (["Patient Characteristic Sex": "Female (finding)"]) ) )
         
define "Covered 1(Pap test)":
         "Condition for pap test" and ( exists (["Laboratory Test, Performed": "Pap Test"]) )
         
define "Condition1 for Pelvic Examination":
         ( exists (["Physical Exam, Performed": "Cervical or vaginal cancer screening; pelvic and clinical breast examination"] P
           where P.relevantPeriod is null) )
           or AgeInYearsAt(start of MeasurementPeriod) >=12 and AgeInYearsAt(start of MeasurementPeriod) <=51
           
define "Condition2 for Pelvic Examination":
         ( exists (["Diagnosis": "High risk for cervical cancer (finding)"]) and ( exists (["Physical Exam, Performed": "Cervical or vaginal cancer screening; pelvic and clinical breast examination"] PE
          where PE.authorDatetime = "Physician (occupation)"
         ) ) )

define "Covered 1(Pelvic Examinaton)":
          "Condition1 for Pelvic Examination" or "Condition2 for Pelvic Examination"
          
define "Pap Smear Screening":
         "Covered 1(Pap test)" and "Covered 1(Pelvic Examinaton)"
         
define "Abnormality Of Female genitalia":
          if exists (["Diagnosis": "Female genitalia finding (finding)"]) 
          then Total = Total + 1
          else null
          
define "Abnormality Of urethral meatus":
          if exists (["Diagnosis": "Urethral meatus finding (finding)"]) 
          then Total = Total + 1
          else null
          
define "Abnormality Of Urethra":
          if exists (["Diagnosis": "Urethral finding (finding)"]) 
          then Total = Total + 1
          else null
          
define "Abnormality Of Bladder": 
            if exists (["Diagnosis": "Disorder of urinary bladder (disorder)"]) 
            then Total = Total + 1
            else null
            
define "Vaginal problem":
           if exists (["Diagnosis": "Vaginal problem (finding)"]) 
            then Total = Total + 1
            else null
            
define "Lesion of uterus":
         if exists (["Diagnosis": "Lesion of uterus (finding)"]) 
            then Total = Total + 1
            else null
            
define "Adnexal":
          if exists (["Diagnosis": "Adnexal tenderness (finding)"]) 
            then Total = Total + 1
            else null 
            
define "Anus Disorder": 
            if exists (["Diagnosis": "Disorder of anus (disorder)"]) 
            then Total = Total + 1
            else null 
            
define "Disorder of perineum":
          if exists (["Diagnosis": "Disorder of perineum (disorder)"]) 
            then Total = Total + 1
            else null 
            
define "Condition For Pelvic Examination":
           if Total > 7
           then ["Physical Exam, Performed": "Cervical or vaginal cancer screening; pelvic and clinical breast examination"]
           else null
          
            

define "Screening Pelvic Examination":
         ( exists ("Condition For Pelvic Examination") and ( exists (["Physical Exam, Performed": "Cervical or vaginal cancer screening; pelvic and clinical breast examination"]) ) )
          
define "Coverage":
         "Pap Smear Screening" or "Screening Pelvic Examination"


