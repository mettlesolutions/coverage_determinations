//Screening for Cervical Cancer with Human Papillomavirus (HPV)
library ScreeningforCervicalCancerwithHumanPapillomavirus 

using FHIR

include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)


valueset "Human papillomavirus screening (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Pap Smear Tests, FPAR": '2.16.840.1.113762.1.4.1166.10'
valueset "Cervical or vaginal cancer screening; pelvic and clinical breast examination": '2.16.840.1.113762.1.4.1047.257'

parameter MeasurementPeriod Interval<DateTime>
parameter MeasurementPeriod1 default @2015-07-09T00:00:00.0

context Patient

define "Condition for HPV":
	AgeInYearsAt(start of MeasurementPeriod) >= 30
	and AgeInYearsAt(start of MeasurementPeriod) < 65

define "Test2(Pap Smear Tests, FPAR)":
			(exists (["Procedure" : 'Pap Smear Tests, FPAR']))
			
define "Test1(HPV)":
		"Condition for HPV" and 
		(exists (["Observation":"Human papillomavirus screening (procedure)"] HPV 
		 where (HPV.effective) on or after MeasurementPeriod1 and duration in years of (HPV.effective) > 5 ))		
		 
define "Covered":
		"Test1(HPV)" and "Test2(Pap Smear Tests, FPAR)"
		
define "Coverage":
		"Covered"
