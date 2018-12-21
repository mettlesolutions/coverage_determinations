//Tumor Antigen by Immunoassay - CA 125
library TumorAntigenbyImmunoassayCA125

using FHIR
include FHIRHelpers version '1.8' called FHIRHelpers

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
parameter MeasurementPeriod default @2003-01-03T00:00:00.0

context Patient

define "Indication 1":
		(exists (["Condition" :"Malignant tumor of ovary (disorder)"])
		or (exists (["Condition" : "Carcinoma of fallopian tube (disorder)"]))
		or (exists (["Condition" : "Primary malignant neoplasm of endometrium (disorder)"]))
		or (exists (["Condition" :  "Carcinoma of endocervix (disorder)"]))
		or (exists (["Condition" : "Mesothelioma (malignant, clinical disorder) (disorder)"]))
		or (exists (["Condition" : "Extraovarian primary peritoneal carcinoma (disorder)"]))
		and (exists (["Procedure": "CA 125 measurement (procedure)"]M
		where M.performed during MeasurementPeriod))
		)
define "Indication 2" :
		(exists (["Procedure" : "Preoperative procedure (procedure)"] and ["Patient" :"Female (finding)"])
		and (exists (["Condition" :"On examination - central pelvic mass (finding)"]))
		and (exists (["Procedure" :"CA 125 measurement (procedure)"]C
		where C.performed during MeasurementPeriod))
		and (exists (["Procedure" : "Postoperative monitoring (regime/therapy)"]))
		)
		
define "Coverage":
		"Indictaion" or "Indication 2"
		
	
 
