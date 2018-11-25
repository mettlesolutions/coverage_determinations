//Manipulation
library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'
codesystem "ICD10CM": '2.16.840.1.113883.6.90'

valueset "Bronchitis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Emphysema": '2.16.840.1.113883.3.464.1003.102.11.1012'
valueset "Asthma": '2.16.840.1.113883.3.526.2.60'
valueset "Osteopathic Treatment of Rib Cage using Other Method": '2.16.840.1.113762.1.4.1032.36'
valueset "Revisional fusion of occipitocervical junction (procedure)": '2.16.840.1.113883.3.88.12.80.28' 
valueset "Manipulation of temporomandibular joint (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "": ''

context Patient

define "Manipulation of the Rib Cage":
         if ( exists (["Diagnosis": "Bronchitis (disorder)"])
                 or ( exists (["Diagnosis": "Emphysema"]) )
                 or ( exists (["Diagnosis": "Asthma"]) ) )
            then ( exists (["Procedure, Performed": "Osteopathic Treatment of Rib Cage using Other Method"]) )
         else null
                 
define "Manipulation of the Head":
              ( exists (["Procedure, Performed": "Revisional fusion of occipitocervical junction (procedure)"])
              or ( exists (["Procedure, Performed": "Manipulation of temporomandibular joint (procedure)"]) ) )
              
define "Indications and Limitations":
          "Manipulation of the Rib Cage" or "Manipulation of the Head"
          
define "Coverage":
          "Indications and Limitations"

