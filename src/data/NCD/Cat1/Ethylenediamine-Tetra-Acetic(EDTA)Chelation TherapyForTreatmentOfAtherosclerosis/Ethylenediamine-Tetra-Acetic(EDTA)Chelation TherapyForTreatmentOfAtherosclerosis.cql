library EthylenediamineTetraAceticChelationTherapyforTreatmentofAtherosclerosis

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
codesystem "ICD10CM": '2.16.840.1.113883.6.90'
codesystem "NUCCPT":''

valueset "Calcinosis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Coronary arteriosclerosis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Atherosclerosis (morphologic abnormality)": '2.16.840.1.113883.3.88.12.3221.8.9'
//valueset "Copper EDTA": '2.16.840.1.113762.1.4.1010.7'

context Patient

define "Not Covered":
           ( exists ([Condition: "Calcinosis (disorder)"])
           or ( exists ([Condition: "Coronary arteriosclerosis (disorder)"]) )
           or ( exists ([Condition: "Atherosclerosis (morphologic abnormality)"]) ) )

define "Coverage":
          not "Not Covered"
