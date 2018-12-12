library CardiacRehabilitationProgramsforChronicHeartFailure version '1'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Chronic heart failure (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Left ventricular Ejection fraction":'2.16.840.1.113883.6.1'
valueset "New York Heart Association Classification - Class II (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "New York Heart Association Classification - Class III (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "New York Heart Association Classification - Class IV (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Associated symptom (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Cardiovascular therapy (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Acute myocardial infarction (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Coronary artery bypass grafting (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Stable angina (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Repair of heart valve (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Heart valve replacement (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Percutaneous transluminal coronary angioplasty (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Transplantation of heart (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Allotransplant of heart and lung (procedure)":'2.16.840.1.113883.3.88.12.80.28'

parameter "Measurement Period" Interval<DateTime>

define "Stable Patients":
	["Procedure, Performed": "Cardiovascular therapy (procedure)"]CV 
	where duration in weeks of CV.relevantPeriod <= 6 or duration in months of CV.relevantPeriod <= 6

define "Conditions":
	exists(["Diagnosis": "Acute myocardial infarction (disorder)"])
	or exists(["Procedure, Performed": "Coronary artery bypass grafting (procedure)"])
	or exists(["Diagnosis": "Stable angina (disorder)"])
	or exists(["Procedure, Performed": "Heart valve replacement (procedure)"])
	or exists(["Procedure, Performed": "Repair of heart valve (procedure)"])
	or exists(["Procedure, Performed": "Percutaneous transluminal coronary angioplasty (procedure)"])
	or exists(["Procedure, Performed": "Transplantation of heart (procedure)"])
	or exists(["Procedure, Performed": "Allotransplant of heart and lung (procedure)"])

define "Covered":
	(exists("Stable Patients") 
	and exists(["Diagnosis": "Chronic heart failure (disorder)"])
	and exists(["Assessment, Performed": "Left ventricular Ejection fraction"]L where L.result <= 35)
	and ((exists(["Assessment, Performed": "New York Heart Association Classification - Class II (finding)"])
		or exists(["Assessment, Performed": "New York Heart Association Classification - Class III (finding)"])
		or exists(["Assessment, Performed": "New York Heart Association Classification - Class IV (finding)"]))
		and exists(["Assessment, Performed": "Associated symptom (finding)"])))
	and "Conditions"
	

define "Coverage":
	"Covered"
