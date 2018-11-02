//TreatmentofActinicKeratosis

library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT": '2.16.840.1.113883.3.88.12.80.28'

valueset "Cryosurgery (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Liquid nitrogen (substance)": '2.16.840.1.113762.1.4.1010.2'
valueset "Skin care: topical treatments (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Curettage (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Dermabrasion (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Chemical peeling of skin lesion (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Laser surgery (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Photodynamic therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "": ''

context Patient

define "Treatments Of Actinic Keratosis":
         ( exists (["Procedure, Performed": "Cryosurgery (procedure)"])
         or ( exists (["Procedure, Performed": "Skin care: topical treatments (regime/therapy)"]) )
         or ( exists (["Procedure, Performed": "Curettage (procedure)"]) )
         or ( exists (["Procedure, Performed": "Dermabrasion (procedure)"]) )
         or ( exists (["Procedure, Performed": "Chemical peeling of skin lesion (procedure)"]) )
         or ( exists (["Procedure, Performed": "Laser surgery (procedure)"]) )
         or ( exists (["Procedure, Performed": "Photodynamic therapy (procedure)"]) )
         ) 
         
define "Coverage":
         "Treatments Of Actinic Keratosis"
