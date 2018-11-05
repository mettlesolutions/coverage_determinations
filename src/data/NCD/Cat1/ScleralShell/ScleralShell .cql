//ScleralShell 

library ChlamydiaScreening_Common version '2'

using QDM version '5.3'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'

valueset "Provision of scleral contact lens (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Disorder of lacrimal gland (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Dry eyes (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Acute inflammatory disease (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "": ''

context Patient

define "Covered":
          if exists (["Diagnosis": "Disorder of lacrimal gland (disorder)"]) and ( exists (["Diagnosis": "Dry eyes (finding)"]) ) 
          then ["Procedure, Performed": "Provision of scleral contact lens (procedure)"]
          else null
                   
define "Coverage":
          "Covered"
