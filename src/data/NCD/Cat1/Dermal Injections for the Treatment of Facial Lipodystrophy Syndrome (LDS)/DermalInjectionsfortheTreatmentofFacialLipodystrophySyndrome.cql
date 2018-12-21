library DermalInjectionsfortheTreatmentofFacialLipodystrophySyndrome

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

valueset "Filler (substance)":'2.16.840.1.113762.1.4.1010.2'
valueset "Skin part (body structure)":'2.16.840.1.113883.3.88.12.3221.8.9'
valueset "Human immunodeficiency virus infection (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Lipodystrophy caused by antiretroviral drug (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Lipodystrophy of face (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Depression diagnosis":'2.16.840.1.113883.3.600.145'
valueset "Intradermal injection (procedure)":'2.16.840.1.113883.3.88.12.80.28'

define "Covered":
	if (exists([Procedure: "Intradermal injection (procedure)"])
	and (exists([MedicationAdministration: "Filler (substance)"])
		and exists([Condition: "Human immunodeficiency virus infection (disorder)"])
		and exists([Condition: "Lipodystrophy caused by antiretroviral drug (disorder)"])
		and exists([Condition: "Lipodystrophy of face (disorder)"])
		and exists([Condition: "Depression diagnosis"])))
	then true
	else false
	
define "Coverage":
	"Covered"
