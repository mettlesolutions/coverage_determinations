library DiagnosticPapSmears

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Encounter Face to Face": '2.16.840.1.113762.1.4.1111.78'
valueset "Seen by physician (finding)":'2.16.840.1.113883.6.96'
valueset "Treatment completed (situation)":'2.16.840.1.113883.6.96'
valueset "Cancer treatment started (situation)":'2.16.840.1.113883.6.96'
valueset "Abnormal cervical smear (finding)":'2.16.840.1.113883.6.96'
valueset "Cancer Diagnosis":'2.16.840.1.113762.1.4.1116.366'
valueset "Malignant neoplasm of vagina":'2.16.840.1.113883.6.90'
valueset "Malignant neoplasm of cervix uteri, unspecified":'2.16.840.1.113883.6.90'
valueset "Malignant neoplasm of uterus, part unspecified":'2.16.840.1.113883.6.90'
valueset "Vaginal cervix (body structure)":'2.16.840.1.113883.6.96'
valueset "Vaginal part (body structure)":'2.16.840.1.113883.6.96'
valueset "Uterus part (body structure)":'2.16.840.1.113883.6.96'
valueset "Ovarian part (body structure)":'2.16.840.1.113883.6.96'
valueset "Entire uterine adnexa (body structure)":'2.16.840.1.113883.6.96'
valueset "Abnormal finding on evaluation procedure (finding)":'2.16.840.1.113883.6.96'
valueset "Abnormal female reproductive function (finding)":'2.16.840.1.113883.6.96'
valueset "Complaint (finding)":'2.16.840.1.113883.6.96'
valueset "Associated symptom (finding)":'2.16.840.1.113883.6.96'
valueset "Referred by primary care physician (finding)":'2.16.840.1.113883.6.96'
valueset "Gynecological examination abnormal (finding)":'2.16.840.1.113883.6.96'
valueset "Examination of female genital tract under anesthetic and papanicolau smear (procedure)":'2.16.840.1.113883.6.96'

define "Condition1":
	(exists(["Diagnosis": "Malignant neoplasm of vagina"])
		or exists(["Diagnosis": "Malignant neoplasm of cervix uteri, unspecified"])
		or exists(["Diagnosis": "Malignant neoplasm of uterus, part unspecified"]))
	and (exists(["Assessment, Performed": "Cancer treatment started (situation)"])
		or exists(["Assessment, Performed": "Treatment completed (situation)"]))

define "Condition3":
	(exists("Vaginal cervix (body structure)") 
		or exists("Vaginal part (body structure)")
		or exists("Uterus part (body structure)")
		or exists("Ovarian part (body structure)")
		or exists("Entire uterine adnexa (body structure)")) 
	and exists(["Assessment, Performed": "Abnormal finding on evaluation procedure (finding)"])

define "Conditions":
	"Condition1"
	or exists(["Assessment, Performed": "Abnormal cervical smear (finding)"])
	or "Condition3"
	or (exists(["Assessment, Performed": "Complaint (finding)"])
		and exists(["Assessment, Performed": "Abnormal female reproductive function (finding)"]))
	or (exists(["Assessment, Performed": "Associated symptom (finding)"])
		and exists(["Assessment, Performed": "Gynecological examination abnormal (finding)"])
		and exists(["Assessment, Performed": "Referred by primary care physician (finding)"]))
	

define "Covered":
	exists(["Diagnostic Study, Order": "Examination of female genital tract under anesthetic and papanicolau smear (procedure)"])
	and exists(["Encounter, Performed": "Encounter Face to Face"]) 
	and exists(["Encounter, Performed": "Seen by physician (finding)"])
	and "Conditions"
	
define "Coverage":
	"Covered"
