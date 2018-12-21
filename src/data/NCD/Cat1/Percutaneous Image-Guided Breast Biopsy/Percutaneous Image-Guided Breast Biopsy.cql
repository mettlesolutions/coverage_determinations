//Percutaneous Image-Guided Breast Biopsy
library PercutaneousImageGuidedBreastBiopsy

using FHIR

include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)


codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'
valueset "Percutaneous needle biopsy of breast using ultrasound guidance (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Core needle biopsy of breast using mammography guidance (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Radiology result abnormal (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'

valueset "Breast lump (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "On examination - breast lump palpated (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Palpation (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
 
//BIRADS III,IV,V
parameter MeasurementPeriod default @2003-01-01T00:00:00.0

context Patient

define "Non-Palpable":
		(exists (["Condition" : "Radiology result abnormal (finding)"])
		and (exists (["Procedure": "Percutaneous needle biopsy of breast using ultrasound guidance (procedure)"]P
		where (P.performed) during MeasurementPeriod))
		and (exists (["Procedure" : "Core needle biopsy of breast using mammography guidance (procedure)"]))
		)
		
define "Palpable":
		(exists (["Condition" : "Radiology result abnormal (finding)"])
		and (exists (["Condition" : "Breast lump (finding)"]))
		and (exists (["Procedure": "Percutaneous needle biopsy of breast using ultrasound guidance (procedure)"]P
		where (P.performed) during MeasurementPeriod))
		and (exists (["Observation":"Palpation (procedure)"]))
		)
		
define "Coverage":
		"Non-Palpable" and "Palpable"
