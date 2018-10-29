//24-Hour Ambulatory Esophageal pH Monitoring
library ChlamydiaScreening_Common version '2'

using QDM version '5.3'

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
valueset "Heartburn (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Regurgitation of food (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Bloating symptom (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Burping (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Dysphagia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Nausea (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Weight loss (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Wheezing (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'

context Patient

define "Symptoms Of Reflux":
         ( exists (["Symptom": "Heartburn (finding)"])
          or ( exists (["Symptom": "Regurgitation of food (finding)"]) )
          or ( exists (["Symptom": "Bloating symptom (finding)"]) )
          or ( exists (["Symptom": "Burping (finding)"]) )
          or ( exists (["Symptom": "Dysphagia (disorder)"]) )
          or ( exists (["Symptom": "Nausea (finding)"]) )
          or ( exists (["Symptom": "Weight loss (finding)"]) )
          or ( exists (["Symptom": "Wheezing (finding)"]) )
         ) 

define "Condition for Covered":
          "Symptoms Of Reflux" and ( exists(["Diagnosis": "Gastric reflux (finding)"]) )
          
define "Coverage":
          "Condition for Covered" and ( exists (["Procedure, Performed": "Continuous measurement of pH in esophagus over 24 hour period (procedure)"]) )


