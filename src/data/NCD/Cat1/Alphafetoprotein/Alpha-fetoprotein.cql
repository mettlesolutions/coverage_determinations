library Alphafetoprotein version '1'

using FHIR version '1.8'//include otherLibrary version 'x.x' called otherLibrary//codesystem codeSystemName : 'OID' version 'x.x'//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}//code codeName : 'OID' from codeSystemName display 'displayName'//concept conceptName : {codeName1, codeName2, etc} display 'displayName'//parameter parameterName (dataType or default value)codesystem "SNOMEDCT": 'http://snomed.info/sct'codesystem "HCPCS": 'https://hcpcs.codes/'codesystem "ICD9CM": 'https://www.cdc.gov/nchs/icd/icd9.htm'codesystem "RXNORM": 'https://www.nlm.nih.gov/research/umls/rxnorm/'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)


valueset "Alpha-fetoprotein blood test (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Hepatocellular carcinoma (morphologic abnormality)":'2.16.840.1.113883.3.88.12.3221.8.9'
valueset "Metastatic hepatocellular carcinoma (morphologic abnormality)":'2.16.840.1.113883.3.88.12.3221.8.9'
valueset "Alcoholic cirrhosis (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Infectious cirrhosis (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hemochromatosis (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Alpha-1-antitrypsin deficiency (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Benign carcinoid tumor (morphologic abnormality)":'2.16.840.1.113883.3.88.12.3221.8.9'


define "High risk":
	exists([Condition:"Alcoholic cirrhosis (disorder)"])
	or exists([Condition:"Infectious cirrhosis (disorder)"])
	or exists([Condition:"Hemochromatosis (disorder)"])
	or exists([Condition:"Alpha-1-antitrypsin deficiency (disorder)"])

define "Hepatocellular carcinoma":
	exists([Condition:"Hepatocellular carcinoma (morphologic abnormality)"])
	or (exists([Condition:"Benign carcinoid tumor (morphologic abnormality)"])
		and exists([Condition:"Metastatic hepatocellular carcinoma (morphologic abnormality)"]))

define "Covered":
	if (exists([Procedure: "Alpha-fetoprotein blood test (procedure)"])
		and "Hepatocellular carcinoma"
		and "High risk")
	then true
	else false
	
define "Coverage":
	"Covered"
