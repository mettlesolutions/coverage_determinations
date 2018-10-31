library AdultLiverTransplantation version '1'

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

valueset "End Stage Liver Disease":'2.16.840.1.113883.17.4077.3.1000'
valueset "Combined hepatocellular carcinoma and cholangiocarcinoma (disorder)":'2.16.840.1.113762.1.4.1056.94'
valueset "Secondary neuroendocrine tumor of liver":'2.16.840.1.113883.6.103'
valueset "Hemangioendothelioma of liver (disorder)":'2.16.840.1.113762.1.4.1029.63'
valueset "Instructions for Follow Up After Discharge":'2.16.840.1.113883.3.117.1.7.1.378'
valueset "Immunosuppressive therapy for transplant (procedure)":'2.16.840.1.113883.6.96'
valueset "Postoperative follow-up visit (procedure)":'2.16.840.1.113883.6.96'
valueset "Aftercare for liver transplant done (situation)":'2.16.840.1.113883.6.96'
valueset "Immunosuppressive Drugs for Urology Care":'2.16.840.1.113762.1.4.1151.32'

define "Malignancies":
	exists(["Diagnosis":"Combined hepatocellular carcinoma and cholangiocarcinoma (disorder)"])
	or exists(["Diagnosis":"Secondary neuroendocrine tumor of liver"])
	or exists(["Diagnosis":"Hemangioendothelioma of liver (disorder)"])

define "Covered":
	"Malignancies" or exists("Follow-up") or exists("Immunosuppressive Drugs")
	
define "Follow-up":
	["Assessment, Performed": "Aftercare for liver transplant done (situation)"]
	
define "Immunosuppressive Drugs":
	["Medication, Administered": "Immunosuppressive Drugs for Urology Care"]
	
define "Limitations":
	not "Covered"
	
define "Coverage":
	"Covered"
