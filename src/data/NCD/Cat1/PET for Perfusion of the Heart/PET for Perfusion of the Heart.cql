//PET for Perfusion of the Heart
library PETforPerfusionoftheHeart

using FHIR
include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
codesystem "RoleClass" : '2.16.840.1.113883.5.110'
valueset "Positron emission tomography heart study (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Coronary arteriosclerosis (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Rubidium radioisotope (substance)" : '2.16.840.1.113762.1.4.1010.2'
valueset "Single photon emission computed tomography of heart (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Refusal of treatment by patient (situation)" : '2.16.840.1.113883.3.600.1.1503'
valueset "Equivocal (qualifier value)" : '2.16.840.1.113762.1.4.1166.7'
valueset "Inconclusive evaluation finding (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Cardiovascular stress test using pharmacologic stress agent (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Positron emission tomography myocardial rest study using N13 ammonia (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "claimant" : '2.16.840.1.113883.1.11.10416'
valueset "Cardiovascular examination and evaluation (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Inconclusive (qualifier value)" : '2.16.840.1.113762.1.4.1185.8'
valueset "Monitoring of laboratory results (regime/therapy)" : '2.16.840.1.113762.1.4.1096.198'


parameter MeasurementPeriod default @1995-03-14T00:00:00.0
parameter MeasurementPeriod1 default @2001-07-01T00:00:00.0
parameter MeasurementPeriod2 default @2003-10-01T00:00:00.0

context Patient

define "R-82":
	(exists (["Procedure" : "Positron emission tomography heart study (procedure)"]P
		where (P.performed) on or after MeasurementPeriod))

define "Rubidium 82" :
		"R-82"
		and (exists (["Procedure" : "Cardiovascular stress test using pharmacologic stress agent (procedure)"]))
		and (exists (["Condition" :"Coronary arteriosclerosis (disorder)"])
		and (exists (["MedicationAdministration" : "Rubidium radioisotope (substance)"]))
		)

define "Requirements":
			(exists (["Procedure" : "Positron emission tomography heart study (procedure)"])
			and (exists (["Procedure" : "Cardiovascular stress test using pharmacologic stress agent (procedure)"]))
			)

define "Requirement-1":
		"Requirements"
			and not (exists (["Procedure" : "Single photon emission computed tomography of heart (procedure)"]))

define "Requirement-2":
			"Requirements"  and (exists (["Procedure": "Refusal of treatment by patient (situation)"])
			and (exists (["Procedure" : "Single photon emission computed tomography of heart (procedure)"]))
			and (exists (["Procedure" : "Inconclusive evaluation finding (finding)"])))

define"Claim Condition":
			(exists (["Coverage" : 'claimant']) 
			and (exists (["Procedure" : "Positron emission tomography heart study (procedure)"]))
			and (exists (["Encounter" : "Monitoring of laboratory results (regime/therapy)"]))
			)
			
define "Requirement-3":
			"Claim Condition"
			and (exists (["Procedure" : "Cardiovascular examination and evaluation (procedure)"]P
			where P.outcome = "Inconclusive (qualifier value)"))
			and (exists (["Procedure" : "Positron emission tomography heart study (procedure)"]E
			where (E.performed) before MeasurementPeriod1))
			
define "Ammonia N-13":
		(exists (["Procedure" : "Positron emission tomography heart study (procedure)"]T
		where (T.performed) on or after MeasurementPeriod2)
		and (exists (["Procedure" : "Cardiovascular stress test using pharmacologic stress agent (procedure)"]))
		and (exists (["Condition" :"Coronary arteriosclerosis (disorder)"]))
		and (exists (["Procedure":"Positron emission tomography myocardial rest study using N13 ammonia (procedure)"]))
		)

define "Requirement-4":
		"Requirements" and "Requirement-2"
			and (exists (["Procedure" : "Single photon emission computed tomography of heart (procedure)"]))

define "Covered-1":
		"Rubidium 82" and "Requirement-1" and "Requirement-2" and "Requirement-3"

define "Covered-2" :
		"Ammonia N-13" and "Requirement-4"

define "Coverage":
		"Covered-1" and "Covered-2"
		
		

