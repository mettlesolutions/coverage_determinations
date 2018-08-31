library insertName

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
//hyperopia 
valueset "Radial keratotomy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Slitting (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//cornea
valueset "Corneal edema caused by wearing of contact lenses (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Replacement of prosthetic device (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Keratoplasty (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//Eye glasses
//Contact lens
valueset "Cataract surgery (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Cosmetic surgery (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//Lesions of cornea
valueset "Photorefractive keratectomy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//scar tissue
//ophthalmic disease
//opthalmalogic surgery

context Patient

define "Not Covered": 
	["Diagnosis": "Myopia (disorder)"] union ["Procedure, Performed": "Keratoplasty (procedure)"]
	or ["Diagnosis": "Hypermetropia (disorder)"] union ["Procedure, Performed": "Keratoplasty (procedure)"]
	or ["Diagnosis": "Presbyopia (disorder)"] union ["Procedure, Performed": "Keratoplasty (procedure)"]
	or ["Diagnosis": "Astigmatism (disorder)"] union ["Procedure, Performed": "Keratoplasty (procedure)"]
	
define "Covered":
	["Procedure, Performed": "Keratoplasty (procedure)"]
	and ["Diagnosis":""] union ["Procedure, Performed": ""]
	
define "Coverage":
	"Not Covered" union "Covered"
