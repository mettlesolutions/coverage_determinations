library Apheresis version '1'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

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
	exists(["Assessment, Performed": "Under care of public health physician (finding)"])
	and (exists(["Encounter, Performed": "Seen by physician (finding)"]) 
		and exists(["Procedure, Performed": "Medical procedure AND/OR service (procedure)"]))


define "Condition 1":
	exists(["Procedure, Performed": "Therapeutic plasma exchange (procedure)"])
	and exists(["Diagnosis": "Myasthenia gravis (disorder)"])

define "Condition 2":
	exists(["Procedure, Performed": "Leukopheresis (procedure)"])
	and exists(["Diagnosis": "Leukemia, disease (disorder)"])

define "Condition 3":
	exists(["Procedure, Performed": "Plasmapheresis (procedure)"])
	and exists(["Diagnosis": "Waldenström macroglobulinemia (disorder)"])

define "Condition 4":
	exists(["Diagnosis": "Hyperglobulinemia (finding)"])
	and (exists(["Diagnosis": "Multiple myeloma (disorder)"])
		or exists(["Diagnosis": "Cryoglobulinemia (disorder)"])
		or exists(["Diagnosis": "Hyperviscosity syndrome (disorder)"]))

define "Condition 5":
	(exists(["Procedure, Performed": "Plasmapheresis (procedure)"]) 
	or exists(["Procedure, Performed": "Therapeutic plasma exchange (procedure)"]))
	and exists(["Diagnosis": "Thrombotic thrombocytopenic purpura (disorder)"])
	
define "Condition 6":
	(exists(["Procedure, Performed": "Plasmapheresis (procedure)"]) 
	or exists(["Procedure, Performed": "Therapeutic plasma exchange (procedure)"]))
	and (exists(["Diagnosis": "Rheumatoid vasculitis (disorder)"]) and exists("Serious or Life Threatening Illness"))

define "Condition 7":
	false

define "Condition 8":
	exists(["Procedure, Performed": "Therapeutic plasma exchange (procedure)"])
	and exists(["Diagnosis": "Goodpasture's syndrome (disorder)"])
	
define "Condition 9":
	false
	
define "Condition 10":
	exists(["Diagnosis": "Chronic inflammatory demyelinating polyneuropathy (disorder)"]) 
	and exists("Serious or Life Threatening Illness")
	and exists("Absence of therapeutic response (finding)")
	
define "Condition 11":
	(exists(["Diagnosis": "Scleroderma with organ / system involvement (disorder)"]) or exists(["Diagnosis": "Polymyositis (disorder)"])) 
	and exists("Serious or Life Threatening Illness")
	and exists("Absence of therapeutic response (finding)")
	
define "Condition 12":
	exists(["Diagnosis": "Guillain-Barré syndrome (disorder)"])
	
define "Condition 13":
	exists(["Diagnosis": "Systemic lupus erythematosus (disorder)"])
	and exists("Serious or Life Threatening Illness")
	and exists("Absence of therapeutic response (finding)")


define "Covered":
	"Hospital Setting" and ("Condition 1" or "Condition 2" or "Condition 3" or "Condition 4" or "Condition 5" or "Condition 6" 
	or "Condition 7" or "Condition 8" or "Condition 9" or "Condition 10" or "Condition 11" or "Condition 12" or "Condition 13")
	
	
define "Coverage":
	"Covered"
