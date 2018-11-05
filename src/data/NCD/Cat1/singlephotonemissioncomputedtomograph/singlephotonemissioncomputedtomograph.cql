//singlephotonemissioncomputedtomograph

library ChlamydiaScreening_Common version '2'

using QDM version '5.3'

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
valueset "": ''

context Patient

define "Diseases":
        ( exists (["Diagnosis": "Stress fracture (disorder)"])
        or ( exists (["Diagnosis": "Spondylosis (disorder)"]) )
        or ( exists (["Diagnosis": "Infective discitis (disorder)"]) )
        )
        
define "Covered":
          "Diseases" and ( exists (["Diagnostic Study, Performed": "SPECT Whole body"]) )
          
define "Coverage":
          "Covered"
         
