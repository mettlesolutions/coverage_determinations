//TumorAntigenbyImmunoassay-CA19-9

library TumorAntigenbyImmunoassay

using FHIR
include FHIRHelpers version '1.8' called FHIRHelpers

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
valueset "Chronic disease (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
//Post Surgical Therapy
//Symptoms or signs of malignancy
valueset "Tumor marker measurement (procedure)": '2.16.840.1.113883.3.88.12.80.28'
parameter MeasurementPeriod default @2001-01-01T00:00:00.0

context Patient

define "Indications":
        ( exists (["Condition": "Multiple malignancy (disorder)"]) and ( exists (["Procedure": "Tumor marker monitoring (regime/therapy)"]T
        where T.performed during MeasurementPeriod) ) )
        or ( exists (["Condition": "Carcinoma of pancreas (disorder)"]) and ( exists (["Condition": "Primary malignant neoplasm of biliary tract (disorder)"]) ) 
        and ( exists (["Observation": "Tumor marker measurement (procedure)"]) ) )
        or ( exists (["Condition": "Chronic disease (disorder)"]) )
        


define "Coverage":
          "Indications" 
          
