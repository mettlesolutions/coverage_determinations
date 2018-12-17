//Hydrophilic Contact Lens
library HydrophilicContactLens

using FHIR

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'
valueset "Myopia (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Astigmatism (disorder)" :'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Regular astigmatism (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Aphakia (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Prescribing, fitting and supply of ocular prosthesis (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Fitting of contact lens (procedure)" : '2.16.840.1.113883.3.88.12.80.28'

context Patient

define "Covered":
		(exists (["Condition":"Aphakia (disorder)"])
		and (exists (["Procedure" : "Prescribing, fitting and supply of ocular prosthesis (procedure)"]))
		and (exists (["Procedure" : "Fitting of contact lens (procedure)"]))
		)
		
define "Not Covered":
		(exists (["Condition": "Myopia (disorder)"])
		or (exists (["Condition" :"Astigmatism (disorder)"]))
		or (exists (["Condition" : "Regular astigmatism (disorder)"]))
		and (exists (["Procedure" : "Fitting of contact lens (procedure)"]))
		)
		
define "Coverage":
		"Covered" and "Not Covered"
