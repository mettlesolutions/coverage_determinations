//UseOfVisualTestsPriorToAndGeneralAnesthesiaDuringCataractSurgery
library UseOfVisualTestsPriorToAndGeneralAnesthesiaDuringCataractSurgery

using FHIR
include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'

valueset "Cataract extraction and insertion of intraocular lens (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Preoperative procedure (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Comprehensive eye examination (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Physician (occupation)": '2.16.840.1.113762.1.4.1096.129'
valueset "General anesthesia (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Cataract surgery (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Cataract (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Nuclear cataract (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Orbital B scan (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Ophthalmic echography, A-mode (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Posterior capsular opacification (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Standard electrocardiogram (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Complete blood count (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Nuclear sclerotic cataract (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Summary report (record artifact)": '2.16.840.1.113762.1.4.1116.529'
//ophthalmologists

parameter MeasurementPeriod default @1992-08-31T00:00:00.0

context Patient

define "Scan Methods":
           ( exists (["DiagnosticReport": "Ophthalmic echography, A-mode (procedure)"] O
           where (O.effective) during MeasurementPeriod)
           or ( exists (["DiagnosticReport": "Orbital B scan (procedure)"]B
           where (B.effective) during MeasurementPeriod) ) )

define "Condition 1(Pre-Surgery Evaluations)":
          ( exists (["Procedure": "Cataract extraction and insertion of intraocular lens (procedure)"])
          and  ( exists (["Procedure": "Preoperative procedure (procedure)"]) ) )
          
define "Condition 2(Pre-Surgery Evaluations)":
           if exists (["Condition": "Nuclear sclerotic cataract (disorder)"])
             then ( exists (["DiagnosticReport": "Ophthalmic echography, A-mode (procedure)"]) )
           else null
          
define "Condition 3(Pre-Surgery Evaluations)":
            
           if exists (["Condition": "Posterior capsular opacification (disorder)"]) then ( exists (["Procedure": "Orbital B scan (procedure)"]) )
           else null    
          
define "Condition 4(Pre-Surgery Evaluations)":
            if  ( exists (["Condition": "Cataract (disorder)"]) )
              then ( exists (["Observation": "Comprehensive eye examination (procedure)"]) and "Scan Methods" ) 
            else
              ( exists (["Encounter": "Summary report (record artifact)"]) )
                         
               
define "Condition 1(General Anesthesia)":
           ( exists (["MedicationAdministration": "General anesthesia (procedure)"
           included in ["Procedure": "Cataract surgery (procedure)"]]) )
           
define "Covered":
         "Condition 1(Pre-Surgery Evaluations)" or "Condition 2(Pre-Surgery Evaluations)" or "Condition 3(Pre-Surgery Evaluations)" or "Condition 1(General Anesthesia)"                    
 
 
define "Coverage":
		"Covered"
