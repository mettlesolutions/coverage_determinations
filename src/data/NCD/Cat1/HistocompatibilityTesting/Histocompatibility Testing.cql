//Histocompatibility Testing
library  ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
codesystem "ICD10CM": '2.16.840.1.113883.6.90'

valueset "Transplant of kidney (procedure)" :'2.16.840.1.113883.3.88.12.80.28'
valueset "Preparation of patient (regime/therapy)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Transplantation of bone marrow (procedure)" : '2.16.840.1.113883.3.666.5.335'
valueset "Ankylosing spondylitis (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Intravenous blood transfusion of platelets (procedure)" : '2.16.840.1.113762.1.4.1056.81'
valueset "Human leukocyte antigen typing (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Inconclusive (qualifier value)" : '2.16.840.1.113762.1.4.1185.8'
valueset "Summary report (record artifact)":'2.16.840.1.113762.1.4.1116.529'
valueset "Physician (occupation)" : '2.16.840.1.113762.1.4.1096.129'

context Patient

define "Indications":
		(exists (["Procedure, Performed":"Preparation of patient (regime/therapy)"]) and (exists (["Procedure, Performed":"Transplant of kidney (procedure)"] K
		where K.result ="Inconclusive (qualifier value)" ))
		or (exists (["Procedure, Performed":"Preparation of patient (regime/therapy)"]) and (exists (["Procedure, Performed":"Transplantation of bone marrow (procedure)"] B
		where B.result = "Inconclusive (qualifier value)")))
		or (exists (["Procedure, Performed":"Preparation of patient (regime/therapy)"]) and (exists (["Procedure, Performed":"Intravenous blood transfusion of platelets (procedure)"] P
		where P.result = "Inconclusive (qualifier value)")))
		)

define "Covered":
		"Indications" and
		(exists (["Diagnosis":"Ankylosing spondylitis (disorder)"])
		and (exists (["Procedure, Performed":"Human leukocyte antigen typing (procedure)"]))
		(exists (["Diagnostic Study, Performed" : "Summary report (record artifact)"])
		 and (exists (["Provider Characteristic" : "Physician (occupation)"]))
		)

define "Coverage":
		"Covered"

	
