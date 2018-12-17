library Apheresis version '1'

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

valueset "Apheresis (procedure)":'2.16.840.1.113883.3.88.12.80.28'

valueset "Myasthenia gravis (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Therapeutic plasma exchange (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Plasmapheresis (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Leukopheresis (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Leukemia, disease (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Leukemia":'2.16.840.1.113762.1.4.1116.242'
valueset "Waldenström macroglobulinemia (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'

valueset "Hyperglobulinemia (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Multiple myeloma (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Cryoglobulinemia (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hyperviscosity syndrome (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'

valueset "Thrombotic thrombocytopenic purpura (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Rheumatoid vasculitis (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Serious or Life Threatening Illness":'2.16.840.1.113883.3.464.1003.199.11.1104'
valueset "Cholestatic pruritus (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Plasma filtration (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Perfusion (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Plasma (substance)":'2.16.840.1.113762.1.4.1010.2'
valueset "Charcoal [Chemical/Ingredient]":'2.16.840.1.113883.3.26.1.5'
valueset "Goodpasture's syndrome (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'

valueset "Glomerulonephritis (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Chronic progressive renal failure (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Pulmonary hemorrhage (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Chronic inflammatory demyelinating polyneuropathy (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Absence of therapeutic response (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Polymyositis (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Guillain-Barré syndrome (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Systemic lupus erythematosus (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Deterioration of status (qualifier value)":'2.16.840.1.113762.1.4.1181.5'
valueset "Scleroderma with organ / system involvement (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Medical procedure AND/OR service (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Medical assessment (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Medical service (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Under care of public health physician (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Seen by physician (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'


define "Hospital Setting":
	exists([Observation: "Under care of public health physician (finding)"])
	and (exists([Encounter: "Seen by physician (finding)"])
		and exists([Procedure: "Medical procedure AND/OR service (procedure)"]))


define "Condition 1":
	exists([Procedure: "Therapeutic plasma exchange (procedure)"])
	and exists([Condition: "Myasthenia gravis (disorder)"])

define "Condition 2":
	exists([Procedure: "Leukopheresis (procedure)"])
	and exists([Condition: "Leukemia, disease (disorder)"])

define "Condition 3":
	exists([Procedure: "Plasmapheresis (procedure)"])
	and exists([Condition: "Waldenström macroglobulinemia (disorder)"])

define "Condition 4":
	exists([Condition: "Hyperglobulinemia (finding)"])
	and (exists([Condition: "Multiple myeloma (disorder)"])
		or exists([Condition: "Cryoglobulinemia (disorder)"])
		or exists([Condition: "Hyperviscosity syndrome (disorder)"]))

define "Condition 5":
	(exists([Procedure: "Plasmapheresis (procedure)"])
	or exists([Procedure: "Therapeutic plasma exchange (procedure)"]))
	and exists([Condition: "Thrombotic thrombocytopenic purpura (disorder)"])

define "Condition 6":
	(exists([Procedure: "Plasmapheresis (procedure)"])
	or exists([Procedure: "Therapeutic plasma exchange (procedure)"]))
	and (exists([Condition: "Rheumatoid vasculitis (disorder)"]) and exists("Serious or Life Threatening Illness"))

define "Condition 7":
	false

define "Condition 8":
	exists([Procedure: "Therapeutic plasma exchange (procedure)"])
	and exists([Condition: "Goodpasture's syndrome (disorder)"])

define "Condition 9":
	false

define "Condition 10":
	exists([Condition: "Chronic inflammatory demyelinating polyneuropathy (disorder)"])
	and exists([Condition: "Serious or Life Threatening Illness"])
	and exists([Observation: "Absence of therapeutic response (finding)"])

define "Condition 11":
	(exists([Condition: "Scleroderma with organ / system involvement (disorder)"]) or exists([Condition: "Polymyositis (disorder)"]))
	and exists([Condition: "Serious or Life Threatening Illness"])
	and exists([Observation: "Absence of therapeutic response (finding)"])

define "Condition 12":
	exists([Condition: "Guillain-Barré syndrome (disorder)"])

define "Condition 13":
	exists([Condition: "Systemic lupus erythematosus (disorder)"])
	and exists([Condition: "Serious or Life Threatening Illness"])
	and exists([Observation: "Absence of therapeutic response (finding)"])


define "Covered":
	if (exists([Procedure:"Apheresis (procedure)"]) and "Hospital Setting" and ("Condition 1" or "Condition 2" or "Condition 3" or "Condition 4" or "Condition 5" or "Condition 6"
	or "Condition 7" or "Condition 8" or "Condition 9" or "Condition 10" or "Condition 11" or "Condition 12" or "Condition 13"))
	then true
	else false
	
define "Coverage":
	"Covered"
