library ArthroscopicLavageandArthroscopicDebridementfortheOsteoarthriticKnee version '1'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Arthroscopic washout of knee joint (procedure)":'2.16.840.1.113883.6.96'
valueset "Osteoarthritis of knee (disorder)":'2.16.840.1.113883.6.96'
valueset "Arthroscopic surgical procedure on knee (procedure)":'2.16.840.1.113883.6.96'
valueset "Knee pain (finding)":'2.16.840.1.113883.6.96'
valueset "arthroscopy: lavage and lysis of adhesions":'2.16.840.1.113883.6.13'
valueset "Osteoarthritis (disorder)":'2.16.840.1.113883.6.96'
valueset "Articular cartilage disorder of knee (disorder)":'2.16.840.1.113883.6.96'
valueset "Excisional debridement of wound, infection, or burn":'2.16.840.1.113883.6.104'
valueset "arthroscopy: debridement":'2.16.840.1.113883.6.13'
valueset "Nonexcisional debridement of wound, infection or burn":'2.16.840.1.113883.6.104'


define "Condition 1":
	exists(["Procedure, Performed": "arthroscopy: lavage and lysis of adhesions"])
	and exists(["Diagnosis":"Osteoarthritis of knee (disorder)"])


define "Condition 2":
	exists(["Procedure, Performed": "arthroscopy: debridement"])
	and exists(["Diagnosis":"Osteoarthritis (disorder)"])
	and exists(["Diagnosis":"Knee pain (finding)"])
	
define "Arthroscopy condition":
	exists(["Procedure, Performed": "arthroscopy: lavage and lysis of adhesions"]) 
	and (exists(["Procedure, Performed": "Excisional debridement of wound, infection, or burn"])
		or exists(["Procedure, Performed": "Nonexcisional debridement of wound, infection or burn"])) 
	
	
define "Condition 3":
	exists(["Procedure, Performed": "arthroscopy: debridement"]) 
	and "Arthroscopy condition"
	and exists(["Diagnosis":"Osteoarthritis (disorder)"])

	
define "Not Covered":
	"Condition 1" or "Condition 2" or "Condition 3"

