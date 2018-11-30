library AprepitantforChemotherapyInducedEmesis version '1'

using QDM version '5.0'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "aprepitant Oral Product":'2.16.840.1.113883.6.88'
valueset "Serotonin 5HT-3 Antagonists [MoA]":'2.16.840.1.113883.3.26.1.5'
valueset "Dexamethasone Oral Product":'	2.16.840.1.113883.6.88'

valueset "alemtuzumab [Chemical/Ingredient]":'2.16.840.1.113883.3.26.1.5'
valueset "Azacitidine":'2.16.840.1.113883.6.88'
valueset "bendamustine":'2.16.840.1.113883.6.88'
valueset "Carboplatin":'2.16.840.1.113883.6.88'
valueset "Carmustine":'2.16.840.1.113883.6.88'
valueset "Cisplatin":'2.16.840.1.113883.6.88'
valueset "clofarabine":'2.16.840.1.113883.6.88'
valueset "Cyclophosphamide":'2.16.840.1.113883.6.88'
valueset "Cytarabine":'2.16.840.1.113883.6.88'
valueset "Dacarbazine":'2.16.840.1.113883.6.88'
valueset "Daunorubicin":'2.16.840.1.113883.6.88'
valueset "Doxorubicin":'2.16.840.1.113883.6.88'
valueset "Epirubicin":'2.16.840.1.113883.6.88'
valueset "Idarubicin":'2.16.840.1.113883.6.88'
valueset "Ifosfamide":'2.16.840.1.113883.6.88'
valueset "irinotecan":'2.16.840.1.113883.6.88'
valueset "Lomustine":'2.16.840.1.113883.6.88'
valueset "Mechlorethamine":'2.16.840.1.113883.6.88'
valueset "oxaliplatin":'2.16.840.1.113883.6.88'
valueset "Streptozocin":'2.16.840.1.113883.6.88'

valueset "Nausea and vomiting (disorder)":'2.16.840.1.113883.6.96'
valueset "Drug-induced nausea and vomiting (disorder)":'2.16.840.1.113883.6.96'
valueset "Chemotherapy (procedure)":'2.16.840.1.113883.6.96'
valueset "Antineoplastic chemotherapy regimen (regime/therapy)":'2.16.840.1.113883.6.96'

parameter "Measurement Period" Interval<DateTime>

define "anticancer chemotherapeutic agents":
	exists(["Medication, Active":"alemtuzumab [Chemical/Ingredient]"])
	or exists(["Medication, Active":"Azacitidine"])
	or exists(["Medication, Active":"bendamustine"])
	or exists(["Medication, Active":"Carboplatin"])
	or exists(["Medication, Active":"Carmustine"])
	or exists(["Medication, Active":"Cisplatin"])
	or exists(["Medication, Active":"clofarabine"])
	or exists(["Medication, Active":"Cyclophosphamide"])
	or exists(["Medication, Active":"Cytarabine"])
	or exists(["Medication, Active":"Dacarbazine"])
	or exists(["Medication, Active":"Daunorubicin"])
	or exists(["Medication, Active":"Doxorubicin"])
	or exists(["Medication, Active":"Epirubicin"])
	or exists(["Medication, Active":"Idarubicin"])
	or exists(["Medication, Active":"Ifosfamide"])
	or exists(["Medication, Active":"irinotecan"])
	or exists(["Medication, Active":"Lomustine"])
	or exists(["Medication, Active":"Mechlorethamine"])
	or exists(["Medication, Active":"oxaliplatin"])
	or exists(["Medication, Active":"Streptozocin"])
	
define "anticancer chemotherapeutic agents Administration":
	["Medication, Administered":"alemtuzumab [Chemical/Ingredient]"]
	union ["Medication, Administered":"Azacitidine"]
	union ["Medication, Administered":"bendamustine"]
	union ["Medication, Administered":"Carboplatin"]
	union ["Medication, Administered":"Carmustine"]
	union ["Medication, Administered":"Cisplatin"]
	union ["Medication, Administered":"clofarabine"]
	union ["Medication, Administered":"Cyclophosphamide"]
	union ["Medication, Administered":"Cytarabine"]
	union ["Medication, Administered":"Dacarbazine"]
	union ["Medication, Administered":"Daunorubicin"]
	union ["Medication, Administered":"Doxorubicin"]
	union ["Medication, Administered":"Epirubicin"]
	union ["Medication, Administered":"Idarubicin"]
	union ["Medication, Administered":"Ifosfamide"]
	union ["Medication, Administered":"irinotecan"]
	union ["Medication, Administered":"Lomustine"]
	union ["Medication, Administered":"Mechlorethamine"]
	union ["Medication, Administered":"oxaliplatin"]
	union ["Medication, Administered":"Streptozocin"]
	
	
define "Agents Relevant Period":
	"anticancer chemotherapeutic agents Administration"M 
		where M.relevantPeriod during "Measurement Period"
	return M.relevantPeriod
	
define "Three drug regimen":
	exists(["Medication, Administered":"aprepitant Oral Product"])
	and exists(["Medication, Administered":"Serotonin 5HT-3 Antagonists [MoA]"])
	and exists(["Medication, Administered":"Dexamethasone Oral Product"])	
	
	//exists(["Medication, Administered":"aprepitant Oral Product"]A where A.relevantPeriod during "Measurement Period" and A.relevantPeriod starts before or within 48 hours after start of "Agents Relevant Period")
	//and exists(["Medication, Administered":"Serotonin 5HT-3 Antagonists [MoA]"]S where S.relevantPeriod during "Measurement Period")
	//and exists(["Medication, Administered":"Dexamethasone Oral Product"]D where D.relevantPeriod during "Measurement Period")
	
define "Covered":
	if "anticancer chemotherapeutic agents" then "Three drug regimen"
	else false
	
define "Not covered":
	exists(["Diagnosis": "Drug-induced nausea and vomiting (disorder)"])
	and exists(["Procedure, Performed": "Antineoplastic chemotherapy regimen (regime/therapy)"])

define "Coverage":
	"Covered" and not "Not covered"
