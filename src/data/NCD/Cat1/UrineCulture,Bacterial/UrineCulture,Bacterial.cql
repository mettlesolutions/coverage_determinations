//UrineCulture,Bacterial

library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
codesystem "ICD10CM": '2.16.840.1.113883.3.526.2.183'
codesystem "LOINC": '2.16.840.1.113883.6.1'

valueset "Abnormal urinalysis (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Acute urinary tract infection (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hematuria": '2.16.840.1.113883.3.3157.1020'
valueset "Pyuria (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Bacteriuria (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Leukocyte Esterase": '2.16.840.1.113883.17.4077.2.2034'
valueset "Urine culture (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Gram positive sepsis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Urinalysis, bacteriuria screen (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Finding of frequency of urination (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Lethargy (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
//costovertebral
valueset "Acute pelvic pain (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Prostatitis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Urethritis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Vaginitis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Acute cervicitis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
//general debility
valueset "Sepsis, unspecified organism": '2.16.840.1.113883.3.666.5.903'
valueset "Fever, unspecified": '2.16.840.1.113762.1.4.1146.671'
valueset "Removal of ureteral stent (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Kidney Transplant Recipient": '2.16.840.1.113883.3.464.1003.109.11.1061'
//Removal of kidney stones->Kidney stone analysis (procedure)
valueset "Transurethral biopsy of bladder (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Transurethral biopsy prostate (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//Occult Infection
valueset "Immunosuppressive therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Positive": '2.16.840.1.113883.17.4077.2.2032'
valueset "Urine bacteriuria test (procedure)": '2.16.840.1.113883.3.88.12.80.28'

valueset "Urge incontinence of urine (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Abdominal pain (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Backache (ICD10CM)": '2.16.840.1.113762.1.4.1146.811'
valueset "Feeling tired (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Tremor, unspecified": '2.16.840.1.113762.1.4.1146.665'
valueset "Chills (ICD10CM)": '2.16.840.1.113762.1.4.1146.812'
valueset "Fever (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'

valueset "Nocturia (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Dysuria (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Urinary incontinence (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'


valueset "Tachycardia, unspecified": '2.16.840.1.113762.1.4.1111.65'
valueset "Fever greater than 100.4 Fahrenheit (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Tachypnea": '2.16.840.1.113762.1.4.1111.62'
valueset "Occult blood in stools (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'

valueset "Asymptomatic bacteriuria screening (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Prenatal visit (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
//Symptoms Of Sepsis

context Patient

define "Abnormal Urinalysis":
          ( exists (["Diagnosis": "Hematuria"])
          or ( exists (["Diagnosis": "Pyuria (finding)"]) )
          or ( exists (["Diagnosis": "Bacteriuria (finding)"]) ) 
          or ( exists (["Laboratory Test, Performed": "Leukocyte Esterase"]LE
              where LE.result = "Positive") )
          or ( exists (["Diagnosis": "Gram positive sepsis (disorder)"]) )
          or ( exists (["Laboratory Test, Performed": "Urine bacteriuria test (procedure)"]U
              where U.result = "Positive") )
          )
          
define "Condition 1(Indications)":
             if exists (["Procedure, Performed": "Urine culture (procedure)"])
             then "Abnormal Urinalysis"
             else null
             
define "Symptoms Of Lower Urinary Tract Infection":
          ( exists (["Symptom": "Urge incontinence of urine (finding)"])
          or ( exists (["Symptom": "Finding of frequency of urination (finding)"]) )
          or ( exists (["Symptom": "Nocturia (finding)"]) )
          or ( exists (["Symptom": "Dysuria (finding)"]) )
          or ( exists (["Symptom": "Urinary incontinence (finding)"]) ) )
          
define "Symptoms and Pain Of Upper Urinary Tract Infection":
         "Symptoms Of Lower Urinary Tract Infection" or  ( exists (["Symptom": "Fever (finding)"])
           or ( exists (["Symptom": "Chills (ICD10CM)"]) )
           or ( exists (["Symptom": "Lethargy (finding)"]) )
           or ( exists (["Diagnosis": "Acute pelvic pain (finding)"]) )
           or ( exists (["Diagnosis": "Abdominal pain (finding)"]) )
            )
            
define "Symptoms Of Genitourinary Tract":
           ( exists (["Symptom": "Prostatitis (disorder)"]) 
           or ( exists (["Symptom": "Urethritis (disorder)"]) )
           or ( exists (["Symptom": "Vaginitis (disorder)"]) )
           or ( exists (["Symptom": "Acute cervicitis (disorder)"]) )
           )
             
define "Condition 2(Indications)":
          "Symptoms Of Lower Urinary Tract Infection" or "Symptoms and Pain Of Upper Urinary Tract Infection" or "Symptoms Of Genitourinary Tract"
          
/*define "Symptoms Of Sepsis": 
            ( exists (["Symptom": "Tachycardia, unspecified"])
            or ( exists (["Symptom": "Fever greater than 100.4 Fahrenheit (finding)"]) )
            or ( exists (["Symptom": "Tachypnea"]) ) )*/
            
define "Urosepsis":
         ( exists (["Diagnosis": "Acute urinary tract infection (disorder)"])
         and ( exists (["Diagnosis": "Sepsis, unspecified organism"]) ) )
          
define "Condition 3(Indications)":
           "Urosepsis" or ( exists (["Diagnosis": "Fever, unspecified"]) )// or "Symptoms Of Sepsis"
           
define "Condition 6(Indications)":
        if   ( exists (["Procedure, Performed": "Immunosuppressive therapy (procedure)"])
           and (["Diagnosis": "Occult blood in stools (finding)"] included in ["Procedure, Performed": "Kidney Transplant Recipient"] ) ) 
         then ( exists (["Procedure, Performed": "Urine culture (procedure)"]) )
         
        else null 
        
define "Indications":
          "Condition 1(Indications)" or "Condition 2(Indications)" or "Condition 3(Indications)" or "Condition 6(Indications)"
        
define "Not Covered":
            ( exists (["Procedure, Performed": "Prenatal visit (regime/therapy)"])
            and ( exists (["Laboratory Test, Performed": "Asymptomatic bacteriuria screening (procedure)"]) ) )
            
define "Coverage":
         "Indications" and not "Not Covered"          
