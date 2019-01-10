library AdultLiverTransplantation version '1'

using FHIR version '1.8'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": 'http://snomed.info/sct'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "ICD9CM": 'https://www.cdc.gov/nchs/icd/icd9.htm'
codesystem "RXNORM": 'https://www.nlm.nih.gov/research/umls/rxnorm/'
codesystem "ICD10CM": ''
codesystem "ICD10PCS": ''
codesystem "NUCCPT": ''

//valueset "Encounter for aftercare following liver transplant":'2.16.840.1.113883.3.88.12.3221.7.4'
//valueset "Other long term (current) drug therapy": '2.16.840.1.113762.1.4.1096.101'
//valueset "Hepatic failure, unspecified without coma":'2.16.840.1.113883.3.88.12.3221.7.4'

//code "Diabetic foot examination (regime/therapy) code": '401191002' from "SNOMEDCT" display 'Diabetic foot examination (regime/therapy)'
code "Hepatic failure, unspecified without coma code": 'K72.90' from "ICD10CM" display 'Hepatic failure, unspecified without coma'
//code "Chronic pain due to malignancy (finding) code": '10181000119102'  from "SNOMEDCT" display 'Chronic pain due to malignancy (finding)'
code "Transplantation of Liver, Allogeneic, Open Approach code": '0FY00Z0' from "ICD10PCS" display 'Transplantation of Liver, Allogeneic, Open Approach'
code "Transplantation of Liver, Syngeneic, Open Approach code": '0FY00Z1' from "ICD10PCS" display 'Transplantation of Liver, Syngeneic, Open Approach'
code "Transplantation of Liver, Zooplastic, Open Approach code": '0FY00Z2' from "ICD10PCS" display 'Transplantation of liver (procedure)'
//code "Secondary neuroendocrine tumor of liver code": '209.72' from "ICD9CM" display 'Secondary neuroendocrine tumor of liver'
//code "Metastasis from malignant tumor of liver (disorder) code": '315000005' from "SNOMEDCT" display 'Metastasis from malignant tumor of liver (disorder)'
//code "Carcinoma in situ of extrahepatic bile ducts (disorder) code": '92589000' from "SNOMEDCT" display 'Carcinoma in situ of extrahepatic bile ducts (disorder)'
//code "Cholangiocarcinoma of biliary tract (disorder) code": '312104005' from "SNOMEDCT" display 'Cholangiocarcinoma of biliary tract (disorder)'
//code "Tumor surgically unresectable (finding) code": '711361003' from "SNOMEDCT" display 'Tumor surgically unresectable (finding)'
//code "Hemangioendothelioma of liver (disorder) code": '427744002' from "SNOMEDCT" display 'Hemangioendothelioma of liver (disorder)'
code "Encounter for aftercare following liver transplant code": 'Z48.23' from "ICD10CM" display 'Encounter for aftercare following liver transplant'
code "Ambulatory Health Care Facilities; Clinic/Center, Federally Qualified Health Center (FQHC) code": '261QF0400X' from "NUCCPT" display 'Ambulatory Health Care Facilities; Clinic/Center, Federally Qualified Health Center (FQHC)'
code "Other long term (current) drug therapy code": 'Z79.899' from "ICD10CM" display 'Other long term (current) drug therapy'

concept "Other long term (current) drug therapy": {"Other long term (current) drug therapy code"} display 'Other long term (current) drug therapy'
concept "Ambulatory Health Care Facilities; Clinic/Center, Federally Qualified Health Center (FQHC)": {"Ambulatory Health Care Facilities; Clinic/Center, Federally Qualified Health Center (FQHC) code"}display 'Ambulatory Health Care Facilities; Clinic/Center, Federally Qualified Health Center (FQHC)'
//concept "Diabetic foot examination (regime/therapy)": {"Diabetic foot examination (regime/therapy) code"} display 'Diabetic foot examination (regime/therapy)'
concept "Hepatic failure, unspecified without coma": {"Hepatic failure, unspecified without coma code"} display 'Hepatic failure, unspecified without coma'
//concept "Chronic pain due to malignancy (finding)": {"Chronic pain due to malignancy (finding) code"} display 'Chronic pain due to malignancy (finding)'
concept "Transplantation of Liver, Allogeneic, Open Approach": {"Transplantation of Liver, Allogeneic, Open Approach code"} display 'Transplantation of Liver, Allogeneic, Open Approach'
concept "Transplantation of Liver, Syngeneic, Open Approach": {"Transplantation of Liver, Syngeneic, Open Approach code"} display 'Transplantation of Liver, Syngeneic, Open Approach'
concept "Transplantation of Liver, Zooplastic, Open Approach": {"Transplantation of Liver, Zooplastic, Open Approach code"} display 'Transplantation of Liver, Zooplastic, Open Approach'
//concept "Secondary neuroendocrine tumor of liver": {"Secondary neuroendocrine tumor of liver code"} display 'Secondary neuroendocrine tumor of liver'
//concept "Metastasis from malignant tumor of liver (disorder)": {"Metastasis from malignant tumor of liver (disorder) code"} display 'Metastasis from malignant tumor of liver (disorder)'
//concept "Carcinoma in situ of extrahepatic bile ducts (disorder)": {"Carcinoma in situ of extrahepatic bile ducts (disorder) code"} display 'Carcinoma in situ of extrahepatic bile ducts (disorder)'
//concept "Cholangiocarcinoma of biliary tract (disorder)": {"Cholangiocarcinoma of biliary tract (disorder) code"} display 'Cholangiocarcinoma of biliary tract (disorder)'
//concept "Tumor surgically unresectable (finding)": {"Tumor surgically unresectable (finding) code"}display 'Tumor surgically unresectable (finding)'
//concept "Hemangioendothelioma of liver (disorder)": {"Hemangioendothelioma of liver (disorder) code"} display 'Hemangioendothelioma of liver (disorder)'
concept "Encounter for aftercare following liver transplant": {"Encounter for aftercare following liver transplant code"} display 'Encounter for aftercare following liver transplant'

context Patient

define "Procedures":
    {{"Procedure": "Transplantation of Liver, Allogeneic, Open Approach"},{'or'},
    {"Procedure": "Transplantation of Liver, Syngeneic, Open Approach"},{'or'},
    {"Procedure": "Transplantation of Liver, Zooplastic, Open Approach"}}

define "Documents":
	"Procedures" union {"Condition": "Hepatic failure, unspecified without coma",
                         "Location":"Ambulatory Health Care Facilities; Clinic/Center, Federally Qualified Health Center (FQHC)",
                         "EpisodeOfCare": "Encounter for aftercare following liver transplant",
                         "MedicationStatement": "Other long term (current) drug therapy"}
	
define "AttachableDocuments":
	'Seven Element Order'
	
define "Requirements":
	"Documents" union "AttachableDocuments"