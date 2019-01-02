library HomeUseofOxygeninApprovedClinicalTrials

using FHIR

include FHIRHelpers version '1.8' called FHIRHelpers

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

valueset "Oxygen measurement, partial pressure, arterial (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Oxygen saturation measurement (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Enrollment in clinical trial (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "percent":'1.3.6.1.4.1.12009.10.3.1'
valueset "Home (environment)":'2.16.840.1.113762.1.4.1096.130'
valueset "Oxygen":'2.16.840.1.113762.1.4.1010.7'
valueset "millimeter of mercury":'2.16.840.1.113883.1.11.12839'

define "Covered":
	exists("Home (environment)")
	and exists([MedicationAdministration: "Oxygen"])
	and exists([Procedure: "Enrollment in clinical trial (procedure)"])
	and (exists([Procedure: "Oxygen measurement, partial pressure, arterial (procedure)"]O where O.outcome = 56'millimeter of mercury' or O.outcome = 65'millimeter of mercury')
		or exists([Procedure: "Oxygen saturation measurement (procedure)"]OS where OS.outcome = 89 '%'))
	
	
define "Coverage":
	"Covered"
