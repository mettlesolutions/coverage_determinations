//ThePritikinProgram
library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'
valueset "Insertion of carotid artery stent (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Cardiac rehabilitation (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Implantation of ventricular assist device (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Positron emission tomography (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Lung volume reduction surgery (procedure)" : '2.16.840.1.113883.3.88.12.80.28'

context Patient

define "ICRProgram":
		(exists (["Procedure, Performed":"Insertion of carotid artery stent (procedure)"])
			or (exists (["Procedure, Performed" :"Implantation of ventricular assist device (procedure)"]))
			or (exists (["Procedure, Performed" : "Positron emission tomography (procedure)"]))
			or (exists (["Procedure, Performed" : "Lung volume reduction surgery (procedure)"]))
		)
	
define "Covered":
                "ICRProgram" and (exists (["Procedure, Performed" :"Cardiac rehabilitation (regime/therapy)"]))
                
define "NotCovered":
                not "ICRProgram"
                   
define "Coverage":
		"Covered"                

