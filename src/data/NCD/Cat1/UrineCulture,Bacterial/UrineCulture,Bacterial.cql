library UrineCultureBacterial

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
          ( exists ([Condition: "Hematuria"])
          or ( exists ([Condition: "Pyuria (finding)"]) )
          or ( exists ([Condition: "Bacteriuria (finding)"]) )
          or ( exists ([Observation: "Leukocyte Esterase"]LE
              where LE.value = "Positive") )
          or ( exists ([Condition: "Gram positive sepsis (disorder)"]) )
          or ( exists ([Observation: "Urine bacteriuria test (procedure)"]U
              where U.value = "Positive") )
          )

define "Condition 1(Indications)":
             if exists ([Procedure: "Urine culture (procedure)"])
             then "Abnormal Urinalysis"
             else false

define "Symptoms Of Lower Urinary Tract Infection":
          ( exists ([Condition: "Urge incontinence of urine (finding)"])
          or ( exists ([Condition: "Finding of frequency of urination (finding)"]) )
          or ( exists ([Condition: "Nocturia (finding)"]) )
          or ( exists ([Condition: "Dysuria (finding)"]) )
          or ( exists ([Condition: "Urinary incontinence (finding)"]) ) )

define "Symptoms and Pain Of Upper Urinary Tract Infection":
         "Symptoms Of Lower Urinary Tract Infection" or  ( exists ([Condition: "Fever (finding)"])
           or ( exists ([Condition: "Chills (ICD10CM)"]) )
           or ( exists ([Condition: "Lethargy (finding)"]) )
           or ( exists ([Condition: "Acute pelvic pain (finding)"]) )
           or ( exists ([Condition: "Abdominal pain (finding)"]) )
            )

define "Symptoms Of Genitourinary Tract":
           ( exists ([Condition: "Prostatitis (disorder)"])
           or ( exists ([Condition: "Urethritis (disorder)"]) )
           or ( exists ([Condition: "Vaginitis (disorder)"]) )
           or ( exists ([Condition: "Acute cervicitis (disorder)"]) )
           )

define "Condition 2(Indications)":
          "Symptoms Of Lower Urinary Tract Infection" or "Symptoms and Pain Of Upper Urinary Tract Infection" or "Symptoms Of Genitourinary Tract"

/*define "Symptoms Of Sepsis":
            ( exists ([Condition: "Tachycardia, unspecified"])
            or ( exists ([Condition: "Fever greater than 100.4 Fahrenheit (finding)"]) )
            or ( exists ([Condition: "Tachypnea"]) ) )*/

define "Urosepsis":
         ( exists ([Condition: "Acute urinary tract infection (disorder)"])
         and ( exists ([Condition: "Sepsis, unspecified organism"]) ) )

define "Condition 3(Indications)":
           "Urosepsis" or ( exists ([Condition: "Fever, unspecified"]) )// or "Symptoms Of Sepsis"

define "Condition 6(Indications)":
        if   ( exists ([Procedure: "Immunosuppressive therapy (procedure)"])
           and ([Condition: "Occult blood in stools (finding)"] included in [Procedure: "Kidney Transplant Recipient"] ) )
         then ( exists ([Procedure: "Urine culture (procedure)"]) )

        else false
        
define "Indications":
          "Condition 1(Indications)" or "Condition 2(Indications)" or "Condition 3(Indications)" or "Condition 6(Indications)"
        
define "Not Covered":
            ( exists ([Procedure: "Prenatal visit (regime/therapy)"])
            and ( exists ([Observation: "Asymptomatic bacteriuria screening (procedure)"]) ) )
            
define "Coverage":
         "Indications" and not "Not Covered"          
