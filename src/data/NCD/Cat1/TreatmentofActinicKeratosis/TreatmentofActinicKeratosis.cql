//TreatmentofActinicKeratosis

library TreatmentofActinicKeratosis
using FHIR
include FHIRHelpers version '1.8' called FHIRHelpers

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
parameter MeasurementPeriod default @2001-11-26T00:00:00.0

context Patient

define "Treatments Of Actinic Keratosis":
         ( exists (["Procedure": "Cryosurgery (procedure)"]C
         where C.performed on or after MeasurementPeriod )
         or ( exists (["Procedure": "Skin care: topical treatments (regime/therapy)"]C
         where C.performed on or after MeasurementPeriod) )
         or ( exists (["Procedure": "Curettage (procedure)"]C
         where C.performed on or after MeasurementPeriod) )
         or ( exists (["Procedure": "Dermabrasion (procedure)"]C
         where C.performed on or after MeasurementPeriod) )
         or ( exists (["Procedure": "Chemical peeling of skin lesion (procedure)"]C
         where C.performed on or after MeasurementPeriod) )
         or ( exists (["Procedure": "Laser surgery (procedure)"]C
         where C.performed on or after MeasurementPeriod) )
         or ( exists (["Procedure": "Photodynamic therapy (procedure)"]C
         where C.performed on or after MeasurementPeriod) )
         ) 
         
define "Coverage":
         "Treatments Of Actinic Keratosis" 
