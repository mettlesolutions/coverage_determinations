//Intravenous Iron Therapy
library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'
valueset "Iron deficiency anemia (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Sodium ferric gluconate complex Injection [Ferrlecit]" : '2.16.840.1.113762.1.4.1010.2'
valueset "Chronic kidney disease (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Erythropoietin therapy (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "iron sucrose Injection [Venofer]":'2.16.840.1.113762.1.4.1010.2'
valueset "Intravenous infusion of iron (procedure)": '2.16.840.1.113883.3.88.12.80.28'

context Patient

define "Injection 1":
		(exists (["Diagnosis": "Iron deficiency anemia (disorder)"])
		and (exists (["Substance, Administered" : "Sodium ferric gluconate complex Injection [Ferrlecit]"]))
		)
define "Injection 2":
		(exists (["Diagnosis":"Iron deficiency anemia (disorder)"])
		and (exists (["Substance, Administered" :"iron sucrose Injection [Venofer]" ]))
		)
		
define "Covered":
		("Injection 1" or "Injection 2")
		and (exists (["Diagnosis":"Chronic kidney disease (disorder)"])
		and (exists (["Procedure, Performed":"Erythropoietin therapy (procedure)"]))
		)
		
define "Coverage":
		"Covered" and (exists (["Procedure, Performed": "Intravenous infusion of iron (procedure)"]))
