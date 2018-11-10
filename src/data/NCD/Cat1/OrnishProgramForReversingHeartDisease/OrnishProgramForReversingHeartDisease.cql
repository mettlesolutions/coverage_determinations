//OrnishProgramForReversingHeartDisease

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

valueset "Cardiovascular rehabilitation procedure (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Insertion of carotid artery stent (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Implantation of ventricular assist device (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Lung volume reduction surgery (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//oncologic PET scan
valueset "Heart disease (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'

context Patient

define "Requirements Of ICR Programs":
          ( exists (["Procedure, Performed": "Insertion of carotid artery stent (procedure)"])
          and ( exists (["Procedure, Performed": "Implantation of ventricular assist device (procedure)"]) )
          and ( exists (["Procedure, Performed": "Lung volume reduction surgery (procedure)"]) ) 
          )
          
define "Ornish Program for Reversing Heart Disease":
               ( exists (["Diagnosis": "Heart disease (disorder)"])
               and "Requirements Of ICR Programs" )
               
define "Not Covered":
      not "Requirements Of ICR Programs"
           
define "Coverage":
          "Ornish Program for Reversing Heart Disease"
