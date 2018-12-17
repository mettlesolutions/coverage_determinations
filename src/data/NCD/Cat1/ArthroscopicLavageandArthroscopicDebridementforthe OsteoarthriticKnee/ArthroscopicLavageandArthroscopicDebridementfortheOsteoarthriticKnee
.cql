library ArthroscopicLavageandArthroscopicDebridementfortheOsteoarthriticKnee version '1'

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

valueset "Arthroscopic washout of knee joint (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Osteoarthritis of knee (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Arthroscopic surgical procedure on knee (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Knee pain (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "arthroscopy: lavage and lysis of adhesions":'2.16.840.1.113883.6.13'
valueset "Osteoarthritis (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Articular cartilage disorder of knee (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Excisional debridement of wound, infection, or burn":'2.16.840.1.113883.6.104'
valueset "arthroscopy: debridement":'2.16.840.1.113883.6.13'
valueset "Nonexcisional debridement of wound, infection or burn":'2.16.840.1.113883.6.104'


define "Condition 1":
	exists([Procedure: "arthroscopy: lavage and lysis of adhesions"])
	and exists([Condition:"Osteoarthritis of knee (disorder)"])


define "Condition 2":
	exists([Procedure: "arthroscopy: debridement"])
	and exists([Condition:"Osteoarthritis (disorder)"])
	and exists([Condition:"Knee pain (finding)"])
	
define "Arthroscopy condition":
	exists([Procedure: "arthroscopy: lavage and lysis of adhesions"])
	and (exists([Procedure: "Excisional debridement of wound, infection, or burn"])
		or exists([Procedure: "Nonexcisional debridement of wound, infection or burn"]))
	
	
define "Condition 3":
	exists([Procedure: "arthroscopy: debridement"])
	and "Arthroscopy condition"
	and exists([Condition:"Osteoarthritis (disorder)"])

	
define "Not Covered":
	"Condition 1" or "Condition 2" or "Condition 3"

define "Coverage":
	not "Not Covered"