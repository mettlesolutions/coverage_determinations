library CryosurgeryofProstate

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Radiation therapy procedure or service (procedure)":'2.16.840.1.113883.6.96'
valueset "Clinical trial (procedure)":'2.16.840.1.113883.6.96'
valueset "Absence of therapeutic response (finding)":'2.16.840.1.113883.6.96'
valueset "Tumor stage T2b (finding)":'2.16.840.1.113883.6.96'
valueset "Gleason score in Specimen Qualitative":'2.16.840.1.113883.6.1'
valueset "Prostate-Specific Antigen [Chemical/Ingredient]":'2.16.840.1.113883.3.26.1.5'
valueset "Cryosurgery (procedure)":'2.16.840.1.113883.6.96'
valueset "Prostate-specific antigen monitoring (regime/therapy)":'2.16.840.1.113883.6.96'


define "Conditions":
	exists(["Diagnosis": "Tumor stage T2b (finding)"])
	or exists(["Assessment, Performed": "Gleason score in Specimen Qualitative"]G where G.result<9) 
	or exists(["Procedure, Performed": "Prostate-specific antigen monitoring (regime/therapy)"]PSA where PSA.result< 8) 


define "Covered":
	(exists(["Procedure, Performed": "Radiation therapy procedure or service (procedure)"])
		and exists(["Assessment, Performed": "Absence of therapeutic response (finding)"]) 
		and exists(["Procedure, Performed": "Clinical trial (procedure)"]))
	and "Conditions"
	
define "Not Covered":
	exists(["Assessment, Performed": "Absence of therapeutic response (finding)"])
	and not exists(["Procedure, Performed": "Cryosurgery (procedure)"])
	
define "Coverage":
	"Covered" and not "Not Covered"
