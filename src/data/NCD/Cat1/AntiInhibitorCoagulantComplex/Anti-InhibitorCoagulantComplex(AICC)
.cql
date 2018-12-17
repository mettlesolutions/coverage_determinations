library AntiInhibitorCoagulantComplex version '1'

using FHIR

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

valueset "Factor VIII inhibitor disorder (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hemophilia (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "General Major Bleeding Events":'2.16.840.1.113762.1.4.1179.5'
valueset "Poor response to treatment (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "ANTI-INHIBITOR COAGULANT COMPLEX":'2.16.840.1.113762.1.4.1010.7'

define "Covered":
	if (exists([MedicationAdministration:"ANTI-INHIBITOR COAGULANT COMPLEX"])
	and (exists([Condition: "Hemophilia (disorder)"])
		and exists([Condition: "Factor VIII inhibitor disorder (disorder)"])
		and exists([Condition: "General Major Bleeding Events"])
		and exists([Observation: "Poor response to treatment (situation)"])))
	then true
	else false
	
define "Coverage":
	"Covered"
