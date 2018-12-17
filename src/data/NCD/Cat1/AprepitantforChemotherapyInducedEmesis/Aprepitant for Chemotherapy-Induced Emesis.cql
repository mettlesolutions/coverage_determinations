library AprepitantforChemotherapyInducedEmesis version '1'

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

valueset "aprepitant Oral Product":'2.16.840.1.113883.3.88.12.80.16'
valueset "Serotonin 5HT-3 Antagonists [MoA]":'2.16.840.1.113883.3.26.1.5'
valueset "Dexamethasone Oral Product":'	2.16.840.1.113883.3.88.12.80.16'

valueset "alemtuzumab [Chemical/Ingredient]":'2.16.840.1.113883.3.26.1.5'
valueset "Azacitidine":'2.16.840.1.113883.3.88.12.80.16'
valueset "bendamustine":'2.16.840.1.113883.3.88.12.80.16'
valueset "Carboplatin":'2.16.840.1.113883.3.88.12.80.16'
valueset "Carmustine":'2.16.840.1.113883.3.88.12.80.16'
valueset "Cisplatin":'2.16.840.1.113883.3.88.12.80.16'
valueset "clofarabine":'2.16.840.1.113883.3.88.12.80.16'
valueset "Cyclophosphamide":'2.16.840.1.113883.3.88.12.80.16'
valueset "Cytarabine":'2.16.840.1.113883.3.88.12.80.16'
valueset "Dacarbazine":'2.16.840.1.113883.3.88.12.80.16'
valueset "Daunorubicin":'2.16.840.1.113883.3.88.12.80.16'
valueset "Doxorubicin":'2.16.840.1.113883.3.88.12.80.16'
valueset "Epirubicin":'2.16.840.1.113883.3.88.12.80.16'
valueset "Idarubicin":'2.16.840.1.113883.3.88.12.80.16'
valueset "Ifosfamide":'2.16.840.1.113883.3.88.12.80.16'
valueset "irinotecan":'2.16.840.1.113883.3.88.12.80.16'
valueset "Lomustine":'2.16.840.1.113883.3.88.12.80.16'
valueset "Mechlorethamine":'2.16.840.1.113883.3.88.12.80.16'
valueset "oxaliplatin":'2.16.840.1.113883.3.88.12.80.16'
valueset "Streptozocin":'2.16.840.1.113883.3.88.12.80.16'

valueset "Nausea and vomiting (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Drug-induced nausea and vomiting (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Chemotherapy (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Antineoplastic chemotherapy regimen (regime/therapy)":'2.16.840.1.113883.3.88.12.80.28'

parameter "Measurement Period" Interval<DateTime>

define "anticancer chemotherapeutic agents":
	exists([MedicationStatement:"alemtuzumab [Chemical/Ingredient]"])
	or exists([MedicationStatement:"Azacitidine"])
	or exists([MedicationStatement:"bendamustine"])
	or exists([MedicationStatement:"Carboplatin"])
	or exists([MedicationStatement:"Carmustine"])
	or exists([MedicationStatement:"Cisplatin"])
	or exists([MedicationStatement:"clofarabine"])
	or exists([MedicationStatement:"Cyclophosphamide"])
	or exists([MedicationStatement:"Cytarabine"])
	or exists([MedicationStatement:"Dacarbazine"])
	or exists([MedicationStatement:"Daunorubicin"])
	or exists([MedicationStatement:"Doxorubicin"])
	or exists([MedicationStatement:"Epirubicin"])
	or exists([MedicationStatement:"Idarubicin"])
	or exists([MedicationStatement:"Ifosfamide"])
	or exists([MedicationStatement:"irinotecan"])
	or exists([MedicationStatement:"Lomustine"])
	or exists([MedicationStatement:"Mechlorethamine"])
	or exists([MedicationStatement:"oxaliplatin"])
	or exists([MedicationStatement:"Streptozocin"])

define "anticancer chemotherapeutic agents Administration":
	[MedicationAdministration:"alemtuzumab [Chemical/Ingredient]"]
	union [MedicationAdministration:"Azacitidine"]
	union [MedicationAdministration:"bendamustine"]
	union [MedicationAdministration:"Carboplatin"]
	union [MedicationAdministration:"Carmustine"]
	union [MedicationAdministration:"Cisplatin"]
	union [MedicationAdministration:"clofarabine"]
	union [MedicationAdministration:"Cyclophosphamide"]
	union [MedicationAdministration:"Cytarabine"]
	union [MedicationAdministration:"Dacarbazine"]
	union [MedicationAdministration:"Daunorubicin"]
	union [MedicationAdministration:"Doxorubicin"]
	union [MedicationAdministration:"Epirubicin"]
	union [MedicationAdministration:"Idarubicin"]
	union [MedicationAdministration:"Ifosfamide"]
	union [MedicationAdministration:"irinotecan"]
	union [MedicationAdministration:"Lomustine"]
	union [MedicationAdministration:"Mechlorethamine"]
	union [MedicationAdministration:"oxaliplatin"]
	union [MedicationAdministration:"Streptozocin"]
	

define "Agents Relevant Period":
	"anticancer chemotherapeutic agents Administration"M
		where M.effective["Measurement Period"]
	return M.effective["Measurement Period"]

define "Three drug regimen":
	exists([MedicationAdministration:"aprepitant Oral Product"])
	and exists([MedicationAdministration:"Serotonin 5HT-3 Antagonists [MoA]"])
	and exists([MedicationAdministration:"Dexamethasone Oral Product"])

	//exists([MedicationAdministration:"aprepitant Oral Product"]A where A.relevantPeriod during "Measurement Period" and A.relevantPeriod starts before or within 48 hours after start of "Agents Relevant Period")
	//and exists([MedicationAdministration:"Serotonin 5HT-3 Antagonists [MoA]"]S where S.relevantPeriod during "Measurement Period")
	//and exists([MedicationAdministration:"Dexamethasone Oral Product"]D where D.relevantPeriod during "Measurement Period")
	
define "Covered":
	if "anticancer chemotherapeutic agents" then "Three drug regimen"
	else false
	
define "Not covered":
	exists([Condition: "Drug-induced nausea and vomiting (disorder)"])
	and exists([Procedure: "Antineoplastic chemotherapy regimen (regime/therapy)"])

define "Coverage":
	"Covered" and not "Not covered"
