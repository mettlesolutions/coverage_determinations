//Vertebral Artery Surgery
library ChlamydiaScreening_Common version '2'

using QDM version '5.3'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'

valueset "Dizziness (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Vertebral artery obstruction (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Vertigo (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Numbness (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Nausea and vomiting (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Slurred speech (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Loss of consciousness (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Weakness present (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Unable to balance (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Difficulty swallowing (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Endarterectomy of vertebral artery (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Bypass of vertebral artery (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Degenerative brain disorder (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Orthostatic hypotension (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Acoustic neuroma (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Labyrinthitis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Diabetes mellitus (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hypoglycemia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Intravascular obstruction (morphologic abnormality)": '2.16.840.1.113883.3.88.12.3221.8.9'
valueset "Osteophyte of bone (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Malignant neoplasm of subcutaneous fibrous tissue (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Arterial tortuosity syndrome (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Kinking of transplanted artery (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Bandaging and sling support (procedure)": '2.16.840.1.113762.1.4.1032.36'
valueset "Plain radiography (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Subclavian steal syndrome (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Diagnostic radiography, serial films (procedure)": '2.16.840.1.113883.3.88.12.80.28'


define "Symptoms Of Vertebral Artery Obstruction":
          ["Symptom": "Dizziness (finding)"]
          or ["Symptom": "Vertigo (finding)"]
          or ["Symptom": "Numbness (finding)"]
          or ["Symptom": "Nausea and vomiting (disorder)"]
          or ["Symptom": "Slurred speech (finding)"]
          or ["Symptom": "Loss of consciousness (finding)"]
          or ["Symptom": "Weakness present (finding)"]
          or ["Symptom": "Unable to balance (finding)"]
          or ["Symptom": "Difficulty swallowing (finding)"]
          
define "Dieseases":
           ["Diagnosis": "Degenerative brain disorder (disorder)"]
           or ["Diagnosis": "Orthostatic hypotension (disorder)"] 
           or ["Diagnosis": "Acoustic neuroma (disorder)"] 
           or ["Diagnosis": "Labyrinthitis (disorder)"]
           or ["Diagnosis": "Diabetes mellitus (disorder)"]
           or ["Diagnosis": "Hypoglycemia (disorder)"]
                   
define "Surgical Procedures":
           ["Procedure, Performed": "Endarterectomy of vertebral artery (procedure)"]
           or ["Procedure, Performed": "Bypass of vertebral artery (procedure)"]
           
define "Obstructions":
          ["Diagnosis": "Intravascular obstruction (morphologic abnormality)"]
          or ["Diagnosis": "Osteophyte of bone (disorder)"]
          or ["Diagnosis": "Malignant neoplasm of subcutaneous fibrous tissue (disorder)"] 
          
define "Controversial Obstructions":
         ["Diagnosis": "Arterial tortuosity syndrome (disorder)"]
         or ["Diagnosis": "Kinking of transplanted artery (disorder)"]
         or ["Diagnosis": "Malignant neoplasm of subcutaneous fibrous tissue (disorder)"]
         
define "Condition 1(Indications and Limitations)":
           "Symptoms Of Vertebral Artery Obstruction" union "Surgical Procedures"
           or ["Diagnostic Study, Performed": "Plain radiography (procedure)"] union ["Diagnosis": "Vertebral artery obstruction (disorder)"]
           union "Surgical Procedures"         
          
define "Condition 2(Indications and Limitations)":
           ["Diagnosis": "Subclavian steal syndrome (disorder)"] union ["Diagnostic Study, Performed": "Diagnostic radiography, serial films (procedure)"]       
          
           
define "Condition 3(Indications and Limitations)":
         ["Diagnosis": "Vertebral artery obstruction (disorder)"] and "Dieseases"
           union "Surgical Procedures"

define "Condition 4(Indications and Limitations)": 
           "Obstructions" union "Symptoms Of Vertebral Artery Obstruction"
           
define "Condition 5(Indications and Limitations)":
          "Obstructions" union "Controversial Obstructions"

define "Coverage":
          "Condition 1(Indications and Limitations)" union "Condition 2(Indications and Limitations)" union "Condition 3(Indications and Limitations)" union "Condition 4(Indications and Limitations)" union "Condition 5(Indications and Limitations)"          



                   

