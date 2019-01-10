//HyperthermiaForTreatmentOfCancer
library HyperthermiaForTreatmentOfCancer

using FHIR
include FHIRHelpers version '1.8' called FHIRHelpers

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
parameter MeasurementPeriod default @1984-12-31T00:00:00.0

context Patient

define "Covered":
          ( exists (["Condition": "Primary malignant neoplasm of skin (disorder)"]) 
          or ( exists (["Condition": "Metastatic squamous cell carcinoma (disorder)"]) ) )
          and ( exists (["Procedure": "Hyperthermia treatment of cancer (procedure)"]H
          where H.performed during MeasurementPeriod) and 
          ( exists (["Procedure": "Radiation therapy care (regime/therapy)"]) ) )
          
define "Not Covered":
         ( exists (["Procedure": "Hyperthermia treatment of cancer (procedure)"])
         and ( exists (["Procedure": "Chemotherapy"]) ) )
         
define "Coverage":
          "Covered" and not "Not Covered"

