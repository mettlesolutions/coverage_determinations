library CytogeneticStudies

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

valueset "Genetic syndrome (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Fetus with hereditary disease (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Sexual nondevelopment (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Chronic myeloid leukemia, disease (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Acute lymphoid leukemia, disease (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Myeloid leukemia (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Myelodysplastic syndrome (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Cytogenetic study performed (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'

define "Covered":
	if (exists([Observation: "Cytogenetic study performed (situation)"])
	and (exists([Condition: "Fetus with hereditary disease (disorder)"])
		or exists([Observation: "Sexual nondevelopment (finding)"])
		or exists([Condition: "Chronic myeloid leukemia, disease (disorder)"])
		or exists([Condition: "Myeloid leukemia (disorder)"])
		or exists([Condition: "Acute lymphoid leukemia, disease (disorder)"])
		or exists([Condition: "Myelodysplastic syndrome (disorder)"])))
	then true
	else false
	
	
define "Coverage":
	"Covered"
