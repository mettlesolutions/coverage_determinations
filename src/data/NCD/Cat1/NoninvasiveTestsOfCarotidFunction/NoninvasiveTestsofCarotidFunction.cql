library NoninvasiveTestsofCarotidFunction

using FHIR

include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": 'http://snomed.info/sct'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "ICD9CM": 'https://www.cdc.gov/nchs/icd/icd9.htm'
codesystem "RXNORM": 'https://www.nlm.nih.gov/research/umls/rxnorm/'
codesystem "ICD10CM": '2.16.840.1.113883.6.90'
codesystem "NUCCPT":''

//Carotid phonoangiography
valueset "On examination - carotid bruit (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Doppler flow mapping of head and neck (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Ophthalmodynamometry (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Ocular plethysmography (procedure)": '2.16.840.1.113883.3.88.12.80.28'

//Spectral Bruit Analysis
valueset "Diagnostic ultrasonography (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//B-Scan and Doppler Devices
//Periorbital Directional Doppler Ultrasonography
parameter MeasurementPeriod default @1980-11-15T00:00:00.0
context Patient 
 
define "Direct Test":
         (exists ([Observation: "On examination - carotid bruit (finding)"])
         or ( exists ([Procedure: "Doppler flow mapping of head and neck (procedure)"]P
         where P.performed during MeasurementPeriod) )
         or ( exists ([Procedure: "Diagnostic ultrasonography (procedure)"]D
          where D.performed during MeasurementPeriod))
         )
         
define "InDirect Test":
           ( exists ([Procedure: "Ophthalmodynamometry (procedure)"]O
           where O.performed during MeasurementPeriod) 
           or ( exists ([Procedure: "Ocular plethysmography (procedure)"]S
           where S.performed during MeasurementPeriod) )
           )
           
define "Coverage":
         "Direct Test" or "InDirect Test"
