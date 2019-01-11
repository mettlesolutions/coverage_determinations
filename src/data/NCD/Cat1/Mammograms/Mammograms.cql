//Mammograms
library Mammograms

using FHIR
include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'
codesystem "LOINC": '2.16.840.1.113883.6.1'

valueset "Mammography": '2.16.840.1.113883.3.464.1003.108.11.1047'
valueset "Medical doctor (occupation)": '2.16.840.1.113762.1.4.1166.24'
//osteopathy doctor
valueset "Screening mammography (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Female (finding)": '2.16.840.1.113883.3.2074.1.1.14'
valueset "Asymptomatic (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'

valueset "Breast lump (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Pain (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Skin irritation (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Nipple discharge symptom (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Personal history of primary malignant neoplasm of breast (situation)": '2.16.840.1.113762.1.4.1018.240'
valueset "Family history of malignant neoplasm of breast (situation)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Breast signs and symptoms (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'

parameter "MeasurementPeriod" Interval<DateTime>

context Patient

define "Condition 1(Covered)":
          ( exists (["DiagnosticReport": "Mammography"])
          and ( exists (["Encounter": "Medical doctor (occupation)"]) ) )
          
define "Condition 2(Covered)":
          Patient.gender = "Female (finding)"
          and (AgeInYearsAt(start of MeasurementPeriod) > 34 and AgeInYearsAt(start of MeasurementPeriod) < 40 )
          and ( exists (["DiagnosticReport": "Mammography"]) ) 
          
define "Condition 3(Covered)":
         ( exists (["Condition": "Asymptomatic (finding)"])
         and Patient.gender = "Female (finding)"
         and (AgeInYearsAt(start of MeasurementPeriod) < 39)
         and ( exists (["Observation": "Screening mammography (procedure)"]SM
         where duration in months of (SM.effective) > 11 ) ) )
         
/*define "Symptoms for breast cancer":
          ( exists (["Symptom": "Breast lump (finding)"])
          or ( exists (["Symptom": "Pain (finding)"]) )
          or ( exists (["Symptom": "Skin irritation (disorder)"]) )
          or ( exists (["Symptom": "Nipple discharge symptom (finding)"]) ) )*/
          
define "Condition 4(Covered)":
         ( exists (["Condition":"Breast signs and symptoms (finding)"]) or ( exists (["Condition": "Personal history of primary malignant neoplasm of breast (situation)"]) ) )
          
define "Condition 1(Not Covered)":
             ( exists (["Observation": "Screening mammography (procedure)"]) 
             and Patient.gender = "Female (finding)" and (AgeInYearsAt(start of MeasurementPeriod) < 35))
             
define "Condition 2(Not Covered)": 
           ( exists (["Condition": "Asymptomatic (finding)"])
           and Patient.gender = "Female (finding)"
             and (AgeInYearsAt(start of MeasurementPeriod) >= 50))
           or ( exists (["Condition": "Asymptomatic (finding)"])
           and Patient.gender = "Female (finding)"
            and (AgeInYearsAt(start of MeasurementPeriod) >= 40)
            or ( exists (["Condition": "Family history of malignant neoplasm of breast (situation)"]) ) )

define "Not Covered":
         "Condition 1(Not Covered)" or "Condition 2(Not Covered)"
         
define "Covered":
          "Condition 1(Covered)" or "Condition 2(Covered)" or "Condition 3(Covered)" or "Condition 4(Covered)"
          
define "Coverage":
          "Covered" and not "Not Covered"
