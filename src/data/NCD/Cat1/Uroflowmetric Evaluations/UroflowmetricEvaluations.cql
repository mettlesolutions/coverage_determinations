//Uroflowmetric Evaluations
library UroflowmetricEvaluations

using FHIR
include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'

valueset "Urodynamic studies (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Dysfunctional voiding (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Bladder outlet obstruction (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
parameter MeasurementPeriod default @1980-01-01T00:00:00.0

context Patient

define "Condition (Coverage)":
        ( exists(["Condition": "Dysfunctional voiding (disorder)"]) and ( exists(["Condition": "Bladder outlet obstruction (disorder)"]) )
        )
        
define "Covered":
     "Condition (Coverage)" and ( exists (["Procedure": "Urodynamic studies (procedure)"]U
     where U.performed on or after MeasurementPeriod) )
        
define "Coverage":
		"Covered"
