//Histocompatibility Testing
library HistocompatibilityTesting

using FHIR

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
valueset  "Documentation of current medications (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Physician (occupation)" : '2.16.840.1.113762.1.4.1096.129'

context Patient

define "Indications":
		(exists (["Procedure":"Preparation of patient (regime/therapy)"]) and (exists (["Procedure":"Transplant of kidney (procedure)"] K
		where K.outcome ="Inconclusive (qualifier value)" ))
		or (exists (["Procedure":"Preparation of patient (regime/therapy)"]) and (exists (["Procedure":"Transplantation of bone marrow (procedure)"] B
		where B.outcome = "Inconclusive (qualifier value)")))
		or (exists (["Procedure":"Preparation of patient (regime/therapy)"]) and (exists (["Procedure":"Intravenous blood transfusion of platelets (procedure)"] P
		where P.outcome = "Inconclusive (qualifier value)")))
		)

define "Covered":
		if("Indications")
		then
			(exists (["Condition":"Ankylosing spondylitis (disorder)"])
			and (exists (["Procedure":"Human leukocyte antigen typing (procedure)"]))
			and (exists (["Procedure" : "Documentation of current medications (procedure)"]))
		 	and (exists (["Encounter" : "Physician (occupation)"]))
			)
		else
			null

define "Coverage":
		"Covered"

	
