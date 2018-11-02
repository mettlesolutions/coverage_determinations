//TumorAntigenbyImmunoassay-CA19-9

library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT": '2.16.840.1.113883.3.88.12.80.28'
codesystem "ICD10CM": '2.16.840.1.113762.1.4.1138.488'

valueset "Tumor marker monitoring (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Multiple malignancy (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Residual tumor present (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Carcinoma of pancreas (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Primary malignant neoplasm of biliary tract (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Unexplained weight loss (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Fever (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Fatigue (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Chronic hoarseness (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Indigestion (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Irregular bowel habits (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Pain (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Chronic disease (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
//Post Surgical Therapy
valueset "Tumor marker measurement (procedure)": '2.16.840.1.113883.3.88.12.80.28'

context Patient

define "Symptoms Of Malignancy":
         ( exists (["Diagnosis": "Unexplained weight loss (finding)"])
         or ( exists (["Symptom": "Fever (finding)"]) )
         or ( exists (["Symptom": "Fatigue (finding)"]) )
         or ( exists (["Symptom": "Chronic hoarseness (finding)"]) )
         or ( exists (["Symptom": "Indigestion (finding)"]) )
         or ( exists (["Symptom": "Irregular bowel habits (finding)"]) )
         or ( exists (["Symptom": "Pain (finding)"]) )
          )
define "Indications":
        ( exists (["Diagnosis": "Multiple malignancy (disorder)"]) and ( exists (["Procedure, Performed": "Tumor marker monitoring (regime/therapy)"]) ) )
        or ( exists (["Diagnosis": "Carcinoma of pancreas (disorder)"]) and ( exists (["Diagnosis": "Primary malignant neoplasm of biliary tract (disorder)"]) ) 
        and ( exists (["Laboratory Test, Performed": "Tumor marker measurement (procedure)"]) ) )
        or ( exists (["Diagnosis": "Chronic disease (disorder)"]) )
        
define "Not Covered":
         "Symptoms Of Malignancy"

define "Coverage":
          "Indications"
