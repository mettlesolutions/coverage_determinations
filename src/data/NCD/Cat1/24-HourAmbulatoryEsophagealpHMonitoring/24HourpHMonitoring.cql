//24-Hour Ambulatory Esophageal pH Monitoring
library  AmbulatoryEsophagealpHMonitoring

using FHIR
include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)


codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'

valueset "Continuous measurement of pH in esophagus over 24 hour period (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Gastric reflux (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Abnormal illness behavior (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Digestive symptom (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Traditional therapy (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
//Reflux symptom
valueset "": ''

context Patient

define "Result for conventional therapy":
         not ( exists (["Condition": "Gastric reflux (finding)"]) )


define "Covered":
          if  ( exists (["Procedure": "Traditional therapy (regime/therapy)"]T
              where T.outcome = "Result for conventional therapy") and ( exists (["Condition": "Digestive symptom (finding)"]) ) )         
          then (exists ["Procedure": "Continuous measurement of pH in esophagus over 24 hour period (procedure)"])
          else null
          
define "Coverage":
         "Covered"
          

          


