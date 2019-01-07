library OrnishProgramForReversingHeartDisease

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

valueset "Cardiovascular rehabilitation procedure (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Insertion of carotid artery stent (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Implantation of ventricular assist device (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Lung volume reduction surgery (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//oncologic PET scan
valueset "Heart disease (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'

parameter MeasurementPeriod default Interval[
@2010-08-12T00:00:00.0,
null
)

context Patient

define "Requirements Of ICR Programs":
          ( exists ([Procedure: "Insertion of carotid artery stent (procedure)"]I
          where I.performed during MeasurementPeriod)
          and ( exists ([Procedure: "Implantation of ventricular assist device (procedure)"]IO
          where IO.performed during MeasurementPeriod) )
          and ( exists ([Procedure: "Lung volume reduction surgery (procedure)"]L
          where L.performed during MeasurementPeriod) )
          )
          
define "Ornish Program for Reversing Heart Disease":
               ( exists ([Condition: "Heart disease (disorder)"])
               and "Requirements Of ICR Programs" )
               
define "Not Covered":
      not "Requirements Of ICR Programs"
           
define "Coverage":
          "Ornish Program for Reversing Heart Disease"

