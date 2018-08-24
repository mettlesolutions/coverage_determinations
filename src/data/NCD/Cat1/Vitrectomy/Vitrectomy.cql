library ChlamydiaScreening_Common version '2'

using QDM version '5.3'


//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Vitreous loss (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Cataract Surgery": '2.16.840.1.113883.3.526.2.1527'
valueset "Retinal Detachment with Retinal Defect": '2.16.840.1.113883.3.526.2.1718'
valueset "Vitreous opacities (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Vitreous strands (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Vitreous hemorrhage (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Proliferative retinopathy (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Vitreous detachment (disorder)": '2.16.840.1.113762.1.4.1018.240'


context Patient

define "Coverage": 
	["Symptom" : "Vitreous loss (disorder)"] union ["Procedure, Performed": "Cataract Surgery"] 
		or ["Symptom" : "Vitreous opacities (disorder)"] union ["Condition": "Vitreous hemorrhage (disorder)"]
		or ["Condition" : "Retinal Detachment with Retinal Defect"] union ["Diagnosis": "Vitreous strands (disorder)"]
		or ["Condition" : "Proliferative retinopathy (disorder)"]
		or ["Condition" : "Vitreous detachment (disorder)"]
