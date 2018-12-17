//Lymphocyte Mitogen Response Assays
library LymphocyteMitogenResponseAssays

using FHIR

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'
valueset "Immunodeficiency disorder (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Lymphocyte function antigen-1 defect (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Lymphocyte proliferation test (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Local chemotherapy for malignant neoplasm (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Radiation therapy procedure or service (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Surgical procedure (procedure)" : '2.16.840.1.113883.3.88.12.80.28'



context Patient

define "Covered" :
		(exists (["Condition":"Immunodeficiency disorder (disorder)"])
		and (exists (["Condition":"Lymphocyte function antigen-1 defect (disorder)"]))
		and (exists (["Procedure":"Lymphocyte proliferation test (procedure)"]))
		)
		
define "Not Covered":
		(exists (["Procedure":"Local chemotherapy for malignant neoplasm (procedure)"])
		and (exists (["Procedure":"Radiation therapy procedure or service (procedure)"]))
		and (exists (["Procedure":"Surgical procedure (procedure)"]))
		)
		
define "Coverage":
		"Covered" and not "Not Covered"
