//Speech-LanguagePathologyServicesfortheTreatmentofDysphagia
library SpeechLanguagePathologyServicesfortheTreatmentofDysphagia

using FHIR

include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.3.88.12.3221.7.4'

valueset "Speech-Language Pathology and Related Disorders Prevention Treatment": '2.16.840.1.113883.3.117.1.7.1.228'
valueset "Dysphagia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
parameter MeasurementPeriod default @2006-10-02T00:00:00.0
context Patient

define "Coverage":
         ( exists (["Condition": "Dysphagia (disorder)"])
         and ( exists (["Procedure": "Speech-Language Pathology and Related Disorders Prevention Treatment"]S
         where S.performed during MeasurementPeriod) )
         )
