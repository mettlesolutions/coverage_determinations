library Partial_Thromboplastin_time

using QDM version '5.3'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)


codesystem "ICD10CM": '2.16.840.1.113883.6.90'
codesystem "LOINC": '2.16.840.1.113883.6.1'
codesystem "RXNORM": '2.16.840.1.113883.6.88'
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'

valueset "Partial Thromboplastin Time": '2.16.840.1.113762.1.4.1045.25'
valueset "Unfractionated Heparin": '2.16.840.1.113883.3.117.1.7.1.218'
valueset "Prothrombin Time": '2.16.840.1.113883.17.4077.3.1006'
valueset "Anticoagulant Therapy": '2.16.840.1.113883.3.117.1.7.1.200'
valueset "Heparin therapy (procedure)": '2.16.840.1.113883.3.88.12.80.2'
valueset "Warfarin therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Hematoma of skin (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Petechiae (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Disseminated intravascular coagulation (disorder)": '2.16.840.1.113883.17.4077.3.1002'
valueset "Bleeding (finding)": '2.16.840.1.113762.1.4.1018.240'
valueset "Deep venous thrombosis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Intrinsic coagulation pathway finding (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Dysfibrinogenemia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Afibrinogenemia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Chronic Liver Disease": '2.16.840.1.113883.3.464.1003.199.11.1065'
valueset "Wilson's disease (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hemophilia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Blood coagulation disorder (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Lupus erythematosus (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Factor VIII inhibitor disorder (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Lupus anticoagulant disorder (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Sepsis": '2.16.840.1.113883.17.4077.2.2045'
valueset "Congenital von Willebrand's disease (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Von Willebrand's disease": '2.16.840.1.113883.17.4077.3.1002'
valueset "Venous thrombosis (disorder)": '2.16Di.840.1.113883.3.88.12.3221.7.4'
valueset "Arterial thrombosis (disorder)": '2.16.840.1.113762.1.4.1018.240'
valueset "Hypercoagulability state (finding)": '2.16.840.1.113762.1.4.1018.240'
valueset "Kidney Failure": '2.16.840.1.113883.3.464.1003.109.12.1027'
valueset "Coagulation/bleeding tests abnormal (finding)": '2.16.840.1.113762.1.4.1018.240'
//congenital coagulopathies
valueset "Coagulopathies": '2.16.840.1.113883.17.4077.2.1008'
valueset "Coagulation (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//Bleeding risk
valueset "Thrombocytopenia": '2.16.840.1.113762.1.4.1045.45'
//swollen extremity with or without prior trauma
valueset "Liver Disease": '2.16.840.1.113762.1.4.1047.42'
valueset "At risk of hemorrhage (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Chronic liver disease (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Liver Disease SNOMEDCT": '2.16.840.1.113762.1.4.1047.12'
//History of bleeding
//Family History of Heparin therapy
valueset "Poisoning caused by warfarin sodium (disorder)": '2.16.840.1.113883.17.4077.2.2078'
valueset "Drug dosage altered (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Thrombolytic therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Hemorrhage AND/OR hematoma complicating procedure (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Thrombosis (disorder)": '2.16.840.1.113883.3.2074.1.1.30'
valueset "Hematoma (disorder)": '2.16.840.1.113883.3.2074.1.1.30'

parameter "Measurement Period" Interval<DateTime>

context Patient

define "Indications": 
	["Diagnosis": "Thrombosis (disorder)"]
	or ["Diagnosis": "Hemorrhage AND/OR hematoma complicating procedure (disorder)"]
	or ["Diagnosis": "Coagulation/bleeding tests abnormal (finding)"]
	or ["Diagnosis": "Hematoma (disorder)"]
	or ["Diagnosis": "Thrombocytopenia"]
	or ["Diagnosis": "Disseminated intravascular coagulation (disorder)"]
	or ["Diagnosis": "Dysfibrinogenemia (disorder)"]
	or ["Diagnosis": "Afibrinogenemia (disorder)"]
	or ["Diagnosis": "Chronic liver disease (disorder)"]
	or ["Diagnosis": "Liver Disease"]
	or ["Diagnosis": "Wilson's disease (disorder)"]
	or ["Diagnosis": "Hemophilia (disorder)"]
	or ["Diagnosis": "Bleeding (finding)"]
	or ["Diagnosis": "Sepsis"]
	or ["Diagnosis": "Von Willebrand's disease"]
	or ["Diagnosis": "Venous thrombosis (disorder)"]
	or ["Diagnosis": "Arterial thrombosis (disorder)"]
	or ["Diagnosis": "Hypercoagulability state (finding)"]
	or ["Diagnosis": "Kidney Failure"]
	or ["Diagnosis": "Congenital von Willebrand's disease (disorder)"]
	or ["Diagnosis": "Thrombosis (disorder)"] union ["Family History": "Bleeding (finding)"]
	or ["Diagnosis": "Thrombosis (disorder)"] union ["Family History": "Heparin therapy (procedure)"]
	or ["Procedure, Performed": "Heparin therapy (procedure)"]P
	with "Warfarin"W such that P.relevantPeriod ends before start of W.relevantPeriod
	
define "Warfarin":
	["Procedure, Performed": "Warfarin therapy (procedure)"]Wa
	where Wa.relevantPeriod starts during "Measurement Period"
	
define "Symptomatic":
	["Symptom": "Bleeding (finding)"]
	or ["Symptom": "Thrombosis (disorder)"]
	or ["Diagnosis": "Coagulopathies"]
	
define "Coverage":
	"Indications" and "Symptomatic"
