//Intravenous Iron Therapy
library IntravenousIronTherapy

using FHIR
include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'
valueset "Iron deficiency anemia (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Sodium ferric gluconate complex Injection [Ferrlecit]" : '2.16.840.1.113762.1.4.1010.2'
valueset "Chronic kidney disease (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Erythropoietin therapy (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "iron sucrose Injection [Venofer]":'2.16.840.1.113762.1.4.1010.2'
valueset "Intravenous infusion of iron (procedure)": '2.16.840.1.113883.3.88.12.80.28'
parameter MeasurementPeriod default @2000-12-01T00:00:00.0
parameter MeasurementPeriod1 default @2001-10-01T00:00:00.0


context Patient

define "Injection 1":
		(exists (["Condition": "Iron deficiency anemia (disorder)"])
		and (exists (["MedicationAdministration" : "Sodium ferric gluconate complex Injection [Ferrlecit]"]F
		where (F.effective) during MeasurementPeriod))
		)
define "Injection 2":
		(exists (["Condition":"Iron deficiency anemia (disorder)"])
		and (exists (["MedicationAdministration" :"iron sucrose Injection [Venofer]" ]I
		where (I.effective) during MeasurementPeriod1))
		)
		
define "Covered":
		("Injection 1" or "Injection 2")
		and (exists (["Condition":"Chronic kidney disease (disorder)"])
		and (exists (["Procedure":"Erythropoietin therapy (procedure)"]))
		)
		
define "Coverage":
		"Covered" and (exists (["Procedure": "Intravenous infusion of iron (procedure)"]))
