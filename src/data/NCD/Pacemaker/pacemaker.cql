library ChlamydiaScreening_Common version '2'

using QDM version '5.3'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Bradycardia": '2.16.840.1.113883.3.526.3.412'
valueset "Sinoatrial node dysfunction" : '2.16.840.1.113883.6.103'
valueset "Atrio-ventricular-junctional (nodal) bradycardia (disorder)": '2.16.840.1.113883.6.96'
valueset "Sinus bradycardia (disorder)": '2.16.840.1.113883.6.96'
valueset "Severe sinus bradycardia (disorder)": '2.16.840.1.113883.6.96'
valueset "Tachycardia" : '2.16.840.1.113883.3.666.5.2086'
valueset "Acute Myocardial Infarction": '2.16.840.1.113883.3.666.5.1958'
valueset "Atrial Fibrillation/Flutter": '2.16.840.1.113883.3.117.1.7.1.202'
valueset "Second degree atrioventricular block (disorder)": '2.16.840.1.113883.6.96'
valueset "Mobitz type I incomplete atrioventricular block (disorder)":'2.16.840.1.113883.6.96'
valueset "Atrioventricular block, complete": '2.16.840.1.113883.6.90'
valueset "Atrioventricular block (disorder)": '2.16.840.1.113883.6.96'
valueset "Atrioventricular block, second degree": '2.16.840.1.113883.6.90'
valueset "Complete atrioventricular block (disorder)": '2.16.840.1.113883.6.96'
valueset "Atrioventricular Block": '2.16.840.1.113883.3.526.3.367'
valueset "Intermittent second degree atrioventricular block (disorder)":'2.16.840.1.113883.6.96'
valueset "Drug-induced bradycardia (disorder)": '2.16.840.1.113883.6.96'
valueset "Heart rate": '2.16.840.1.113762.1.4.1104.1'
valueset "Syncope (disorder)":'2.16.840.1.113883.6.96'
valueset "Seizure (finding)":'2.16.840.1.113883.6.96'
valueset "Confusional state (disorder)":'2.16.840.1.113883.6.96'
valueset "Dizziness (finding)": '2.16.840.1.113883.6.96'
valueset "Adverse Clinical Reaction":'2.16.840.1.113883.3.2074.1.1.30'

context Patient

define "Symptomatic":
    ["Physical Exam, Performed": "Heart rate"]H 
    where H.result < 60 'beats per minute'
    or ["Diagnosis": "Syncope (disorder)"]
    or ["Diagnosis": "Seizure (finding)"]
    or ["Diagnosis": "Confusional state (disorder)"]
    or ["Diagnosis": "Dizziness (finding)"]
   
define "Asymptomatic":
    ["Physical Exam, Performed": "Heart rate"]H
    where H.result > 60 'beats per minute'
    
    
define "Non Coverage":
   ["Diagnosis": "Atrioventricular block (disorder)"] and "Asymptomatic"
    or ["Diagnosis": "Drug-induced bradycardia (disorder)"] 
    or ["Diagnosis": "Intermittent second degree atrioventricular block (disorder)"] and "Symptomatic"
    or ["Diagnosis": "Mobitz type I incomplete atrioventricular block (disorder)"] 
    or ["Diagnosis": "Atrial Fibrillation/Flutter"]
    or ["Diagnosis": "Acute Myocardial Infarction"] and "Asymptomatic"
    or ["Diagnosis": "Tachycardia"]
    or ["Diagnosis": "Severe sinus bradycardia (disorder)"] and "Asymptomatic"
    or ["Diagnosis": "Atrio-ventricular-junctional (nodal) bradycardia (disorder)"]
    
define "Coverage for Pacemaker":
   ["Diagnosis": "Second degree atrioventricular block (disorder)"] and not "Non Coverage" and "Symptomatic"
     or ["Diagnosis": "Atrioventricular block, complete"] and not "Non Coverage" and "Symptomatic"
     or ["Diagnosis": "Sinoatrial node dysfunction"] and not "Non Coverage" and "Symptomatic"
     

valueset "Bradycardia": '2.16.840.1.113883.3.526.3.412'
valueset "Sinoatrial node dysfunction" : '2.16.840.1.113883.6.103'
valueset "Atrio-ventricular-junctional (nodal) bradycardia (disorder)": '2.16.840.1.113883.6.96'
valueset "Sinus bradycardia (disorder)": '2.16.840.1.113883.6.96'
valueset "Severe sinus bradycardia (disorder)": '2.16.840.1.113883.6.96'
valueset "Tachycardia" : '2.16.840.1.113883.3.666.5.2086'
valueset "Acute Myocardial Infarction": '2.16.840.1.113883.3.666.5.1958'
valueset "Atrial Fibrillation/Flutter": '2.16.840.1.113883.3.117.1.7.1.202'
valueset "Second degree atrioventricular block (disorder)": '2.16.840.1.113883.6.96'
valueset "Mobitz type I incomplete atrioventricular block (disorder)":'2.16.840.1.113883.6.96'
valueset "Atrioventricular block, complete": '2.16.840.1.113883.6.90'
valueset "Atrioventricular block (disorder)": '2.16.840.1.113883.6.96'
valueset "Atrioventricular block, second degree": '2.16.840.1.113883.6.90'
valueset "Complete atrioventricular block (disorder)": '2.16.840.1.113883.6.96'
valueset "Atrioventricular Block": '2.16.840.1.113883.3.526.3.367'
valueset "Intermittent second degree atrioventricular block (disorder)":'2.16.840.1.113883.6.96'
valueset "Drug-induced bradycardia (disorder)": '2.16.840.1.113883.6.96'
valueset "Heart rate": '2.16.840.1.113762.1.4.1104.1'

context Patient

define "Symptomatic":
    ["Physical Exam, Performed": "Heart rate"]H
    where H.result < 60 'beats per minute' 
    
define "Asymptomatic":
    ["Physical Exam, Performed": "Heart rate"]H
    where H.result > 60 'beats per minute'
    
define "Non Coverage":
   ["Diagnosis": "Atrioventricular block (disorder)"] and "Asymptomatic"
    or ["Diagnosis": "Drug-induced bradycardia (disorder)"] 
    or ["Diagnosis": "Intermittent second degree atrioventricular block (disorder)"] and "Symptomatic"
    or ["Diagnosis": "Mobitz type I incomplete atrioventricular block (disorder)"] 
    or ["Diagnosis": "Atrial Fibrillation/Flutter"]
    or ["Diagnosis": "Acute Myocardial Infarction"] and "Asymptomatic"
    or ["Diagnosis": "Tachycardia"]
    or ["Diagnosis": "Severe sinus bradycardia (disorder)"] and "Asymptomatic"
    or ["Diagnosis": "Atrio-ventricular-junctional (nodal) bradycardia (disorder)"]
    
define "Coverage for Pacemaker":
   ["Diagnosis": "Second degree atrioventricular block (disorder)"] and not "Non Coverage"
     or ["Diagnosis": "Atrioventricular block, complete"] and not "Non Coverage"
     or ["Diagnosis": "Sinoatrial node dysfunction"] and not "Non Coverage"
