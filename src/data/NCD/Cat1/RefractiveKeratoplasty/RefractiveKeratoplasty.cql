//Refractive Keratoplasty

library RefractiveKeratoplasty
using FHIR
include FHIRHelpers version '1.8' called FHIRHelpers


//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
valueset "Refractive keratoplasty (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Myopia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hypermetropia (disorder)": '2.16.840.1.113762.1.4.1018.240'
valueset "Presbyopia (disorder)": '2.16.840.1.113762.1.4.1018.240'
valueset "Astigmatism (disorder)": '2.16.840.1.113762.1.4.1018.240'
valueset "Keratomileusis (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Keratophakia (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Operative procedure on cornea (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Radial keratotomy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Slitting (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Corneal edema caused by wearing of contact lenses (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Replacement of prosthetic device (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Keratoplasty (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Wears glasses (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Fitting of contact lens (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Cataract surgery (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Cosmetic surgery (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Lesion of eye structure (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Photorefractive keratectomy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Epiretinal membrane (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Disorder of eye region (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Surgical procedure on eye proper using laser (procedure)" :'2.16.840.1.113883.3.88.12.80.28'
valueset "Refractive keratoplasty by laser surgery (procedure)" :'2.16.840.1.113883.3.88.12.80.28'
valueset "Ophthalmologist (occupation)" : '2.16.840.1.113762.1.4.1099.14'
parameter MeasurementPeriod default @1997-05-01T00:00:00.0

context Patient

define "Not Covered": 
	(exists (["Condition": "Myopia (disorder)"]) and (exists (["Procedure": "Keratoplasty (procedure)"]))
	or (exists (["Condition": "Hypermetropia (disorder)"])) and (exists (["Procedure": "Keratoplasty (procedure)"]))
	or (exists (["Condition": "Presbyopia (disorder)"])) and (exists (["Procedure": "Keratoplasty (procedure)"]))
	or (exists (["Condition": "Astigmatism (disorder)"])) and (exists (["Procedure": "Keratoplasty (procedure)"]))
	)
	
define "Covered 1":
	(exists (["Condition" : "Wears glasses (finding)"])
	and (exists (["Procedure": "Keratoplasty (procedure)"]K
	where K.performed during MeasurementPeriod)
	or (exists (["Procedure" : "Fitting of contact lens (procedure)"])))
	and (exists (["Procedure": "Cataract surgery (procedure)"]))
	and not (exists (["Procedure" : "Cosmetic surgery (procedure)"]))
	)
	
define "Covered 2":
	(exists (["Condition": "Lesion of eye structure (finding)"])
	and (exists (["Procedure": "Keratoplasty (procedure)"]K
	where K.performed during MeasurementPeriod)))
	or
	 (exists (["Condition" : "Epiretinal membrane (disorder)"])
	and (exists (["Procedure" : "Refractive keratoplasty by laser surgery (procedure)"]K
	where K.performed during MeasurementPeriod))
	and not (exists (["Procedure" : "Cosmetic surgery (procedure)"]))
	)
	
define "Covered 3":
		(exists (["Condition" :"Disorder of eye region (disorder)"])
		and (exists (["Procedure" : "Surgical procedure on eye proper using laser (procedure)"]S
		where S.performed during MeasurementPeriod))
		)
		
define "Covered":
		"Covered 1" and "Covered 2" and "Covered 3" and 
		(exists (["Encounter":"Ophthalmologist (occupation)"]))
	
define "Coverage":
	 "Covered" and "Not Covered"
