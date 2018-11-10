//Urinary Drainage Bags
library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'
valueset "Urine specimen collection (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Urinary retention care (regime/therapy)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Disorder of urinary bladder (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Urinary incontinence (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
//leg or beside drainage bags 

context Patient

define "Covered":
	 	(exists (["Diagnosis": "Disorder of urinary bladder (disorder)"])
		and (exists (["Diagnosis" : "Urinary incontinence (finding)"]))
		and (exists (["Procedure, Performed":"Urine specimen collection (procedure)"]))
		and (exists (["Procedure, Performed":"Urinary retention care (regime/therapy)"]))
		)

