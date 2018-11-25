//PositronEmissionTomography(FDG)ForOncologicConditions
library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT": '2.16.840.1.113883.3.88.12.80.28'
codesystem "ICD10CM": '1.3.6.1.4.1.6997.4.1.2.234.999.4.9'

valueset "Positron emission tomography fluorodeoxyglucose imaging of whole body (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Breast Distant Metastasis Status M0": '2.16.840.1.113883.3.526.3.1302'
valueset "Malignant neoplasm of colon (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Disorder of esophagus (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Malignant lymphoma (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Non-small cell lung cancer (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Malignant tumor of ovary (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Malignant neoplasm of brain (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Malignant neoplasm of cervix uteri, unspecified": '1.3.6.1.4.1.6997.4.1.2.234.999.4.9'
valueset "Small cell carcinoma of lung (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Sarcoma of soft tissue (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Malignant Neoplasm of Pancreas": '2.16.840.1.113883.3.3157.1025'
valueset "Malignant tumor of testis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Malignant neoplasm of thyroid gland": '1.3.6.1.4.1.6997.4.1.2.234.999.4.2'
valueset "Malignant melanoma (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Solid tumor configuration (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Multiple myeloma (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
//Head and Neck (not thyroid, CNS)
valueset "Carcinoma of male breast (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Malignant neoplasm of female breast (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Distant metastasis present (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Excision of regional lymph nodes (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Adenocarcinoma of prostate (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Breast Cancer": '2.16.840.1.113883.3.526.2.97'
//Initial Anti-Tumor Treatment
valueset "High risk for cervical cancer (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Chemotherapy": '2.16.840.1.113883.3.526.2.483'

context Patient

define "FDG PET Scan For Cancer":
           ( exists (["Diagnosis": "Malignant neoplasm of colon (disorder)"])
           or ( exists (["Diagnosis": "Disorder of esophagus (disorder)"]) ) 
           or ( exists (["Diagnosis": "Malignant lymphoma (disorder)"]) )
           or ( exists (["Diagnosis": "Non-small cell lung cancer (disorder)"]) )
           or ( exists (["Diagnosis": "Malignant tumor of ovary (disorder)"]) ) 
           or ( exists (["Diagnosis": "Malignant neoplasm of brain (disorder)"]) )
           or ( exists (["Diagnosis": "Small cell carcinoma of lung (disorder)"]) )
           or ( exists (["Diagnosis": "Sarcoma of soft tissue (disorder)"]) ) 
           or ( exists (["Diagnosis": "Malignant Neoplasm of Pancreas"]) ) 
           or ( exists (["Diagnosis": "Malignant tumor of testis (disorder)"]) )
           or ( exists (["Diagnosis": "Malignant neoplasm of thyroid gland"]) )
           or ( exists (["Diagnosis": "Solid tumor configuration (finding)"]) )
           or ( exists (["Diagnosis": "Multiple myeloma (disorder)"]) ) )
 
define "Covered 1": 
          "FDG PET Scan For Cancer" and ( exists (["Diagnostic Study, Performed": "Positron emission tomography fluorodeoxyglucose imaging of whole body (procedure)"]) )

define "Condition 1(Limitations)":
         ( exists (["Diagnosis": "Carcinoma of male breast (disorder)"]) or ( exists (["Diagnosis": "Malignant neoplasm of female breast (disorder)"]) ) )
         and ( exists (["Diagnosis": "Distant metastasis present (finding)"]) )
         and ( exists (["Diagnostic Study, Performed": "Positron emission tomography fluorodeoxyglucose imaging of whole body (procedure)"]) )

define "Condition 2(Limitations)":
           ( exists (["Diagnosis": "Malignant melanoma (disorder)"])
           and not ( exists (["Diagnosis": "Excision of regional lymph nodes (procedure)"]) ) 
           and (exists (["Diagnostic Study, Performed": "Positron emission tomography fluorodeoxyglucose imaging of whole body (procedure)"]) ) )
           
define "Initial Anti-Tumor Treatment and FDG PET imaging Non Covered":
            ( exists (["Diagnosis": "Adenocarcinoma of prostate (disorder)"])
            or ( exists (["Diagnosis": "Breast Cancer"]) ) 
            or ( exists (["Diagnosis": "Malignant melanoma (disorder)"]) and ( exists (["Procedure, Performed": "Excision of regional lymph nodes (procedure)"]) ) )
            or ( exists (["Diagnosis": "High risk for cervical cancer (finding)"]) ) )  
            
define "Not Covered":
              "Initial Anti-Tumor Treatment and FDG PET imaging Non Covered"
              
define "Covered":
            "Covered 1" or "Condition 1(Limitations)" or "Condition 2(Limitations)"     











