//Treatment of kidney stones
library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'


valueset "Total nephrectomy (procedure)": '2.16.840.1.113762.1.4.1018.240'
valueset "Extracorporeal shockwave lithotripsy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Ureteric stone (disorder)": '2.16.840.1.113883.17.4077.3.2008'
valueset "Kidney stone (disorder)": '2.16.840.1.113883.17.4077.3.2008'
valueset "Simple nephrolithotomy (procedure)": '2.16.840.1.113883.3.666.5.2310'
valueset "Electrohydraulic lithotripsy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//mechanical lithotripsy
valueset "Renal stone (substance)": '2.16.840.1.113762.1.4.1010.2'
valueset "Cystoscopy normal (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Urolithiasis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Percutaneous nephrolithotomy using fluoroscopic guidance (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Ultrasound scan of kidney and ureters (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Transurethral ureterorenoscopy (procedure)": '2.16.840.1.113883.3.88.12.80.28'

context Patient


define "Extracorporeal Shock Wave Lithotripsy":
             ["Diagnosis": "Urolithiasis (disorder)"] union ["Procedure, Performed": "Extracorporeal shockwave lithotripsy (procedure)"]

define "Percutaneous Lithotripsy":
            ["Procedure, Performed": "Percutaneous nephrolithotomy using fluoroscopic guidance (procedure)"] union ["Procedure, Performed": "Ultrasound scan of kidney and ureters (procedure)"]
            or ["Procedure, Performed": "Percutaneous nephrolithotomy using fluoroscopic guidance (procedure)"] union ["Procedure, Performed": "Electrohydraulic lithotripsy (procedure)"]

define "Transurethral Ureteroscopic Lithotripsy":
          ["Diagnosis": "Urolithiasis (disorder)"] or ["Diagnosis": "Ureteric stone (disorder)"] 
          union ["Procedure, Performed": "Transurethral ureterorenoscopy (procedure)"]    
            
define "Coverage":
          "Extracorporeal Shock Wave Lithotripsy" union "Percutaneous Lithotripsy" union "Transurethral Ureteroscopic Lithotripsy"           
             
    
