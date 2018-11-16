//Refractive Keratoplasty

library ChlamydiaScreening_Common version '2'
using QDM

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

context Patient

define "Not Covered": 
	(exists (["Diagnosis": "Myopia (disorder)"]) and (exists (["Procedure, Performed": "Keratoplasty (procedure)"]))
	or (exists (["Diagnosis": "Hypermetropia (disorder)"])) and (exists (["Procedure, Performed": "Keratoplasty (procedure)"]))
	or (exists (["Diagnosis": "Presbyopia (disorder)"])) and (exists (["Procedure, Performed": "Keratoplasty (procedure)"]))
	or (exists (["Diagnosis": "Astigmatism (disorder)"])) and (exists (["Procedure, Performed": "Keratoplasty (procedure)"]))
	)
	
define "Covered":
	(exists (["Diagnosis" : "Wears glasses (finding)"])
	and (exists (["Procedure, Performed": "Keratoplasty (procedure)"])
	or (exists (["Procedure, Performed" : "Fitting of contact lens (procedure)"])))
	and (exists (["Procedure, Performed": "Cataract surgery (procedure)"]))
	and not (exists (["Procedure, Performed" : "Cosmetic surgery (procedure)"]))
	)
	
define "Covered 1":
	(exists (["Diagnosis": "Lesion of eye structure (finding)"])
	and (exists (["Procedure, Performed": "Keratoplasty (procedure)"])))
	or
	 (exists (["Diagnosis" : "Epiretinal membrane (disorder)"])
	and (exists (["Procedure, Performed" : "Refractive keratoplasty by laser surgery (procedure)"]))
	and not (exists (["Procedure, Performed" : "Cosmetic surgery (procedure)"]))
	)
	
define "Covered 2":
		(exists (["Diagnosis" :"Disorder of eye region (disorder)"])
		and (exists (["Procedure, Performed" : "Surgical procedure on eye proper using laser (procedure)"]))
		)
	
define "Coverage":
	 "Covered" and "Covered 1" and "Covered 2" and "Not Covered"
