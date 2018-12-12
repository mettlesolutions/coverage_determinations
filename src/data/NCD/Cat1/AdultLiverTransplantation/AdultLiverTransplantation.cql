library AdultLiverTransplantation version '1'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)


valueset "End Stage Liver Disease":'2.16.840.1.113883.17.4077.3.1000'
valueset "Metastasis from malignant tumor of liver (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Cholangiocarcinoma of biliary tract (disorder)":'2.16.840.1.113762.1.4.1056.94'
valueset "Secondary neuroendocrine tumor of liver":'2.16.840.1.113883.6.103'
valueset "Carcinoma in situ of extrahepatic bile ducts (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Tumor surgically unresectable (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hemangioendothelioma of liver (disorder)":'2.16.840.1.113762.1.4.1029.63'

valueset "Instructions for Follow Up After Discharge":'2.16.840.1.113883.3.117.1.7.1.378'
valueset "Immunosuppressive therapy for transplant (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Postoperative follow-up visit (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Aftercare for liver transplant done (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'

valueset "Immunosuppressive Drugs for Urology Care":'2.16.840.1.113762.1.4.1151.32'
valueset "Sandimmune":'2.16.840.1.113883.3.88.12.80.16'
valueset "Imuran":'2.16.840.1.113883.3.88.12.80.16'
valueset "ATGAM":'2.16.840.1.113883.3.88.12.80.16'
valueset "Muromonab-CD3":'2.16.840.1.113883.3.88.12.80.16'
valueset "Prograf":'2.16.840.1.113883.3.88.12.80.16'
valueset "mycophenolate mofetil":'2.16.840.1.113883.3.88.12.80.16'
valueset "Daclizumab":'2.16.840.1.113883.3.88.12.80.16'
valueset "Cyclophosphamide":'2.16.840.1.113883.3.88.12.80.16'
valueset "Prednisone":'2.16.840.1.113883.3.88.12.80.16'


define "neuroendocrine tumor":
	exists(["Diagnosis":"Secondary neuroendocrine tumor of liver"]) 
	and exists(["Diagnosis":"Metastasis from malignant tumor of liver (disorder)"])

define "Cholangiocarcinoma":
	exists(["Diagnosis":"Carcinoma in situ of extrahepatic bile ducts (disorder)"]) 
	and exists(["Diagnosis":"Cholangiocarcinoma of biliary tract (disorder)"])
	and exists(["Diagnosis":"Tumor surgically unresectable (finding)"])

define "Malignancies":
	"Cholangiocarcinoma"
	or "neuroendocrine tumor"
	or exists(["Diagnosis":"Hemangioendothelioma of liver (disorder)"])

define "Covered":
	"Malignancies" or "Follow-up" or "Immunosuppressive Drugs"
	
define "Follow-up":
	exists(["Assessment, Performed": "Aftercare for liver transplant done (situation)"])
	
define "Immunosuppressive Drugs":
	exists(["Medication, Administered":"Sandimmune"])
	or exists(["Medication, Administered":"Imuran"])
	or exists(["Medication, Administered":"ATGAM"])
	or exists(["Medication, Administered":"Muromonab-CD3"])
	or exists(["Medication, Administered":"Prograf"])
	or exists(["Medication, Administered":"mycophenolate mofetil"])
	or exists(["Medication, Administered":"Daclizumab"])
	or exists(["Medication, Administered":"Cyclophosphamide"])
	or exists(["Medication, Administered":"Prednisone"])
	
	
define "Coverage":
	"Covered"

