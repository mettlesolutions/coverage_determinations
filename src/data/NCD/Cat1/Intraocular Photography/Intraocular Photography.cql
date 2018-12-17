//Intraocular Photography

library IntraocularPhotography

using FHIR

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
valueset "Ophthalmologist (occupation)" : '2.16.840.1.113762.1.4.1099.14'

context Patient

define "Covered" :
		(exists (["Condition" : "Malignant tumor of eye (disorder)"])
		and (exists (["Condition" : "Age-related macular degeneration (disorder)"]))
		and (exists (["Condition" : "Disorder of choroid of eye (disorder)"]))
		and (exists (["Condition" : "Retinopathy co-occurrent and due to diabetes mellitus (disorder)"]))
		and (exists (["Condition" : "Glaucoma (disorder)"]))
		and (exists (["Condition" : "Multiple sclerosis (disorder)"]))
		and (exists (["Procedure": "Retinal photography (procedure)"]))
		and (exists (["Encounter":"Ophthalmologist (occupation)"]))
		)
		
define "Coverage":
		"Covered"
