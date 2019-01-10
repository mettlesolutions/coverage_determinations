library SpeechGeneratingDevices

using FHIR

include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": 'http://snomed.info/sct'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "ICD9CM": 'https://www.cdc.gov/nchs/icd/icd9.htm'
codesystem "RXNORM": 'https://www.nlm.nih.gov/research/umls/rxnorm/'

valueset "Durable medical equipment surveillance (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Specific speech impairment (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Speech therapy (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'

parameter MeasurementPeriod default @2015-09-21T00:00:00.0

context Patient

define "Not Covered":
          ( exists ([Condition: "Specific speech impairment (finding)"])
          and ( exists ([Procedure: "Speech therapy (regime/therapy)"]S where S.performed during MeasurementPeriod)  and  ( exists ([Procedure: "Durable medical equipment surveillance (regime/therapy)"]) )
          ) )
          
define "Coverage":
		not "Not Covered"
          
