//HomeProthrombinTime-InternationalNormalizedRatio(PT-INR)MonitoringForAnticoagulationManagement


library ChlamydiaScreening_Common version '2'

using QDM version '5.3'


//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
codesystem "RXNORM": '2.16.840.1.113883.3.1240.15.3.4003'
codesystem "ICD10CM": '2.16.840.1.113883.6.90'
codesystem "HSLOC": '2.16.840.1.113883.6.259'
codesystem "RoleCode": '2.16.840.1.113883.5.111'

valueset "Monitoring of international normalized ratio (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Prothrombin time (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "New Oral Anticoagulants": '2.16.840.1.113883.3.1240.15.3.4003'
valueset "Mechanical heart valve replacement (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Chronic atrial fibrillation (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Venous Thromboembolism ICD10CM": '2.16.840.1.113883.3.117.1.7.1.328'
valueset "Warfarin": '2.16.840.1.113883.3.117.1.7.1.232'
valueset "Prescription (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Physician (occupation)": '2.16.840.1.113762.1.4.1096.129'
valueset "Anticoagulant Therapy": '2.16.840.1.113883.3.117.1.7.1.200'
valueset "INR": '2.16.840.1.113883.3.117.1.7.1.213'
valueset "Home Care": '2.16.840.1.113883.1.11.20275'
valueset "Face-to-Face Interaction": '2.16.840.1.113883.3.464.1003.101.12.1048'
valueset "Education about anticoagulant therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Anticoagulant therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "self": '2.16.840.1.113883.1.11.19563'
valueset "": ''

parameter MeasurementPeriod default Interval[
@2008-03-19T00:00:00.0,
null
)

context Patient

define "Devices Covered":
          ( exists (["Procedure, Performed": "Monitoring of international normalized ratio (regime/therapy)"]M
          where M.relevantPeriod during MeasurementPeriod) 
          or ( exists (["Procedure, Performed": "Prothrombin time (procedure)"]P
          where P.relevantPeriod during MeasurementPeriod) ) )

define "Condition 1":
             ( exists (["Procedure, Performed": "Mechanical heart valve replacement (procedure)"])
             or ( exists (["Diagnosis": "Chronic atrial fibrillation (disorder)"]) )
             or ( exists (["Diagnosis": "Venous Thromboembolism ICD10CM"]) and ( exists (["Medication, Administered": "Warfarin"]) ) )
              )
              and "Devices Covered"
              
define "Requirements to cover":
         if ( exists (["Procedure, Performed": "Anticoagulant Therapy"]A
           where duration in months of A.relevantPeriod > 3) )
          then "Devices Covered"
         else null
         and ( exists (["Encounter, Performed": "Face-to-Face Interaction"]) and ( exists (["Procedure, Performed": "Anticoagulant Therapy"]) ) )
         and ( exists (["Procedure, Performed": "Anticoagulant Therapy"]) and "Devices Covered" and ( exists (["Encounter, Performed": "Home Care"]) ) )  
         and ( exists (["Encounter, Performed": "self"]) and ( exists (["Procedure, Performed": "Monitoring of international normalized ratio (regime/therapy)"]MO
          where duration in weeks of MO.relevantPeriod = 1 and MO.components = 1)  ) )
          or ( exists (["Encounter, Performed": "self"]) and ( exists (["Procedure, Performed": "Monitoring of international normalized ratio (regime/therapy)"]MO
          where duration in weeks of MO.relevantPeriod = 1 and MO.components = 1)  ) )    

define "Coverage":
          "Condition 1" or "Requirements to cover"

