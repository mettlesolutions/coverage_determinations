//Pancreas Transplants
library ChlamydiaScreening_Common version '2'

using QDM version '5.3'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
codesystem "HCPCS": '2.16.840.1.113883.6.285'
codesystem "NDFRT": '2.16.840.1.113883.3.26.1.5'

valueset "Transplantation of pancreas (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Whole organ pancreatic transplant (procedure)": '2.16.840.1.113762.1.4.1029.23'
valueset "Immunosuppressive therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Diabetes mellitus type 1 (disorder)": '2.16.840.1.113762.1.4.1018.240'
//beta cell autoantibody positive
valueset "Labile affect (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Metabolic complication of procedures (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hospitalization": '2.16.840.1.113762.1.4.1164.40'
valueset "Hypoglycemia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Ketoacidosis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Endocrinologist (occupation)": '2.16.840.1.113762.1.4.1099.14'
valueset "Autotransplantation of pancreatic tissue (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Kidney Transplant": '2.16.840.1.113883.3.464.1003.109.11.1052'
valueset "C-Peptide [Chemical/Ingredient]": '2.16.840.1.113762.1.4.1010.1'
valueset "Diabetes mellitus caused by insulin receptor antibodies (disorder)":'2.16.840.1.113883.3.464.1003.103.11.1027'
valueset "Brittle diabetes mellitus (finding)": '2.16.840.1.113762.1.4.1018.240'
valueset "Acute care hospital": '2.16.840.1.113883.3.666.5.684'
valueset "C-peptide stimulation test (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Fasting blood glucose measurement (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Hypoglycemia unawareness in type 2 diabetes mellitus (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Last hypoglycemia attack (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Compliance issues discussed with patient (finding)": '2.16.840.1.113762.1.4.1147.2'
valueset "Risk evaluation and mitigation strategy consultation (procedure)": '2.16.840.1.113762.1.4.1147.2'
valueset "Partial Pancreas Transplant": '2.16.840.1.113762.1.4.1029.23'
valueset "Low (qualifier value)" : '2.16.840.1.113762.1.4.1181.15'
valueset "Discharged from inpatient care (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Islet cell transplant (procedure)" : '2.16.840.1.113883.3.88.12.80.28'

parameter MeasurementPeriod Interval<Date>
context Patient

define "Transplant":
	(exists (["Procedure, Performed": "Transplantation of pancreas (procedure)"]))
	
define "Discharge":
		(exists (["Encounter, Performed" : "Discharged from inpatient care (finding)"]P
		where P.relevantPeriod during MeasurementPeriod)
		and "Transplant" )

define "afterKidneyTransplant":
	if(exists (["Procedure, Performed": "Kidney Transplant"]))
		then "Transplant" and (exists (["Procedure, Performed": "Immunosuppressive therapy (procedure)"])
			and "Discharge")
	else
		null
	
define "C-peptide":
		(exists ( ["Laboratory Test, Performed": "C-peptide stimulation test (procedure)"]D
		where D.result <= 110 '%' and D.status = "Low (qualifier value)"))
	
define "Type1Diabetes":
	(exists (["Diagnosis": "Diabetes mellitus caused by insulin receptor antibodies (disorder)"]) or
	(exists (["Diagnosis": "Diabetes mellitus type 1 (disorder)"])) and "C-peptide" and (exists (["Laboratory Test, Performed":"Fasting blood glucose measurement (procedure)"]L
	where L.result <= 225 'mg/dL'))
	)
	
define "Indications": 
	(exists (["Procedure, Performed": "Transplantation of pancreas (procedure)"]) and (exists (["Procedure, Performed": "Kidney Transplant"]))
	or "afterKidneyTransplant"
	or "Type1Diabetes"
	or (exists (["Diagnosis": "Diabetes mellitus type 1 (disorder)"]))
	or (exists (["Diagnosis": "Brittle diabetes mellitus (finding)"]) and (exists (["Diagnosis": "Metabolic complication of procedures (disorder)"])) and (exists (["Diagnosis": "Hospitalization"])))
	or (exists (["Diagnosis": "Brittle diabetes mellitus (finding)"]) and (exists (["Diagnosis": "Hypoglycemia unawareness in type 2 diabetes mellitus (disorder)"] )))
	or (exists (["Diagnosis": "Brittle diabetes mellitus (finding)"]) and (exists (["Diagnosis": "Ketoacidosis (disorder)"])))
	or (exists (["Diagnosis": "Brittle diabetes mellitus (finding)"]) and (exists (["Diagnosis": "Last hypoglycemia attack (finding)"])))
	or (exists (["Encounter, Performed": "Endocrinologist (occupation)"]E
		where duration in months of E.relevantPeriod >= 12))
	or (exists (["Procedure, Performed": "Risk evaluation and mitigation strategy consultation (procedure)"]) and (exists (["Procedure, Performed": "Compliance issues discussed with patient (finding)"]))
		and (exists (["Procedure, Performed": "Immunosuppressive therapy (procedure)"])))
	)	

define "Limitations":
	(exists (["Diagnosis": "Partial Pancreas Transplant"])
	or (exists (["Diagnosis":"Islet cell transplant (procedure)"]))
	)
	
define "Coverage":
	"Indications" and not "Limitations"
