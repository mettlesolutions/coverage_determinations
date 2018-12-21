library DiagnosticBreathAnalyses

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

valueset "Procedure aiding diagnosis (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Breath test (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Hydrogen breath test using lactose (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Lactose intolerance (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Small bowel bacterial overgrowth syndrome (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Carbon dioxide breath test (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Bile acid malabsorption syndrome (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Intestinal malabsorption of fat (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'

define "Covered":
	if (exists([Procedure: "Breath test (procedure)"])
		and exists([Procedure: "Procedure aiding diagnosis (procedure)"])
	and (exists([Condition: "Lactose intolerance (disorder)"])
		and exists([Procedure: "Hydrogen breath test using lactose (procedure)"])))
	then true
	else false

define "Not Covered":
	(exists([Condition: "Small bowel bacterial overgrowth syndrome (disorder)"])
		and exists([Procedure: "Hydrogen breath test using lactose (procedure)"]))
	or (exists([Condition: "Bile acid malabsorption syndrome (disorder)"])
		and exists([Procedure: "Carbon dioxide breath test (procedure)"]))
	or (exists([Condition: "Intestinal malabsorption of fat (disorder)"])
		and exists([Procedure: "Carbon dioxide breath test (procedure)"]))
	
define "Coverage":
	"Covered" and not "Not Covered"
