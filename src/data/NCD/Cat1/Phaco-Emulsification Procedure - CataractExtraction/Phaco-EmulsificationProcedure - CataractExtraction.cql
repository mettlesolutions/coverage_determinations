library PhacoEmulsificationProcedureCataractExtraction

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


valueset "Extraction of cataract (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Aspiration of cataract by phacoemulsification (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Cataract (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'

context Patient

define "Coverage":
         ( exists ([Condition: "Cataract (disorder)"]) and ( exists ([Procedure: "Aspiration of cataract by phacoemulsification (procedure)"]) ) )
