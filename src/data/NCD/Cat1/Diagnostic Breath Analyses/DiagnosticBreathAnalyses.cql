library DiagnosticBreathAnalyses

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Hydrogen breath test using lactose (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Lactose intolerance (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Small bowel bacterial overgrowth syndrome (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Carbon dioxide breath test (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Bile acid malabsorption syndrome (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Intestinal malabsorption of fat (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'

define "Covered":
	exists(["Diagnosis": "Lactose intolerance (disorder)"])
	and exists(["Procedure, Performed": "Hydrogen breath test using lactose (procedure)"])

define "Not Covered":
	(exists(["Diagnosis": "Small bowel bacterial overgrowth syndrome (disorder)"])
		and exists(["Procedure, Performed": "Hydrogen breath test using lactose (procedure)"]))
	or (exists(["Diagnosis": "Bile acid malabsorption syndrome (disorder)"])
		and exists(["Procedure, Performed": "Carbon dioxide breath test (procedure)"]))
	or (exists(["Diagnosis": "Intestinal malabsorption of fat (disorder)"])
		and exists(["Procedure, Performed": "Carbon dioxide breath test (procedure)"]))
	
define "Coverage":
	"Covered" and not "Not Covered"
