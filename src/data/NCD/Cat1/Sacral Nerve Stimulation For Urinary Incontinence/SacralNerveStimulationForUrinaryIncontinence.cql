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
valueset "Peripheral nerve disease (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "General anesthesia (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Urinary frequency volume chart (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Stimulation test (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Functional urinary incontinence (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Secondary peripheral neuropathy (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'


context Patient

define "Condition 1(Indications)":
          ( exists(["Diagnosis": "Urge incontinence of urine (finding)"] union ["Procedure, Performed": "Implantation of sacral nerve stimulator (procedure)"])
           or ( exists(["Diagnosis": "Finding of frequency of urination (finding)"] union ["Procedure, Performed": "Implantation of sacral nerve stimulator (procedure)"] ) )
           or ( exists(["Diagnosis": "Urinary retention"] union ["Procedure, Performed": "Implantation of sacral nerve stimulator (procedure)"] ) )
           )
define "Condition 2(Indications)":
         ( exists (["Procedure, Performed": "Stimulation test (procedure)"] union ["Procedure, Performed": "Implantation of sacral nerve stimulator (procedure)"]) )
           
define "Indications": 
       "Condition 1(Indications)" and "Condition 2(Indications)"
       
define "Condition 1(Limitations)":
           ( exists (["Procedure, Performed": "Traditional therapy (regime/therapy)"]
           union ["Procedure, Performed": "General anesthesia (procedure)"])
           )
           
           
define "Condition 2(Limitations)":
        ( exists(["Diagnosis": "Urinary incontinence (finding)"] union ["Procedure, Performed": "Implantation of sacral nerve stimulator (procedure)"])
           or ( exists(["Diagnosis": "Urinary tract obstruction (disorder)"] union ["Procedure, Performed": "Implantation of sacral nerve stimulator (procedure)"]) )
           or ( exists(["Diagnosis": "Peripheral nerve disease (disorder)"] union ["Procedure, Performed": "Implantation of sacral nerve stimulator (procedure)"]) )
         )  
 
define "Condition for Condition 3(Limitations)":
                 ( exists  (["Procedure, Performed": "Stimulation test (procedure)"]ST
                  where ST.result > 50 '%' ) )  
                   
define "Condition 3(Limitations)":
          "Condition for Condition 3(Limitations)" 
          and ( exists  (["Procedure, Performed": "Implantation of sacral nerve stimulator (procedure)"] ) )
                 
define "Condition 4(Limitations)":
            ( exists  (["Assessment, Performed": "Urinary frequency volume chart (procedure)"] ) )
            
define "Limitations":
       "Condition 1(Limitations)" and "Condition 2(Limitations)" and "Condition 3(Limitations)" and "Condition 4(Limitations)"
       
           
define "Not Covered":
        ( exists(["Diagnosis": "Functional urinary incontinence (finding)"])  or ( exists(["Diagnosis": "Secondary peripheral neuropathy (disorder)"] ) )
           )
define "Coverage":
         "Indications" and "Limitations" and not "Not Covered"
