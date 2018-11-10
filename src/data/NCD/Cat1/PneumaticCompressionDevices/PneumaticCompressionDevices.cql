//PneumaticCompressionDevices


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

valueset "Lymphedema (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Ulcer of limb due to chronic venous insufficiency (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Application of intermittent pneumatic compression device (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Home visit (procedure)": '2.16.840.1.113883.3.464.1003.101.12.1016'
valueset "Conservative therapy (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Physician (occupation)": '2.16.840.1.113762.1.4.1096.129'
valueset "Application of graduated compression garment (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Exercises (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
//elevation of the limb
valueset "Stasis dermatitis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Edema (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Venous ulcer of leg (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Prognosis uncertain (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Venous stasis (finding)": '2.16.840.1.113762.1.4.1018.240'
valueset "Swelling of limb (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Sensation of heaviness in limbs (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Aching pain (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Fibrosis of the skin (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Localized edema (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Pain in leg, unspecified": '2.16.840.1.113762.1.4.1116.315'

context Patient

define "Symptoms Of chronic venous insufficiency":
          ( exists (["Symptom": "Localized edema (finding)"])
          or ( exists (["Symptom": "Pain in leg, unspecified"]) ) )

define "Symptoms Of Lymphedema":
          ( exists (["Symptom": "Swelling of limb (finding)"])
          or ( exists (["Symptom": "Sensation of heaviness in limbs (finding)"]) )
          or ( exists (["Symptom": "Aching pain (finding)"]) ) 
          or ( exists (["Symptom": "Fibrosis of the skin (disorder)"]) ) )

define "Condition 1(Lymphedema)":
          ( exists (["Diagnosis": "Lymphedema (disorder)"])
          and ( exists (["Procedure, Performed": "Application of intermittent pneumatic compression device (procedure)"]AI
          where duration in days of AI.relevantPeriod = 28 and AI.authorDatetime= "Physician (occupation)") ) )
          
define "Lymphedema Coverage":
          "Condition 1(Lymphedema)"
          
define "Condition for Chronic Venous Insufficiency":
          ( exists (["Procedure, Performed": "Conservative therapy (regime/therapy)"]CT
          where duration in months of CT.relevantPeriod > 6 and CT.authorDatetime = "Physician (occupation)") )
         
define "Condition 1(Chronic Venous Insufficiency With Venous Stasis Ulcers)":
           if "Condition for Chronic Venous Insufficiency"  
           then ["Device, Applied": "Application of intermittent pneumatic compression device (procedure)"]
           else null
           
define "General":
        ( exists (["Diagnosis": "Prognosis uncertain (finding)"]) 
        and "Symptoms Of chronic venous insufficiency" and "Symptoms Of Lymphedema" )
           
define "Coverage":
         "Lymphedema Coverage" or "Condition 1(Chronic Venous Insufficiency With Venous Stasis Ulcers)" or "General"
