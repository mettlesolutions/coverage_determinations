//Intraocular Photography

library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'
valueset "Malignant tumor of eye (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Age-related macular degeneration (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Disorder of choroid of eye (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Retinopathy co-occurrent and due to diabetes mellitus (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Glaucoma (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Multiple sclerosis (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Ocular fundus photography (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Retinal photography (procedure)" : '2.16.840.1.113883.3.88.12.80.28'

context Patient

define "Coverage" :
		(exists (["Diagnosis" : "Malignant tumor of eye (disorder)"])
		and (exists (["Diagnosis" : "Age-related macular degeneration (disorder)"]))
		and (exists (["Diagnosis" : "Disorder of choroid of eye (disorder)"]))
		and (exists (["Diagnosis" : "Retinopathy co-occurrent and due to diabetes mellitus (disorder)"]))
		and (exists (["Diagnosis" : "Glaucoma (disorder)"]))
		and (exists (["Diagnosis" : "Multiple sclerosis (disorder)"]))
		and (exists (["Procedure, Performed": "Retinal photography (procedure)"]))
		)
