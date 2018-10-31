library Alphafetoprotein version '1'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
codesystem "HCPCS": '2.16.840.1.113883.6.285'
codesystem "NDFRT": '2.16.840.1.113883.3.26.1.5'

valueset "alpha Fetoprotein (substance)":'2.16.840.1.113883.6.96'
valueset "Hepatocellular carcinoma (morphologic abnormality)":'2.16.840.1.113883.6.96'
valueset "Metastatic hepatocellular carcinoma (morphologic abnormality)":'2.16.840.1.113883.6.96'
valueset "Alcoholic cirrhosis (disorder)":'2.16.840.1.113883.6.96'
valueset "Cirrhosis":'2.16.840.1.113762.1.4.1032.14'
valueset "Hemochromatosis (disorder)":'2.16.840.1.113883.6.96'
valueset "Alpha-1-antitrypsin deficiency (disorder)":'2.16.840.1.113883.6.96'


define "High risk":
	exists(["Diagnosis":"Alcoholic cirrhosis (disorder)"])
	or exists(["Diagnosis":"Cirrhosis"])
	or exists(["Diagnosis":"Hemochromatosis (disorder)"])
	or exists(["Diagnosis":"Alpha-1-antitrypsin deficiency (disorder)"])

define "Hepatocellular carcinoma":
	exists(["Diagnosis":"Hepatocellular carcinoma (morphologic abnormality)"])
	or exists(["Diagnosis":"Metastatic hepatocellular carcinoma (morphologic abnormality)"])

define "Covered":
	"Hepatocellular carcinoma"
	and "High risk"
	
define "Limitations":
	not "Covered"
	
define "Coverage":
	"Covered"
