//MagneticResonanceSpectography

library MagneticResonanceSpectography

using FHIR
include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'

valueset "Magnetic resonance spectroscopy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Brain Tumor": '2.16.840.1.113883.17.4077.2.1026'
valueset "Lesion of brain (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Biopsy of brain tissue (procedure)": '2.16.840.1.113883.3.88.12.80.28'

parameter MeasurementPeriod default @2004-09-10T00:00:00.0
context Patient

define "Condition 1(Not Covered)":
         ( exists (["Condition": "Lesion of brain (finding)"]) 
         and ( exists (["DiagnosticReport": "Magnetic resonance spectroscopy (procedure)"]M
         where (M.effective) during MeasurementPeriod) ) )
         
define "Condition 2(Not Covered)": 
          ( exists (["Condition": "Brain Tumor"])
          and (["DiagnosticReport": "Magnetic resonance spectroscopy (procedure)"]M where (M.effective) during MeasurementPeriod) in ["Procedure": "Biopsy of brain tissue (procedure)"])
          
define "Not Covered":
          "Condition 1(Not Covered)" or "Condition 2(Not Covered)"
          
define "Coverage":
          not "Not Covered"
