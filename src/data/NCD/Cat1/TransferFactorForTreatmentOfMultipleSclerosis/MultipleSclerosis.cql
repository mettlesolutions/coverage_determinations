//Transfer Factor for Treatment of Multiple Sclerosis
library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Transfer factor test (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Sensitized leukocyte (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Multiple sclerosis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Cellular immune defect (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Increased (qualifier value)" :'2.16.840.1.113883.11.20.9.44'

context Patient

define "Not Covered":
		(exists (["Diagnosis" : "Sensitized leukocyte (finding)"])
		and (exists (["Diagnosis" : "Cellular immune defect (finding)"] D
		where D.severity = "Increased (qualifier value)"))
		and (exists (["Diagnosis" : "Multiple sclerosis (disorder)"]))
		and (exists (["Procedure, Performed" : "Transfer factor test (procedure)"]))
		)
		
define "Coverage":
		not "Not Covered"
