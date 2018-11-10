//Percutaneous Image-Guided Breast Biopsy
library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Percutaneous needle biopsy of breast using ultrasound guidance (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Core needle biopsy of breast using mammography guidance (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Radiology result abnormal (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
//palpable
valueset "Breast lump (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "On examination - breast lump palpated (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
 
//BIRADS III,IV,V

context Patient

define "Non-Palpable":
		(exists (["Procedure, Performed": "Percutaneous needle biopsy of breast using ultrasound guidance (procedure)"])
		or (exists (["Procedure, Performed" : "Core needle biopsy of breast using mammography guidance (procedure)"]))
		and (exists (["Diagnosis" : "Radiology result abnormal (finding)"]))
		)
