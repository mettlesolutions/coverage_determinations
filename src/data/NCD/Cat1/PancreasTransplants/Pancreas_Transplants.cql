//Pancreas Transplants
library PancreasTransplants

using FHIR

include FHIRHelpers version '1.8' called FHIRHelpers
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
parameter MeasurementPeriod1 default @2006-04-26T00:00:00.0
context Patient

define "Transplant":
	(exists (["Procedure": "Transplantation of pancreas (procedure)"] T
	where T.performed on or after MeasurementPeriod1))
	
define "Discharge":
		(exists (["Encounter" : "Discharged from inpatient care (finding)"]P
		where P.period during MeasurementPeriod)
		and "Transplant" )

define "afterKidneyTransplant":
	if(exists (["Procedure": "Kidney Transplant"]))
		then "Transplant" and (exists (["Procedure": "Immunosuppressive therapy (procedure)"])
			and "Discharge")
	else
		null
	
define "C-peptide":
		(exists ( ["Observation": "C-peptide stimulation test (procedure)"]D
		where  (D.value ) <= 110 '%' and D.status = "Low (qualifier value)"))
	
define "Type1Diabetes":
	(exists (["Condition": "Diabetes mellitus caused by insulin receptor antibodies (disorder)"]) or
	(exists (["Condition": "Diabetes mellitus type 1 (disorder)"])) and "C-peptide" and (exists (["Observation":"Fasting blood glucose measurement (procedure)"]L
	where (L.value) <= 225 'mg/dL'))
	)
	
define "Indications": 
	(exists (["Procedure": "Transplantation of pancreas (procedure)"]) and (exists (["Procedure": "Kidney Transplant"]))
	or "afterKidneyTransplant"
	or "Type1Diabetes"
	or (exists (["Condition": "Diabetes mellitus type 1 (disorder)"]))
	or (exists (["Condition": "Brittle diabetes mellitus (finding)"]) and (exists (["Condition": "Metabolic complication of procedures (disorder)"])) and (exists (["Condition": "Hospitalization"])))
	or (exists (["Condition": "Brittle diabetes mellitus (finding)"]) and (exists (["Condition": "Hypoglycemia unawareness in type 2 diabetes mellitus (disorder)"] )))
	or (exists (["Condition": "Brittle diabetes mellitus (finding)"]) and (exists (["Condition": "Ketoacidosis (disorder)"])))
	or (exists (["Condition": "Brittle diabetes mellitus (finding)"]) and (exists (["Condition": "Last hypoglycemia attack (finding)"])))
	or (exists (["Encounter": "Endocrinologist (occupation)"]E
		where duration in months of E.period >= 12))
	or (exists (["Procedure": "Risk evaluation and mitigation strategy consultation (procedure)"]) and (exists (["Procedure": "Compliance issues discussed with patient (finding)"]))
		and (exists (["Procedure": "Immunosuppressive therapy (procedure)"])))
	)	

define "Limitations":
	(exists (["Condition": "Partial Pancreas Transplant"])
	or (exists (["Condition":"Islet cell transplant (procedure)"]))
	)
	
define "Coverage":
	"Indications" and not "Limitations"
