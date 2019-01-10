//singlephotonemissioncomputedtomograph

library singlephotonemissioncomputedtomograph
using FHIR

include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
codesystem "LOINC": '2.16.840.1.113883.6.1'

valueset "SPECT Whole body": '2.16.840.1.113883.3.464.1003.198.11.1055'
valueset "Stress fracture (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Spondylosis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Infective discitis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
//osteoid osteoma
/*analyze blood flow to an organ, as in the case of myocardial viability.
differentiate ischemic heart disease from dilated cardiomyopathy.*/

parameter MeasurementPeriod default @2002-10-01T00:00:00.0
context Patient

define "Diseases":
        ( exists (["Condition": "Stress fracture (disorder)"])
        or ( exists (["Condition": "Spondylosis (disorder)"]) )
        or ( exists (["Condition": "Infective discitis (disorder)"]) )
        )
        
define "Covered":
          "Diseases" and ( exists (["DiagnosticReport": "SPECT Whole body"]D
          where (D.effective) during MeasurementPeriod) )
          
define "Coverage":
          "Covered"
         
