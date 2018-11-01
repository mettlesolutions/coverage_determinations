//OutpatientHospitalServicesforTreatmentofAlcoholism

library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT": '2.16.840.1.113883.3.88.12.80.28'


valueset "Diagnostic procedure (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Therapeutic procedure (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Alcoholism (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hospital admission (procedure)": '2.16.840.1.113883.3.88.12.80.28'

context Patient

define "Procedure For Coverage":
         ( exists (["Procedure, Performed": "Therapeutic procedure (procedure)"])
          or ( exists (["Procedure, Performed": "Diagnostic procedure (procedure)"]) )
          )

define "Coverage":
        ( exists (["Diagnosis": "Alcoholism (disorder)"])  and ( exists (["Procedure, Performed": "Hospital admission (procedure)"]) )) and "Procedure For Coverage"
        
         
         
