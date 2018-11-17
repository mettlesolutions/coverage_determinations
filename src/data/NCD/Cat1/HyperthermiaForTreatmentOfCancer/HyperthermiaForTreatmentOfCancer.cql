//HyperthermiaForTreatmentOfCancer
library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'

valueset "Hyperthermia treatment of cancer (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Radiation therapy care (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Chemotherapy": '2.16.840.1.113883.3.526.2.483'
valueset "Primary malignant neoplasm of skin (disorder)": '2.16.840.1.113883.3.526.2.1079'
valueset "Metastatic squamous cell carcinoma (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
//subcutaneous superficial malignancy
valueset "": ''

context Patient

define "Covered":
          ( exists (["Diagnosis": "Primary malignant neoplasm of skin (disorder)"]) 
          or ( exists (["Diagnosis": "Metastatic squamous cell carcinoma (disorder)"]) ) )
          and ( exists (["Procedure, Performed": "Hyperthermia treatment of cancer (procedure)"]) and ( exists (["Procedure, Performed": "Radiation therapy care (regime/therapy)"]) ) )
          
define "Not Covered":
         ( exists (["Procedure, Performed": "Hyperthermia treatment of cancer (procedure)"])
         and ( exists (["Procedure, Performed": "Chemotherapy"]) ) )
         
define "Coverage":
          "Covered" and not "Not Covered"

