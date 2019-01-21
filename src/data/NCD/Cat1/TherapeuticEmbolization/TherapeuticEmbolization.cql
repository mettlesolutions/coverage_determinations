//Therapeutic Embolization
library TherapeuticEmbolization
using FHIR
include FHIRHelpers version '1.8' called FHIRHelpers

 //include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'


valueset "Embolization procedure (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Bleeding (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Embolization of renal artery (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Renal cell carcinoma (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
parameter MeasurementPeriod default @2013-12-15T00:00:00.0
context Patient

define "Condition 1(Indications and Limitations)":
      (exists (["Condition": "Bleeding (finding)"]) and (exists (["Procedure": "Embolization procedure (procedure)"]E
      where E.performed during MeasurementPeriod) ) )
       
define "Condition 2(Indications and Limitations)":
        (exists (["Condition": "Renal cell carcinoma (disorder)"]) and ( exists (["Procedure": "Embolization of renal artery (procedure)"]E
        where E.performed during MeasurementPeriod) ) )  
        
define "Coverage":
         "Condition 1(Indications and Limitations)" or "Condition 2(Indications and Limitations)"
