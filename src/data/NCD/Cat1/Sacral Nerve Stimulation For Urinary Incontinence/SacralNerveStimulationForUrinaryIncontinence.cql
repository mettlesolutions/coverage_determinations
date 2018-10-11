//Sacral Nerve Stimulation For Urinary Incontinence
library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'

valueset "Implantation of sacral nerve stimulator (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Urge incontinence of urine (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Finding of frequency of urination (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Urinary retention": '2.16.840.1.113762.1.4.1164.50'
valueset "Temporary operation (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Traditional therapy (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Pharmacological assessment (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Urinary incontinence (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Urinary tract obstruction (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Neurological disorder confirmed (situation)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "General anesthesia (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Urinary frequency volume chart (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Stimulation test (procedure)": '2.16.840.1.113883.3.88.12.80.28'

context Patient

define "Condition 1(Indications)":
           ["Diagnosis": "Urge incontinence of urine (finding)"]
           or ["Diagnosis": "Finding of frequency of urination (finding)"]
           or ["Diagnosis": "Urinary retention"]
           union ["Procedure, Performed": "Implantation of sacral nerve stimulator (procedure)"]
           
define "Condition 2(Indications)":
          ["Procedure, Performed": "Stimulation test (procedure)"] union ["Procedure, Performed": "Implantation of sacral nerve stimulator (procedure)"]
          
                   
define "Indications": 
          "Condition 1(Indications)" union "Condition 2(Indications)"
          
define "Condition 1(Limitations)":
           ["Procedure, Performed": "Traditional therapy (regime/therapy)"]
           union ["Procedure, Performed": "General anesthesia (procedure)"]
           
define "Condition 2(Limitations)":
           ["Diagnosis": "Urinary incontinence (finding)"]
           or ["Diagnosis": "Urinary tract obstruction (disorder)"]
           or ["Diagnosis": "Neurological disorder confirmed (situation)"]
           union ["Procedure, Performed": "Implantation of sacral nerve stimulator (procedure)"]
           
           
define "Condition 3(Limitations)":
            ["Procedure, Performed": "Stimulation test (procedure)"]ST union ["Procedure, Performed": "Implantation of sacral nerve stimulator (procedure)"] ST1
            where ST. Result > 50 '%'
    
define "Condition 4(Limitations)":
            ["Assessment, Performed": "Urinary frequency volume chart (procedure)"]
            
define "Limitations":
       "Condition 1(Limitations)" union "Condition 2(Limitations)" union "Condition 3(Limitations)" union "Condition 4(Limitations)"
            
define "Coverage":
         "Indications" union "Limitations"             
           
