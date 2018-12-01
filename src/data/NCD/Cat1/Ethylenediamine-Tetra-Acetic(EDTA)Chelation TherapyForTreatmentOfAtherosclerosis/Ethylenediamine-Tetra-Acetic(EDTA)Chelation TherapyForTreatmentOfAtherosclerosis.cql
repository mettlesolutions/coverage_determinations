//Ethylenediamine-Tetra-Acetic (EDTA) Chelation Therapy for Treatment of Atherosclerosis



library ChlamydiaScreening_Common version '2'

using QDM version '5.3'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
codesystem "ICD10CM": '2.16.840.1.113883.6.90'

valueset "Calcinosis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Coronary arteriosclerosis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Atherosclerosis (morphologic abnormality)": '2.16.840.1.113883.3.88.12.3221.8.9'
//valueset "Copper EDTA": '2.16.840.1.113762.1.4.1010.7'

context Patient

define "Not Covered":
           ( exists (["Diagnosis": "Calcinosis (disorder)"])
           or ( exists (["Diagnosis": "Coronary arteriosclerosis (disorder)"]) )
           or ( exists (["Diagnosis": "Atherosclerosis (morphologic abnormality)"]) ) )

define "Coverage":
          not "Not Covered"
