library BariatricSurgeryforTreatmentofCoMorbidConditionsRelatedtoMorbidObesity version '1'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Body mass index [BMI]":'2.16.840.1.113883.6.103'
valueset "Co-morbid conditions (finding)":'2.16.840.1.113883.6.96'
valueset "Body mass index 30+ - obesity (finding)":'2.16.840.1.113883.6.96'
valueset "Obesity (disorder)":'2.16.840.1.113883.6.96'
valueset "Absence of therapeutic response (finding)":'2.16.840.1.113883.6.96'
valueset "Laparoscopic adjustable gastric banding (procedure)":'2.16.840.1.113883.6.96'
valueset "Laparoscopic sleeve gastrectomy (procedure)":'2.16.840.1.113883.6.96'
valueset "Gastric stapling for obesity (procedure)":'2.16.840.1.113883.6.96'
valueset "Stapling of stomach (procedure)":'2.16.840.1.113883.6.96'
valueset "Intestinal bypass for morbid obesity (procedure)":'2.16.840.1.113883.6.96'
valueset "Insertion of gastric balloon (procedure)":'2.16.840.1.113883.6.96'


define "Not Covered":
	exists(["Procedure, Performed": "Laparoscopic adjustable gastric banding (procedure)"])
	or exists(["Procedure, Performed": "Laparoscopic sleeve gastrectomy (procedure)"])
	or exists(["Procedure, Performed": "Gastric stapling for obesity (procedure)"])
	or exists(["Procedure, Performed": "Intestinal bypass for morbid obesity (procedure)"])
	or exists(["Procedure, Performed": "Insertion of gastric balloon (procedure)"])
	
		
define "Covered":
	exists(["Assessment, Performed": "Body mass index [BMI]"]BMI where BMI.result>=35)
	and (exists(["Assessment, Performed": "Co-morbid conditions (finding)"]) 
		and exists(["Diagnosis": "Obesity (disorder)"]))
	and (exists(["Assessment, Performed": "Absence of therapeutic response (finding)"]) 
		and exists(["Diagnosis": "Obesity (disorder)"]))
	
	
define "Coverage":
	"Covered" and not "Not Covered"
