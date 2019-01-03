//PhotodynamicTherapy
library PhotodynamicTherapy

using FHIR version '1.8'
include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT": '2.16.840.1.113883.3.88.12.80.28'

valueset "Photodynamic therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Eye infection (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Verteporfin Injection [Visudyne]": '2.16.840.1.113762.1.4.1010.5'
valueset "Classic choroidal neovascular membrane (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Occult choroidal neovascular membrane (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Age-related macular degeneration (disorder)": '2.16.840.1.113762.1.4.1018.240'
valueset "Fluorescein angiography of eye (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Visual acuity testing (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Atrophic retina (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Nonexudative age-related macular degeneration (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Pathologic Myopia": '2.16.840.1.113883.3.526.2.1587'
valueset "Ocular histoplasmosis syndrome (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Excision of retinal lesion (procedure)": '2.16.840.1.113883.3.88.12.80.28'
parameter MeasurementPeriod default @2013-07-16T00:00:00.0

context Patient

define "Ocular photodynamic therapy":
        ( exists (["Condition": "Eye infection (disorder)"]) and ( exists (["Procedure": "Photodynamic therapy (procedure)"]P
        where P.performed during MeasurementPeriod) ) )
        
define "Condition 1(Covered)":
         ( exists (["Procedure": "Photodynamic therapy (procedure)"]T where T.performed during MeasurementPeriod) 
         and ( exists (["MedicationAdministration": "Verteporfin Injection [Visudyne]"]) ) ) 
         
define "Condition 2(Covered)":
          ( exists (["DiagnosticReport": "Fluorescein angiography of eye (procedure)"]) )
           and ( exists (["Condition": "Age-related macular degeneration (disorder)"]) and ( exists (["Condition": "Classic choroidal neovascular membrane (disorder)"]) ))

define "Condition 1(Not Covered)": 
        ( exists (["Condition": "Age-related macular degeneration (disorder)"]) and ( exists (["Condition": "Occult choroidal neovascular membrane (disorder)"]) ) and not ( exists (["Condition": "Classic choroidal neovascular membrane (disorder)"]) ) )       
 
define "Condition 2(Not Covered)":
        ( exists (["Condition": "Classic choroidal neovascular membrane (disorder)"])
        or ( exists (["Condition": "Atrophic retina (disorder)"]) )
        or ( exists (["Condition": "Nonexudative age-related macular degeneration (disorder)"]) ) )     
        
define "Condition 3(Covered)":
          ( exists (["Condition": "Pathologic Myopia"])
          or exists (["Condition": "Ocular histoplasmosis syndrome (disorder)"]) )
          
define "Covered":
         "Condition 1(Covered)" or "Condition 2(Covered)" or "Condition 3(Covered)"
         
define "Not Covered":
         "Condition 1(Not Covered)" or "Condition 2(Not Covered)"
