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
valueset "Immunosuppressive therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Diabetes mellitus type 1 (disorder)": '2.16.840.1.113762.1.4.1018.240'
//beta cell autoantibody positive
valueset "Labile affect (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Metabolic complication of procedures (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hospitalization": '2.16.840.1.113762.1.4.1164.40'
valueset "Ketoacidosis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Endocrinologist (occupation)": '2.16.840.1.113762.1.4.1099.14'
valueset "Kidney Transplant": '2.16.840.1.113883.3.464.1003.109.11.1052'
valueset "Diabetes mellitus caused by insulin receptor antibodies (disorder)":'2.16.840.1.113883.3.464.1003.103.11.1027'
valueset "Brittle diabetes mellitus (finding)": '2.16.840.1.113762.1.4.1018.240'
valueset "Acute care hospital": '2.16.840.1.113883.3.666.5.684'
valueset "C-peptide stimulation test (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Fasting blood glucose measurement (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Hypoglycemia unawareness in type 2 diabetes mellitus (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Last hypoglycemia attack (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'


context Patient

define "Transplant":
	["Procedure, Performed": "Transplantation of pancreas (procedure)"]
	
define "KidneyTransplant":
	["Procedure, Performed": "Kidney Transplant"]P
	with "Transplant"T such that T.relevantPeriod starts after P.relevantPeriod
	
define "Indications": 
	["Procedure, Performed": "Transplantation of pancreas (procedure)"] union ["Procedure, Performed": "Kidney Transplant"]
	or "KidneyTransplant"
	or ["Diagnosis": "Diabetes mellitus type 1 (disorder)"]
	or ["Diagnosis": "Brittle diabetes mellitus (finding)"] union ["Diagnosis": "Metabolic complication of procedures (disorder)"] union ["Diagnosis": "Hospitalization"]
	or ["Diagnosis": "Brittle diabetes mellitus (finding)"] union ["Diagnosis": "Hypoglycemia unawareness in type 2 diabetes mellitus (disorder)"] 
	or ["Diagnosis": "Brittle diabetes mellitus (finding)"] union ["Diagnosis": "Ketoacidosis (disorder)"] 
	or ["Diagnosis": "Brittle diabetes mellitus (finding)"] union ["Diagnosis": "Last hypoglycemia attack (finding)"]
	or ["Encounter, Performed": 
	
define "Type1Diabetes":
	["Diagnosis": "Diabetes mellitus caused by insulin receptor antibodies (disorder)"] or
	["Diagnosis": "Diabetes mellitus type 1 (disorder)"] union ["Laboratory Test, Performed": "C-peptide stimulation test (procedure)"]D union ["Laboratory Test, Performed":"Fasting blood glucose measurement (procedure)"]L
	where D.result <= 1.1 * D.referenceRangelow and L.result <= 225 'mg/dL'
	
