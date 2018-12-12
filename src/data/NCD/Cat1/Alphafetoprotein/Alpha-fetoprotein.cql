library Alphafetoprotein version '1'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)


valueset "alpha Fetoprotein (substance)":'2.16.840.1.113762.1.4.1010.2'
valueset "Hepatocellular carcinoma (morphologic abnormality)":'2.16.840.1.113883.3.88.12.3221.8.9'
valueset "Metastatic hepatocellular carcinoma (morphologic abnormality)":'2.16.840.1.113883.3.88.12.3221.8.9'
valueset "Alcoholic cirrhosis (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Infectious cirrhosis (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hemochromatosis (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Alpha-1-antitrypsin deficiency (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Benign carcinoid tumor (morphologic abnormality)":'2.16.840.1.113883.3.88.12.3221.8.9'


define "High risk":
	exists(["Diagnosis":"Alcoholic cirrhosis (disorder)"])
	or exists(["Diagnosis":"Infectious cirrhosis (disorder)"])
	or exists(["Diagnosis":"Hemochromatosis (disorder)"])
	or exists(["Diagnosis":"Alpha-1-antitrypsin deficiency (disorder)"])

define "Hepatocellular carcinoma":
	exists(["Diagnosis":"Hepatocellular carcinoma (morphologic abnormality)"])
	or (exists(["Diagnosis":"Benign carcinoid tumor (morphologic abnormality)"]) 
		and exists(["Diagnosis":"Metastatic hepatocellular carcinoma (morphologic abnormality)"]))

define "Covered":
	"Hepatocellular carcinoma"
	and "High risk"
	
define "Coverage":
	"Covered"
