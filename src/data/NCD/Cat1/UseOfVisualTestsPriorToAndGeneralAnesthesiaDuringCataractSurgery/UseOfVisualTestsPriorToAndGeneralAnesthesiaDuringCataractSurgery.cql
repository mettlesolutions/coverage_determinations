//UseOfVisualTestsPriorToAndGeneralAnesthesiaDuringCataractSurgery
library ChlamydiaScreening_Common version '2'

using QDM

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

context Patient

define "Scan Methods":
           ( exists (["Diagnostic Study, Performed": "Ophthalmic echography, A-mode (procedure)"])
           or ( exists (["Diagnostic Study, Performed": "Orbital B scan (procedure)"]) ) )

define "Condition 1(Pre-Surgery Evaluations)":
          ( exists (["Procedure, Performed": "Cataract extraction and insertion of intraocular lens (procedure)"])
          and  ( exists (["Procedure, Performed": "Preoperative procedure (procedure)"]) ) )
          
define "Condition 2(Pre-Surgery Evaluations)":
           if exists (["Diagnosis": "Nuclear sclerotic cataract (disorder)"])
             then ( exists (["Diagnostic Study, Performed": "Ophthalmic echography, A-mode (procedure)"]) )
           else null
          
define "Condition 3(Pre-Surgery Evaluations)":
            
           if exists (["Diagnosis": "Posterior capsular opacification (disorder)"]) then ( exists (["Procedure, Performed": "Orbital B scan (procedure)"]) )
           else null    
          
define "Condition 4(Pre-Surgery Evaluations)":
            if  ( exists (["Diagnosis": "Cataract (disorder)"]) )
              then ( exists (["Assessment, Performed": "Comprehensive eye examination (procedure)"]) and "Scan Methods" ) 
            else
              ( exists (["Encounter, Performed": "Summary report (record artifact)"]) )
                         
               
define "Condition 1(General Anesthesia)":
           ( exists (["Medication, Administered": "General anesthesia (procedure)"
           included in ["Procedure, Performed": "Cataract surgery (procedure)"]]) )
           
define "Covered":
         "Condition 1(Pre-Surgery Evaluations)" or "Condition 2(Pre-Surgery Evaluations)" or "Condition 3(Pre-Surgery Evaluations)" or "Condition 1(General Anesthesia)"                    
 
