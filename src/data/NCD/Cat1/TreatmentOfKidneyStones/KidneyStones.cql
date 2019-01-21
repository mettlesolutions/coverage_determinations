//Treatment of kidney stones
library Treatmentofkidneystones

using FHIR
include FHIRHelpers version '1.8' called FHIRHelpers

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
parameter MeasurementPeriod default @1988-01-16T00:00:00.0


context Patient


define "Extracorporeal Shock Wave Lithotripsy":
          ( exists (["Condition": "Urolithiasis (disorder)"]) and (exists["Procedure": "Extracorporeal shockwave lithotripsy (procedure)"] ) )

define "Percutaneous Lithotripsy":
           (exists(["Procedure": "Percutaneous nephrolithotomy using fluoroscopic guidance (procedure)"]P
           where P.performed on or after MeasurementPeriod) and 
           (exists["Procedure": "Ultrasound scan of kidney and ureters (procedure)"] )
            or (exists(["Procedure": "Percutaneous nephrolithotomy using fluoroscopic guidance (procedure)"])
             and (exists ["Procedure": "Electrohydraulic lithotripsy (procedure)"] ) )
            )
           
define "Transurethral Ureteroscopic Lithotripsy":
      		(exists(["Condition": "Urolithiasis (disorder)"]) and (exists ["Procedure": "Transurethral ureterorenoscopy (procedure)"]P
      		where P.performed on or after MeasurementPeriod)
       or (exists(["Condition": "Ureteric stone (disorder)"]) and (exists ["Procedure": "Transurethral ureterorenoscopy (procedure)"]T
       where T.performed on or after MeasurementPeriod) )
       )
       
            
define "Coverage":
         "Extracorporeal Shock Wave Lithotripsy" or "Percutaneous Lithotripsy" or "Transurethral Ureteroscopic Lithotripsy"     
          
   
