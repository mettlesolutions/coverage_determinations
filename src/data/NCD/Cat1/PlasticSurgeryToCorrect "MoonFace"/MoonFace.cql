//Plastic Surgery to Correct "Moon Face"
library PlasticSurgerytoCorrectMoonFace

using FHIR

include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
codesystem "RXNORM": '2.16.840.1.113883.6.88'
valueset "Cosmetic surgery (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Accidental injury (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Corticosteroids": '2.16.840.1.113883.3.464.1003.196.12.1482'
valueset "Preoperative state (finding)" : '2.16.840.1.113883.17.4077.2.2004'

parameter MeasurementPeriod default @1989-05-01T00:00:00.0
context Patient

define"Not Covered":
		(exists (["Condition" : "Accidental injury (disorder)"])
                and (exists (["Condition" :"Preoperative state (finding)"]))
		and (exists (["Procedure":"Cosmetic surgery (procedure)"] C
		where C.performed on or after MeasurementPeriod))
		)
define "Coverage":
		not "Not Covered"
