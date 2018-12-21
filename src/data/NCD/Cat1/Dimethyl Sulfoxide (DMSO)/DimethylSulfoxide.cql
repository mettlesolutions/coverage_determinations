library DimethylSulfoxide

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

valueset "Dimethyl Sulfoxide":'2.16.840.1.113762.1.4.1010.1'
valueset "General treatment (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Procedure started (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Chronic interstitial cystitis (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'

define "Covered":
	if (exists([MedicationAdministration:"Dimethyl Sulfoxide"])
	and exists([Condition: "Chronic interstitial cystitis (disorder)"])
	and exists([Procedure: "General treatment (procedure)"])
	and exists([Observation: "Procedure started (situation)"]))
	then true
	else false

define "Coverage": 
	"Covered"
