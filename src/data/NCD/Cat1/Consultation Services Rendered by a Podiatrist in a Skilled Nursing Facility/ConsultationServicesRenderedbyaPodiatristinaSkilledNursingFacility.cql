library ConsultationServicesRenderedbyaPodiatristinaSkilledNursingFacility

using FHIR

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": 'http://snomed.info/sct'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "ICD9CM": 'https://www.cdc.gov/nchs/icd/icd9.htm'
codesystem "RXNORM": 'https://www.nlm.nih.gov/research/umls/rxnorm/'

valueset "Podiatric Medicine & Surgery Service Providers; Podiatrist":'2.16.840.1.114222.4.11.1066'
valueset "Ambulatory Health Care Facilities; Clinic/Center, Podiatric":'2.16.840.1.114222.4.11.1066'
valueset "Treatment given (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Acquired pes planus (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Congenital pes planus (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Dislocation or subluxation of foot (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Foot care (regime/therapy)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Routine procedure (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Physical examination procedure (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Disorder of foot (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Associated symptom (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Consultation (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Skilled nursing facility (environment)":'2.16.840.1.113762.1.4.1096.130'

define "Condition1":
	exists([Observation: "Treatment given (situation)"])
		and (exists([Condition: "Acquired pes planus (disorder)"])
			or exists([Condition: "Congenital pes planus (disorder)"])
			or exists([Condition: "Dislocation or subluxation of foot (disorder)"]))

define "Condition2":
	if not exists([Condition: "Disorder of foot (disorder)"])
	then (exists([Procedure: "Physical examination procedure (procedure)"])
		and exists([Procedure: "Routine procedure (procedure)"]))
	else false

define "Not Covered":
	"Condition1"
	or exists([Procedure: "Foot care (regime/therapy)"])
	or "Condition2"

define "Coverage":
	if (exists([Encounter: "Podiatric Medicine & Surgery Service Providers; Podiatrist"])
		and exists([Procedure: "Consultation (procedure)"])
		and exists([Encounter: "Skilled nursing facility (environment)"])
		and not "Not Covered")
	then true
	else false
