library HomeUseofOxygeninApprovedClinicalTrials

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Oxygen measurement, partial pressure, arterial (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Oxygen saturation measurement (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Enrollment in clinical trial (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "percent":'1.3.6.1.4.1.12009.10.3.1'

define "Covered":
	exists(["Procedure, Performed": "Enrollment in clinical trial (procedure)"]) 
	and (exists(["Procedure, Performed": "Oxygen measurement, partial pressure, arterial (procedure)"]O where O.result>=56 or O.result <=65) 
		or exists(["Procedure, Performed": "Oxygen saturation measurement (procedure)"]OS where OS.result>=89))
	
	
define "Coverage":
	"Covered"
