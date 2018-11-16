//PET for Perfusion of the Heart
library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT": '2.16.840.1.113883.3.88.12.80.28'
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


context Patient

define "Rubidium 82" :
		(exists (["Procedure, Performed" : "Positron emission tomography heart study (procedure)"])
		and (exists (["Procedure, Performed" : "Cardiovascular stress test using pharmacologic stress agent (procedure)"]))
		and (exists (["Diagnosis" :"Coronary arteriosclerosis (disorder)"]))
		and (exists (["Substance, Administered" : "Rubidium radioisotope (substance)"]))
		)

define "Requirements":
			(exists (["Procedure, Performed" : "Positron emission tomography heart study (procedure)"])
			and (exists (["Procedure, Performed" : "Cardiovascular stress test using pharmacologic stress agent (procedure)"]))
			)

define "Requirement-1":
		"Requirements"
			and not (exists (["Procedure, Performed" : "Single photon emission computed tomography of heart (procedure)"]))

define "Requirement-2":
			"Requirements"  and (exists (["Intervention, Performed": "Refusal of treatment by patient (situation)"])
			and (exists (["Procedure, Performed" : "Single photon emission computed tomography of heart (procedure)"]))
			and (exists (["Procedure, Performed" : "Inconclusive evaluation finding (finding)"])))
			
define "Requirement-3":
			(exists (["Participation" : 'claimant']) 
			and (exists (["Procedure, Performed" : "Positron emission tomography heart study (procedure)"]))
			and (exists (["Procedure, Performed" : "Cardiovascular examination and evaluation (procedure)"]))
			)
define "Ammonia N-13":
		(exists (["Procedure, Performed" : "Positron emission tomography heart study (procedure)"])
		and (exists (["Procedure, Performed" : "Cardiovascular stress test using pharmacologic stress agent (procedure)"]))
		and (exists (["Diagnosis" :"Coronary arteriosclerosis (disorder)"]))
		and (exists (["Procedure, Performed":"Positron emission tomography myocardial rest study using N13 ammonia (procedure)"]))
		)

define "Requirement-4":
		"Requirements" and "Requirement-2"
			and (exists (["Procedure, Performed" : "Single photon emission computed tomography of heart (procedure)"]))

define "Covered-1":
		"Rubidium 82" and "Requirement-1" and "Requirement-2" and "Requirement-3"

define "Covered-2" :
		"Ammonia N-13" and "Requirement-4"

define "Coverage":
		"Covered-1" and "Covered-2"
		
		

