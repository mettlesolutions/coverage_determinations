library AdultLiverTransplantation

using FHIR

include FHIRHelpers version '1.8' called FHIRHelpers

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

//valueset "Transplantation of liver (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//valueset "Secondary malignant neoplasm of liver and intrahepatic bile duct":'2.16.840.1.113883.3.88.12.3221.7.4'
//valueset "Carcinoma in situ of liver, gallbladder and bile ducts":'2.16.840.1.113883.3.526.3.1010'
//valueset "Other malignant neuroendocrine tumors":'2.16.840.1.113883.3.526.3.1010'
//valueset "Malignant neoplasm of extrahepatic bile duct":'2.16.840.1.113883.3.88.12.3221.7.4'
//valueset "Tumor surgically unresectable (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
//valueset "Hemangioma unspecified site":'2.16.840.1.113762.1.4.1029.63'
//valueset "Acute hepatitis B (ICD10CM)": '2.16.840.1.113762.1.4.1146.131'
//valueset "Instructions for Follow Up After Discharge":'2.16.840.1.113883.3.117.1.7.1.378'
//valueset "Immunosuppressive therapy for transplant (procedure)":'2.16.840.1.113883.3.88.12.3221.7.4'
//valueset "Postoperative follow-up visit (procedure)":'2.16.840.1.113883.3.88.12.3221.7.4'
//valueset "Encounter for aftercare following liver transplant":'2.16.840.1.113883.3.88.12.3221.7.4'
//valueset "Immunosuppressive Drugs for Urology Care":'2.16.840.1.113762.1.4.1151.32'
//valueset "Sandimmune Drug":'2.16.840.1.113762.1.4.1010.7'
//valueset "Imuran Drug":'2.16.840.1.113762.1.4.1010.7'
//valueset "ATGAM Drug":'2.16.840.1.113762.1.4.1010.7'
//valueset "Muromonab-CD3 Drug":'2.16.840.1.113762.1.4.1010.7'
//valueset "Prograf Drug":'2.16.840.1.113762.1.4.1010.7'
//valueset "mycophenolate mofetil Drug":'2.16.840.1.113762.1.4.1010.7'
//valueset "Daclizumab Drug":'2.16.840.1.113762.1.4.1010.7'
//valueset "Cyclophosphamide Drug":'2.16.840.1.113762.1.4.1010.7'
//valueset "Prednisone Drug":'2.16.840.1.113762.1.4.1010.7'

//code "Diabetic foot examination (regime/therapy) code": '401191002' from "SNOMEDCT" display 'Diabetic foot examination (regime/therapy)'
code "Hepatic failure, unspecified without coma code": 'K72.90' from "ICD10CM" display 'Hepatic failure, unspecified without coma'
//code "Acute hepatitis B code": 'B16'  from "ICD10CM" display 'Acute hepatitis B'
code "Neoplasm related pain (acute) (chronic) code": 'G89.3'  from "ICD10CM" display 'Neoplasm related pain (acute) (chronic)'
code "Transplantation of Liver, Allogeneic, Open Approach code": '0FY00Z0' from "ICD10PCS" display 'Transplantation of Liver, Allogeneic, Open Approach'
code "Transplantation of Liver, Syngeneic, Open Approach code": '0FY00Z1' from "ICD10PCS" display 'Transplantation of Liver, Syngeneic, Open Approach'
code "Transplantation of Liver, Zooplastic, Open Approach code": '0FY00Z2' from "ICD10PCS" display 'Transplantation of liver (procedure)'
code "Other malignant neuroendocrine tumors code": 'C7A.8' from "ICD10CM" display 'Other malignant neuroendocrine tumors'
code "Secondary malignant neoplasm of liver and intrahepatic bile duct code": 'C78.7' from "ICD10CM" display 'Secondary malignant neoplasm of liver and intrahepatic bile duct'
code "Malignant neoplasm of extrahepatic bile duct code": 'C24.0' from "ICD10CM" display 'Malignant neoplasm of extrahepatic bile duct'
code "Carcinoma in situ of liver, gallbladder and bile ducts code": 'D01.5' from "ICD10CM" display 'Carcinoma in situ of liver, gallbladder and bile ducts'
//code "Tumor surgically unresectable (finding) code": '711361003' from "SNOMEDCT" display 'Tumor surgically unresectable (finding)'
code "Hemangioma unspecified site code": 'D18.00' from "ICD10CM" display 'Hemangioma unspecified site'
code "Encounter for aftercare following liver transplant code": 'Z48.23' from "ICD10CM" display 'Encounter for aftercare following liver transplant'
code "Sandimmune code":'202816' from "RXNORM" display 'Sandimmune'
code "Imuran code":'202559' from "RXNORM" display 'Imuran'
code "ATGAM code":'1204' from "RXNORM" display 'ATGAM'
code "Muromonab-CD3 code":'42405' from "RXNORM" display 'Muromonab-CD3'
code "Prograf code":'196463' from "RXNORM" display 'Prograf'
code "mycophenolate mofetil code":'68149' from "RXNORM" display 'mycophenolate mofetil'
code "Daclizumab code":'190353' from "RXNORM" display 'Daclizumab'
code "Cyclophosphamide code":'3002' from "RXNORM" display 'Cyclophosphamide'
code "Prednisone code":'8640' from "RXNORM" display 'Prednisone'
code "Other long term (current) drug therapy code": 'Z79.899' from "ICD10CM" display 'Other long term (current) drug therapy'

concept "Other long term (current) drug therapy": {"Other long term (current) drug therapy code"} display 'Other long term (current) drug therapy'
//concept "Diabetic foot examination (regime/therapy)": {"Diabetic foot examination (regime/therapy) code"} display 'Diabetic foot examination (regime/therapy)'
concept "Hepatic failure, unspecified without coma": {"Hepatic failure, unspecified without coma code"} display 'Hepatic failure, unspecified without coma'
//concept "Acute hepatitis B": {"Acute hepatitis B code"} display 'Acute hepatitis B'
concept "Neoplasm related pain (acute) (chronic)": {"Neoplasm related pain (acute) (chronic) code"} display 'Neoplasm related pain (acute) (chronic)'
concept "Transplantation of Liver, Allogeneic, Open Approach": {"Transplantation of Liver, Allogeneic, Open Approach code"} display 'Transplantation of Liver, Allogeneic, Open Approach'
concept "Transplantation of Liver, Syngeneic, Open Approach": {"Transplantation of Liver, Syngeneic, Open Approach code"} display 'Transplantation of Liver, Syngeneic, Open Approach'
concept "Transplantation of Liver, Zooplastic, Open Approach": {"Transplantation of Liver, Zooplastic, Open Approach code"} display 'Transplantation of Liver, Zooplastic, Open Approach'
concept "Other malignant neuroendocrine tumors": {"Other malignant neuroendocrine tumors code"} display 'Other malignant neuroendocrine tumors'
concept "Secondary malignant neoplasm of liver and intrahepatic bile duct": {"Secondary malignant neoplasm of liver and intrahepatic bile duct code"} display 'Secondary malignant neoplasm of liver and intrahepatic bile duct'
concept "Malignant neoplasm of extrahepatic bile duct": {"Malignant neoplasm of extrahepatic bile duct code"} display 'Malignant neoplasm of extrahepatic bile duct'
//concept "Carcinoma in situ of liver, gallbladder and bile ducts": {"Carcinoma in situ of liver, gallbladder and bile ducts code"} display 'Carcinoma in situ of liver, gallbladder and bile ducts'
//concept "Tumor surgically unresectable (finding)": {"Tumor surgically unresectable (finding) code"}display 'Tumor surgically unresectable (finding)'
concept "Hemangioma unspecified site": {"Hemangioma unspecified site code"} display 'Hemangioma unspecified site'
concept "Encounter for aftercare following liver transplant": {"Encounter for aftercare following liver transplant code"} display 'Encounter for aftercare following liver transplant'
concept "Sandimmune": {"Sandimmune code"} display 'Sandimmune'
concept "Imuran": {"Imuran code"} display 'Imuran'
concept "ATGAM": {"ATGAM code"} display 'ATGAM'
concept "Muromonab-CD3": {"Muromonab-CD3 code"} display 'Muromonab-CD3'
concept "Prograf": {"Prograf code"} display 'Prograf'
concept "mycophenolate mofetil": {"mycophenolate mofetil code"} display 'mycophenolate mofetil'
concept "Daclizumab":{"Daclizumab code"} display 'Daclizumab'
concept "Cyclophosphamide":{"Cyclophosphamide code"} display 'Cyclophosphamide'
concept "Prednisone":{"Prednisone code"} display 'Prednisone'


context Patient


define "Livertransplant":
	exists([Condition: "Hepatic failure, unspecified without coma"])
//	and exists([Procedure: "Transplantation of liver (procedure)"])
	and not exists([Condition: "Neoplasm related pain (acute) (chronic)"])
	
			
define "neuroendocrinetumor":
	exists([Condition:"Hepatic failure, unspecified without coma"])
	and exists([Condition:"Other malignant neuroendocrine tumors"])
	and exists([Condition:"Secondary malignant neoplasm of liver and intrahepatic bile duct"])
//	and exists([Procedure:"Transplantation of liver (procedure)"])

define "Cholangiocarcinoma":
	exists([Condition: "Hepatic failure, unspecified without coma"])
	and exists([Condition: "Malignant neoplasm of extrahepatic bile duct"])
//	and exists([Condition: "Tumor surgically unresectable (finding)"])
//	and exists([Procedure: "Transplantation of liver (procedure)"])
	
define "Hemangioendothelioma":
	exists([Condition: "Hemangioma unspecified site"])

define "Malignancies":
	Cholangiocarcinoma
	or neuroendocrinetumor
	or Hemangioendothelioma
		
define "Covered":
    if ((exists([Procedure: "Transplantation of Liver, Allogeneic, Open Approach"])
            or exists([Procedure: "Transplantation of Liver, Syngeneic, Open Approach"])
            or exists([Procedure: "Transplantation of Liver, Zooplastic, Open Approach"]))
	    and (Livertransplant or Malignancies or Followup or ImmunosuppressiveDrugs))
	then true
	else false
	
define "Followup":
	exists(
		[ClinicalImpression: "Encounter for aftercare following liver transplant"]
	)
	
define "ImmunosuppressiveDrugs":
    exists([Procedure: "Other long term (current) drug therapy"])
	//exists([MedicationAdministration: "Sandimmune"])
//	or exists([MedicationAdministration: "Imuran"])
//	or exists([MedicationAdministration: "ATGAM"])
//	or exists([MedicationAdministration: "Muromonab-CD3"])
//	or exists([MedicationAdministration: "Prograf"])
//	or exists([MedicationAdministration: "mycophenolate mofetil"])
//	or exists([MedicationAdministration: "Daclizumab"])
//	or exists([MedicationAdministration: "Cyclophosphamide"])
//	or exists([MedicationAdministration: "Prednisone"])

	
define "Coverage":
	"Covered"