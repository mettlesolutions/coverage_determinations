//Lymphocyte Mitogen Response Assays
library ChlamydiaScreening_Common version '2'

using QDM

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
		(exists (["Diagnosis":"Immunodeficiency disorder (disorder)"])
		and (exists (["Diagnosis":"Lymphocyte function antigen-1 defect (disorder)"]))
		and (exists (["Procedure, Performed":"Lymphocyte proliferation test (procedure)"]))
		)
		
define "Not Covered":
		(exists (["Procedure, Performed":"Local chemotherapy for malignant neoplasm (procedure)"])
		and (exists (["Procedure, Performed":"Radiation therapy procedure or service (procedure)"]))
		and (exists (["Procedure, Performed":"Surgical procedure (procedure)"]))
		)
		
define "Coverage":
		"Covered" and not "Not Covered"
