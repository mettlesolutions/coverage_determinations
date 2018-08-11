library ChlamydiaScreening_Common version '2'

using QDM version '5.3'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Alcohol and Drug Dependence": '2.16.840.1.113883.3.464.1003.106.12.1001'
valueset "Diabetes" : '2.16.840.1.113883.3.464.1003.103.11.1003'
valueset "Diabetes mellitus" : '2.16.840.1.113883.3.3157.1329'
valueset "Pressure Ulcer Stage" : '2.16.840.1.113883.11.20.9.35'
valueset "Pressure Ulcer Risk Assessment": '2.16.840.1.113762.1.4.1098.1'
valueset "Active Tuberculosis for Urology Care": '2.16.840.1.113762.1.4.1151.56'
valueset "Coronary Artery Disease No MI": '2.16.840.1.113883.3.526.2.120'
valueset "Gestational Diabetes": '2.16.840.1.113883.3.464.1003.103.11.1014'
valueset "Epilepsy (active) diagnosis" :'2.16.840.1.113762.1.4.1034.51'
valueset "Pruritus Unspecified or Other Location": '1.3.6.1.4.1.6997.4.1.2.268.13.35282.1.12.1.999.218'
valueset "Focal Neurological Deficit" :'2.16.840.1.113883.17.4077.2.1052'
valueset "Hypoglycemics": '2.16.840.1.113762.1.4.1179.3'
valueset "Glucose Lab Test": '2.16.840.1.113762.1.4.1045.134'
valueset "Fasting glucose [Mass/volume] in Serum or Plasma": '2.16.840.1.113883.6.1'

context Patient

define "Conditions for Coverage": 
   ["Diagnosis": "Diabetes mellitus"]
   union ["Diagnosis": "Alcohol and Drug Dependence"]
   union ["Diagnosis": "Diabetes"]
   union ["Diagnosis": "Pressure Ulcer Stage"]
   union ["Diagnosis": "Pressure Ulcer Risk Assessment"]
   union ["Diagnosis": "Active Tuberculosis for Urology Care"]
   union ["Diagnosis": "Coronary Artery Disease No MI"]
   union ["Diagnosis": "Gestational Diabetes"]
   union ["Diagnosis": "Epilepsy (active) diagnosis"]
   union ["Diagnosis": "Pruritus Unspecified or Other Location"]
   union ["Diagnosis": "Focal Neurological Deficit"]
   union ["Diagnosis": "Hypoglycemics"]

define "Prerequisite":
   ["Diagnostic Study, Performed": "Fasting glucose [Mass/volume] in Serum or Plasma"]D
   where D.result included in Interval(110 ,125) 'mg/dL'

define "Glucose test":
   ["Encounter, Performed": "Glucose Lab Test"]G
   where G.relevantPeriod in "Measurement Period"

define "Encounter with Glucose test":
  "Glucose test" Encounter
    with "Prerequisite" P
      such that P.relevantPeriod includes Encounter.relevantPeriod
        or P.relevantPeriod starts during Encounter.relevantPeriod
      and duration in days of (P.effectiveTime intersect Encounter.effectiveTime) >= 4
   
