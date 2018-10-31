//Noninvasive Tests of Carotid Function
library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT": '2.16.840.1.113883.3.88.12.80.28'
codesystem "ICD10CM": '2.16.840.1.113883.6.90'
//Carotid phonoangiography
valueset "On examination - carotid bruit (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Doppler flow mapping of head and neck (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Ophthalmodynamometry (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Ocular plethysmography (procedure)": '2.16.840.1.113883.3.88.12.80.28'

//Spectral Bruit Analysis
valueset "Diagnostic ultrasonography (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//B-Scan and Doppler Devices
//Periorbital Directional Doppler Ultrasonography

context Patient 
 
define "Direct Test":
         (exists (["Physical Exam, Performed": "On examination - carotid bruit (finding)"])
         or ( exists (["Device, Applied": "Doppler flow mapping of head and neck (procedure)"]) )
         or ( exists (["Device, Applied": "Diagnostic ultrasonography (procedure)"]) )
         )
         
define "InDirect Test":
           ( exists (["Procedure, Performed": "Ophthalmodynamometry (procedure)"]) 
           or ( exists (["Procedure, Performed": "Ocular plethysmography (procedure)"]) )
           )
           
define "Coverage":
         "Direct Test" or "InDirect Test"
