
library AmbulatoryEEGMonitoring version '1'

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


valueset "Family history of seizure disorder (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Electroencephalogram abnormality with seizure (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Seizure disorder (disorder)":'2.16.840.-1.113883.3.88.12.3221.7.4'
valueset "Suspected (qualifier value)":'2.16.840.1.113883.3.2074.1.1.45'
valueset "Transient ischemic attack (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Syncope (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Ambulatory electroencephalogram (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Electroencephalographic monitoring regime (regime/therapy)":'2.16.840.1.113883.3.88.12.80.28'

define "Condition 1":
	exists([Condition: "Seizure disorder (disorder)"])
	and exists([FamilyMemberHistory:"Seizure disorder (disorder)"])
	and exists([Observation: "Family history of seizure disorder (situation)"])
	and exists("Suspected (qualifier value)")

define "Condition 2":
	exists([Condition: "Syncope (disorder)"])
	or exists([Condition: "Transient ischemic attack (disorder)"])


define "Covered":
	if (exists([Procedure:"Ambulatory electroencephalogram (procedure)"])
	and exists([Procedure:"Electroencephalographic monitoring regime (regime/therapy)"])
	and ("Condition 1" or "Condition 2"))
	then true
	else false
	
define "Coverage":
	"Covered"
