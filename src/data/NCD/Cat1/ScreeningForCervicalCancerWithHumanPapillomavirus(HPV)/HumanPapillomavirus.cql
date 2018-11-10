//Screening for Cervical Cancer with Human Papillomavirus (HPV)
library ChlamydiaScreening_Common version '2'

using QDM version '5.3'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)


valueset "Human papillomavirus screening (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Pap Smear Tests, FPAR": '2.16.840.1.113762.1.4.1166.10'
valueset "Cervical or vaginal cancer screening; pelvic and clinical breast examination": '2.16.840.1.113762.1.4.1047.257'


context Patient

define "Condition for HPV":
	AgeInYearsAt(start of MeasurementPeriod) >= 30
	and AgeInYearsAt(start of MeasurementPeriod) < 65

define "Test2(Pap Smear Tests, FPAR)":
			(exists (["Procedure, Performed" : 'Pap Smear Tests, FPAR']))
			
define "Test1(HPV)":
		"Condition for HPV" and 
		(exists (["Laboratory Test, Performed":	"Human papillomavirus screening (procedure)"] HPV 
		 where duration in years of HPV.relevantPeriod > 5 ))		
		 
define "Covered":
		"Test1(HPV)" and "Test2(Pap Smear Tests, FPAR)"
		
define "Coverage":
		"Covered"
