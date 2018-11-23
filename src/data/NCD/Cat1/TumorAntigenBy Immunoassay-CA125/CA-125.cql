//Tumor Antigen by Immunoassay - CA 125
library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
valueset "Cancer antigen 125 (substance)": '2.16.840.1.113762.1.4.1010.2'
valueset "Adenocarcinoma of endometrium (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Carcinoma of endocervix (disorder)": '2.16.840.1.113883.3.464.1003.108.12.1011'
//malignant mesothelioma  valueset "Malignant mesothelioma of parietal peritoneum (disorder)": '2.16.840.1.113883.3.464.1003.108.12.1011'
//valueset "Chemotherapy (procedure)": '2.16.840.1.113762.1.4.1018.240'
//epithelial ovarian carcinoma
valueset "Malignant tumor of ovary (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Carcinoma of fallopian tube (disorder)": '2.16.840.1.113883.3.464.1003.108.12.1011'
valueset "Primary malignant neoplasm of endometrium (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Disease Recurrence": '2.16.840.1.113762.1.4.1116.304'
//Mesothelioma
valueset "Mesothelioma (malignant, clinical disorder) (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Extraovarian primary peritoneal carcinoma (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
//CA 125 levels
valueset "CA 125 measurement (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "On examination - central pelvic mass (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Preoperative procedure (procedure)" :'2.16.840.1.113883.3.88.12.80.28'
valueset "Female (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Chemotherapy (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Postoperative monitoring (regime/therapy)" : '2.16.840.1.113883.3.88.12.80.28'
// three serum levels
// signs or symptoms suggestive of malignancy

context Patient

define   "Indication 1":
		(exists (["Diagnosis" :"Malignant tumor of ovary (disorder)"])
		or (exists (["Diagnosis" : "Carcinoma of fallopian tube (disorder)"]))
		or (exists (["Diagnosis" : "Primary malignant neoplasm of endometrium (disorder)"]))
		or (exists (["Diagnosis" :  "Carcinoma of endocervix (disorder)"]))
		or (exists (["Diagnosis" : "Mesothelioma (malignant, clinical disorder) (disorder)"]))
		or (exists (["Diagnosis" : "Extraovarian primary peritoneal carcinoma (disorder)"]))
		and (exists (["Procedure, Performed": "CA 125 measurement (procedure)"]))
		)
define "Indication 2" :
		(exists (["Procedure, Performed" : "Preoperative procedure (procedure)"] and ["Patient Characteristic Sex" :"Female (finding)"])
		and (exists (["Diagnosis" :"On examination - central pelvic mass (finding)"]))
		and (exists (["Procedure, Performed" :"CA 125 measurement (procedure)"]))
		and (exists (["Procedure, Performed" : "Postoperative monitoring (regime/therapy)"]))
		)
		
define "Coverage":
		"Indictaion" or "Indication 2"
		
	
 
