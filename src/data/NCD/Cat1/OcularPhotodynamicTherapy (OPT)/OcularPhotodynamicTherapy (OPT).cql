//Ocular Photodynamic Therapy (OPT)
library  OcularPhotodynamicTherapyOPT

using FHIR
include FHIRHelpers version '1.8' called FHIRHelpers
//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'
codesystem "RXNORM" : '2.16.840.1.113883.6.88'
valueset "Verteporfin" : '2.16.840.1.113762.1.4.1010.7'
valueset "Age-related macular degeneration (disorder)": '2.16.840.1.113762.1.4.1018.240'
valueset "Choroidal retinal neovascularization (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Fluorescein angiography of eye (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Optical coherence tomography (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Occult neovascularization of macula (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Classic choroidal neovascular membrane (disorder)" : '2.16.840.1.113883.3.526.2.1691'
valueset "Photodynamic therapy (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Nonexudative age-related macular degeneration, bilateral, advanced atrophic with subfoveal involvement": '2.16.840.1.113883.3.526.2.1641'
valueset "Extrafoveal ocular fixation (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Atrophic retina (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Pathologic Myopia": '2.16.840.1.113883.3.526.2.1587'
valueset "Ocular histoplasmosis syndrome (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Lesion of eye structure (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Finding of lesion (finding)" :'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Size finding (finding)" :'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Ophthalmic examination and evaluation, follow-up (procedure)" : '2.16.840.1.113883.3.464.1003.101.11.1207'
valueset "Initial patient assessment (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Visual acuity testing (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Lesion size cannot be determined (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Multiple lesions (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'


parameter MeasurementPeriod default @2004-04-01T00:00:00.0

parameter MeasurementPeriod1 default @2013-04-03T00:00:00.0
parameter MeasurementPeriod2 default @2002-08-20T00:00:00.0
context Patient

define "Cover Condition":
		(exists (["Condition" :"Age-related macular degeneration (disorder)"])
		and (exists (["MedicationAdministration":"Verteporfin"]))
		and (exists (["Procedure":"Photodynamic therapy (procedure)"] P
		 where (P.performed) during MeasurementPeriod))
		)

define "Cover Condition1":
		(exists (["Condition" :"Age-related macular degeneration (disorder)"])
		and (exists (["MedicationAdministration":"Verteporfin"]))
		and (exists (["Procedure":"Photodynamic therapy (procedure)"] P
		where (P.performed) during MeasurementPeriod2))
		) 
define "Condition 1.1":
		(exists (["Condition": "Classic choroidal neovascular membrane (disorder)"])
		and (exists (["Procedure" : "Initial patient assessment (procedure)"]))
		and (exists (["DiagnosticReport": "Fluorescein angiography of eye (procedure)"]))
		)
define "Condition 1.2":
		(exists (["Condition": "Classic choroidal neovascular membrane (disorder)"])
		and (exists (["Procedure" :"Ophthalmic examination and evaluation, follow-up (procedure)"]))
		and (exists (["DiagnosticReport": "Fluorescein angiography of eye (procedure)"]F
		where (F.effective) during MeasurementPeriod))
		or (exists (["DiagnosticReport": "Optical coherence tomography (procedure)"]O
		where (O.effective) during MeasurementPeriod1))
		)
		
define "Condition 1.3":
		not (exists (["Condition" :"Multiple lesions (finding)"])
		or not (exists (["Condition" : "Lesion size cannot be determined (finding)"]))
		or not (exists (["Procedure" :  "Visual acuity testing (procedure)"]))
		and (exists (["Condition": "Classic choroidal neovascular membrane (disorder)"]))
		)
		

define "Condition 1":
		"Condition 1.1" and "Condition 1.2" and "Condition 1.3"
		
define "Condition 2":
		(exists (["Condition": "Occult neovascularization of macula (disorder)"])
		and not (exists (["Condition": "Classic choroidal neovascular membrane (disorder)"]))
		and (exists (["Condition" :"Age-related macular degeneration (disorder)"]))
		)
define "Condition 3":
 		(exists (["Condition": "Classic choroidal neovascular membrane (disorder)"])
		and (exists (["Condition" :"Age-related macular degeneration (disorder)"]))
		)
	
define "Condition for Condition 2 and Condition 3":
			(exists (["Condition" :"Lesion of eye structure (finding)"] D
			where (D.onset) before MeasurementPeriod and duration in months of( D.onset) = 3)
			and (exists (["Procedure" : "Initial patient assessment (procedure)"]))
			)
			or 
			(exists (["Condition" :"Lesion of eye structure (finding)"]E
			where (E.onset) during  MeasurementPeriod)
			and (exists (["Procedure" : "Initial patient assessment (procedure)"]))
			)
			
define "Covered Condition":
		if("Condition for Condition 2 and Condition 3")
		then 
			"Condition 2" and "Condition 3"
		else
			null
			
define "Others":
		(exists (["Condition" :"Pathologic Myopia"])
		or (exists (["Condition" :"Ocular histoplasmosis syndrome (disorder)"]))
		and "Cover Condition"
		)
			
define "Covered":
		"Cover Condition" and "Condition 1" and "Covered Condition" and "Others"
			
define "Not Covered":
		(exists (["Condition":"Atrophic retina (disorder)"])
		or (exists (["Condition" :"Extrafoveal ocular fixation (finding)"]))
		and "Cover Condition" and "Cover Condition1"
		)
		
define "Coverage":
		"Covered" and "Not Covered"
