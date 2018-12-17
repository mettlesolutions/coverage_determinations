//Lumbar Artificial Disc Replacement (LADR)
library LumbarArtificialDiscReplacement

using FHIR
include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem 'CPT' : '2.16.840.1.113883.6.12'
valueset "Removal of total disc arthroplasty (artificial disc), anterior approach, single interspace; lumbar	" : '2.16.840.1.113883.3.3157.1814'

context Patient

define MeasurementPeriod: 
	Interval[@2006-05-16T00:00:00.0,@2007-08-13T00:00:00.0)
	
define MeasurementPeriod1: 
	Interval[@2007-08-17T00:00:00.0,null]


define InInitialPopulation:
	AgeInYearsAt(start of MeasurementPeriod) > 60
	
define InInitialPopulation 1:
	AgeInYearsAt(start of MeasurementPeriod) <= 60

define "Condition 1":
		InInitialPopulation and (exists (["Procedure" : "Removal of total disc arthroplasty (artificial disc), anterior approach, single interspace; lumbar	"]L
		where (L.performed) during MeasurementPeriod1))
		
define "Condition 2":
		InInitialPopulation and (exists (["Procedure" : "Removal of total disc arthroplasty (artificial disc), anterior approach, single interspace; lumbar	"]L
		where (L.performed) during MeasurementPeriod))
		
define "Condition 3" : 
		InInitialPopulation 1 and (exists (["Procedure" : "Removal of total disc arthroplasty (artificial disc), anterior approach, single interspace; lumbar	"]))


define "Not Covered":
		"Condition 1" or "Condition 2" or "Condition 3"
		
define "Coverage":
		"Not Covered"
