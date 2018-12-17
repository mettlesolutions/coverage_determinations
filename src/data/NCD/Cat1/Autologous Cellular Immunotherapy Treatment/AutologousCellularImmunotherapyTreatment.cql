library AutologousCellularImmunotherapyTreatment version '1'

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

valueset "Hormone refractory prostate cancer (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Asymptomatic (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Patient's condition improved (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "sipuleucel-T":'2.16.840.1.113762.1.4.1010.7'

define "Condition":
	exists([Observation: "Patient's condition improved (finding)"])
	and (exists([Condition: "Hormone refractory prostate cancer (disorder)"])
		or (exists([Observation: "Asymptomatic (finding)"])
			and exists([Condition: "Hormone refractory prostate cancer (disorder)"])))


define "Covered":
	if exists([MedicationAdministration:"sipuleucel-T"])
		and "Condition"
	then true
	else false
	
define "Coverage":
	"Covered"
