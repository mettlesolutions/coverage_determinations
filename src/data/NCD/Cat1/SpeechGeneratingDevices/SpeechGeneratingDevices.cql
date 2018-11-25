//SpeechGeneratingDevices


library ChlamydiaScreening_Common version '2'

using QDM version '5.3'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'

valueset "Durable medical equipment surveillance (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Specific speech impairment (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Speech therapy (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'

context Patient

define "Not Covered":
          ( exists (["Diagnosis": "Specific speech impairment (finding)"])
          and ( exists (["Procedure, Performed": "Speech therapy (regime/therapy)"])  and  ( exists (["Device, Applied": "Durable medical equipment surveillance (regime/therapy)"]) )
          ) )
          
          

          
