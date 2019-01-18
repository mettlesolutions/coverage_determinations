library HomeOxygenTherapy version '1'

using FHIR

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": 'http://snomed.info/sct'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "ICD9CM": 'https://www.cdc.gov/nchs/icd/icd9.htm'
codesystem "EntityNamePartQualifier": '2.16.840.1.113883.11.20.9.26'
codesystem "LOINC": '2.16.840.1.113762.1.4.1099.13'
codesystem "NUCCPT":'2.16.840.1.114222.4.11.1066'
codesystem "ICD10CM":''

/*
valueset "Home oxygen therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Chronic Obstructive Pulmonary Disease": '2.16.840.1.113883.3.464.1003.102.11.1021'
valueset "Interstitial lung disease (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Cystic fibrosis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Bronchiectasis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Malignant tumor of lung (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hypoxia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Pulmonary hypertension (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Right heart failure (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Erythrocytosis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Impaired Cognition": '2.16.840.1.113762.1.4.1046.89'
valueset "Restlessness (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Morning headache (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Blood gas analysis (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Hospitalization": '2.16.840.1.113762.1.4.1164.40'
valueset "Discharge from Inpatient Facility": '2.16.840.1.113762.1.4.1138.721'
valueset "Encounter Hospital Outpatient": '2.16.840.1.113883.3.3157.1002.1'
valueset "Outpatient procedure (procedure)" : '2.16.840.1.113883.3.3157.1002.14'
valueset "Acute disease (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
//Alternative treatment
valueset "Evaluation of arterial blood gas studies (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Oximetry (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Oxygen saturation measurement, arterial (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Oxygen measurement, partial pressure, arterial (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Hypoxemia": '2.16.840.1.113762.1.4.1045.81'
valueset "Insomnia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Cor pulmonale (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "P pulmonale (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
//electrocardiogram [EKG]
valueset "Dependent edema (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Pulmonary artery pressure monitoring (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Pulmonary artery finding (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
//gated blood pool scan
//echocardiogram
valueset "Secondary polycythemia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Finding of hematocrit (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Long-term oxygen therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Clinical trial (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Cluster headache syndrome (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Unilateral headache (situation)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Inpatient": '2.16.840.1.113883.3.666.5.307'
valueset "Inpatient stay (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Patient's condition stable (finding)": '2.16.840.1.113762.1.4.1096.114'
valueset "Practitioner certification status (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Echocardiography (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Exercise tolerance test (procedure)": '2.16.840.1.113762.1.4.1018.240'
valueset "Exercises (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Resting state (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Sleeping out (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Awake (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Pulse oximetry (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Respiratory, Developmental, Rehabilitative and Restorative Service Providers; Respiratory Therapist, Certified": '2.16.840.1.114222.4.11.1066'
//Oxygen services furnished by an airline
//Stationary oxygen
//Portable oxygen
valueset "Oxygen therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//Accessories, maintenance, and repairs of patient-owned oxygen
valueset "Liquid oxygen (substance)": '2.16.840.1.113762.1.4.1010.2'
valueset "Suppliers; Durable Medical Equipment & Medical Supplies, Oxygen Equipment & Supplies": '2.16.840.1.114222.4.11.1066'
//doctor of osteopathy
//podiatric surgeon
valueset "Oxygen (substance)": '2.16.840.1.113762.1.4.1010.2'
valueset "Device (physical object)": '2.16.840.1.113762.1.4.1181.3'
valueset "Does move (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Does not move (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Gaseous substance (substance)": '2.16.840.1.113762.1.4.1010.2'
valueset "Arterial oxygen concentration measurement (procedure)": '2.16.840.1.113883.3.88.12.80.28'

valueset "Laboratory reporting, electronic (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Verifying presence of prosthetics (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Seen by orthotics service (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Patient condition assessed (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Home oxygen therapy management (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//Date Of Service
//Duration of condition
//Seen by practitioner
valueset "Illness (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Clinical examination education (procedure)": '2.16.840.1.113883.11.20.9.34'
valueset "Patient's condition worsened (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Patient's condition improved (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Conditional prognosis (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
//Results of the blood gas study,(Need to find)--> either printed data from the test or written in the notes
valueset "Home Care": '2.16.840.1.113883.1.11.20275'
//Nature and extent of functional limitations
valueset "Therapeutic regimen (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Gathering of past medical history (procedure)": '2.16.840.1.113762.1.4.1096.118'
//Other pertinent information
//Photocopy
//standard Medicare Detailed Written Order
// knowledge and documentation of the face-to-face examination
valueset "Provision of talking monitored dosage system (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Route of Administration": '2.16.840.1.113762.1.4.1018.98'
//Frequency of use
valueset "Infusion (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//valueset "Quantity finding (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'(Quantity to be dispensed)
//Number of refills
//physician review, sign, and date it
//National Provider Identifier
//Signature Date
//Is permitted to perform services in accordance with State law
valueset "Documentation of personal medication record (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Administration of prescribed medications based on arterial blood gas results (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Advance Care Plan": '2.16.840.1.113762.1.4.1116.468'
valueset "Assessment for home oxygen therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Physician (occupation)": '2.16.840.1.113762.1.4.1096.129'
valueset "Medical doctor (occupation)": '2.16.840.1.113762.1.4.1166.24'
valueset "Nurse practitioner (occupation)": '2.16.840.1.113762.1.4.1096.129'
valueset "Physician assistant (occupation)": '2.16.840.1.113762.1.4.1096.129'
valueset "Face to Face Encounter": '2.16.840.1.113762.1.4.1047.428'
valueset "In-person encounter (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Durable medical equipment surveillance (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Renewal of prescription (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Referral to clinical nurse specialist (procedure)": '2.16.840.1.113883.3.464.1003.101.12.1046'
valueset "Nursing evaluation of patient and report (procedure)": '2.16.840.1.113883.3.464.1003.101.12.1061'
valueset "Seen by clinical nurse specialist (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Prescription by nurse practitioner (situation)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Seen by nurse practitioner (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Seen by physician (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Referred by physician assistant (finding)": '2.16.840.1.113762.1.4.1096.216'
valueset "Encounter Face to Face": '2.16.840.1.113762.1.4.1111.78'
valueset "Prescription (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Change of prescription (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Evaluation AND/OR management - new patient (procedure)": '2.16.840.1.113883.3.2286'
valueset "Medicare (Non-managed Care)": '2.16.840.1.114222.4.11.3591'
valueset "National provider ID": '2.16.840.1.113762.1.4.1099.13'
valueset "Patient identifier": '2.16.840.1.113762.1.4.1099.13'
valueset "Provision of medical equipment (procedure)": '2.16.840.1.113762.1.4.1099.13'
valueset "Medical equipment assessment (procedure)": '2.16.840.1.113762.1.4.1099.13'
valueset "Ensuring home equipment available prior to hospital discharge (procedure)": '2.16.840.1.113762.1.4.1099.13'
valueset "Durable medical equipment education, guidance, and counseling (procedure)": '2.16.840.1.113762.1.4.1099.13'
valueset "Durable medical equipment case management (procedure)": '2.16.840.1.113762.1.4.1099.13'
valueset "Checking patient identity (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Patient registration (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "replaces": '2.16.840.1.113883.11.20.9.62'
valueset "Change recommended (qualifier value)": '2.16.840.1.113762.1.4.1096.204'
valueset "Domestic responsibility rehabilitation (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Preparation of medical certificate (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Medical service (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Documentation procedure (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Previous treatment repeat (situation)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Treatment completed (situation)": '2.16.840.1.113762.1.4.1047.220'
valueset "Replacement of device (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Revision of internal fixation device, broken or displaced (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Respiratory flow rate measured (situation)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hematocrit lab test" : '2.16.840.1.113762.1.4.1045.114'
valueset "Quantity finding (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Documentation of medication therapy management plan (procedure)"  :'2.16.840.1.113883.3.88.12.80.28'
valueset "Suppliers; Prosthetic/Orthotic Supplier" : '2.16.840.1.114222.4.11.1066'
valueset "Patient encounter procedure (procedure)" : '2.16.840.1.113762.1.4.1047.428'
valueset "Has advance care plan (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hematocrit determination (procedure)" : '2.16.840.1.113883.3.88.12.80.28'

valueset "Home oxygen therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Blood gas analysis (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Hospitalization": '2.16.840.1.113762.1.4.1164.40'
valueset "Discharge from Inpatient Facility": '2.16.840.1.113762.1.4.1138.721'
valueset "Encounter Hospital Outpatient": '2.16.840.1.113883.3.3157.1002.1'
valueset "Long-term oxygen therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Clinical trial (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Encounter Inpatient": '2.16.840.1.113883.3.666.5.307'
valueset "Treatment stopped - alternative therapy undertaken (situation)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Oxygen therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//Accessories, maintenance, and repairs of patient-owned oxygen
valueset "Liquid oxygen (substance)": '2.16.840.1.113762.1.4.1010.2'
//doctor of osteopathy
//podiatric surgeon
valueset "Oxygen (substance)": '2.16.840.1.113762.1.4.1010.2'
valueset "Device (physical object)": '2.16.840.1.113762.1.4.1181.3'
valueset "Mobile in home (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Does not move (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Gaseous substance (substance)": '2.16.840.1.113762.1.4.1010.2'
valueset "Arterial oxygen concentration measurement (procedure)": '2.16.840.1.113883.3.88.12.80.28'

valueset "Laboratory reporting, electronic (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Verifying presence of prosthetics (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Seen by orthotics service (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Patient condition assessed (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Home oxygen therapy management (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//Date Of Service
//Duration of condition
valueset "Illness (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Clinical examination education (procedure)": '2.16.840.1.113883.11.20.9.34'
valueset "Patient's condition worsened (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Patient's condition improved (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Conditional prognosis (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
//Results of the blood gas study,(Need to find)--> either printed data from the test or written in the notes
valueset "Home Care": '2.16.840.1.113883.1.11.20275'
//Nature and extent of functional limitations
valueset "Therapeutic regimen (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Gathering of past medical history (procedure)": '2.16.840.1.113762.1.4.1096.118'
//Other pertinent information
//Photocopy
//standard Medicare Detailed Written Order
// knowledge and documentation of the face-to-face examination
valueset "Provision of talking monitored dosage system (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Route of Administration": '2.16.840.1.113762.1.4.1018.98'
//Frequency of use
valueset "Infusion (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//valueset "Quantity finding (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'(Quantity to be dispensed)
//Number of refills
//physician review, sign, and date it
//National Provider Identifier
//Signature Date
//Is permitted to perform services in accordance with State law
valueset "Documentation of personal medication record (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Administration of prescribed medications based on arterial blood gas results (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Advance Care Plan": '2.16.840.1.113762.1.4.1116.468'
valueset "Assessment for home oxygen therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Physician (occupation)": '2.16.840.1.113762.1.4.1096.129'
valueset "Medical doctor (occupation)": '2.16.840.1.113762.1.4.1166.24'
valueset "Nurse practitioner (occupation)": '2.16.840.1.113762.1.4.1096.129'
valueset "Physician assistant (occupation)": '2.16.840.1.113762.1.4.1096.129'
valueset "Face to Face Encounter": '2.16.840.1.113762.1.4.1047.428'
valueset "In-person encounter (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Renewal of prescription (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Referral to clinical nurse specialist (procedure)": '2.16.840.1.113883.3.464.1003.101.12.1046'
valueset "Nursing evaluation of patient and report (procedure)": '2.16.840.1.113883.3.464.1003.101.12.1061'
valueset "Seen by clinical nurse specialist (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Prescription by nurse practitioner (situation)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Seen by nurse practitioner (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Seen by physician (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Referred by physician assistant (finding)": '2.16.840.1.113762.1.4.1096.216'
valueset "Encounter Face to Face": '2.16.840.1.113762.1.4.1111.78'
valueset "Prescription (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Change of prescription (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Evaluation AND/OR management - new patient (procedure)": '2.16.840.1.113883.3.2286'
valueset "Medicare (Non-managed Care)": '2.16.840.1.114222.4.11.3591'
valueset "National provider ID": '2.16.840.1.113762.1.4.1099.13'
valueset "Patient registration (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "replaces": '2.16.840.1.113883.11.20.9.62'
valueset "Suppliers; Durable Medical Equipment & Medical Supplies, Oxygen Equipment & Supplies": '2.16.840.1.114222.4.11.1066'
valueset "Change recommended (qualifier value)": '2.16.840.1.113762.1.4.1096.204'
valueset "Domestic responsibility rehabilitation (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Preparation of medical certificate (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Medical service (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Documentation procedure (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Previous treatment repeat (situation)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Treatment completed (situation)": '2.16.840.1.113762.1.4.1047.220'
valueset "Replacement of device (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Revision of internal fixation device, broken or displaced (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Respiratory flow rate measured (situation)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "EntityPersonNamePartQualifier": '2.16.840.1.113883.11.20.9.26'
valueset "APTA Registry Data Elements":'2.16.840.1.113762.1.4.1099.13'
valueset "initial": '2.16.840.1.113883.11.20.9.26'
valueset "title": '2.16.840.1.113883.11.20.9.26'
valueset "Attending physician (occupation)":'2.16.840.1.113762.1.4.1099.14'
valueset "Checking patient identity (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Confirming patient identity prior to procedure (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Date of onset - Reported":'2.16.840.1.113883.6.1'
valueset "Patient identifier":'2.16.840.1.113883.6.1'
valueset "Durable medical equipment surveillance (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
//valueset "Suppliers; Durable Medical Equipment & Medical Supplies, Oxygen Equipment & Supplies": '2.16.840.1.114222.4.11.1066'
valueset "Durable medical equipment education, guidance, and counseling (procedure)": '2.16.840.1.113762.1.4.1099.13'
valueset "Durable medical equipment case management (procedure)": '2.16.840.1.113762.1.4.1099.13'
valueset "Medical equipment or device education (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Provision of medical equipment (procedure)": '2.16.840.1.113762.1.4.1099.13'
valueset "Medical equipment assessment (procedure)": '2.16.840.1.113762.1.4.1099.13'
valueset "Ensuring home equipment available prior to hospital discharge (procedure)": '2.16.840.1.113762.1.4.1099.13'
valueset "Prescribed medication education (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Medication commenced (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Procedure aiding diagnosis (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Primary diagnosis":'2.16.840.1.113762.1.4.1099.13'
valueset "Secondary diagnosis":'2.16.840.1.113762.1.4.1099.13'
valueset "Functional movement disorder (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Evaluating interventions (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Past history of procedure (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Equipment in use (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Equipment requirement (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Equipment related features (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
*/

code "Practitioner certification status (finding) code": '417707001' from "SNOMEDCT" display 'Practitioner certification status (finding)'
code "Equipment related features (finding) code": '405655001' from "SNOMEDCT" display 'Equipment related features (finding)'
code "Equipment requirement (finding) code": '698532002' from "SNOMEDCT" display 'Equipment requirement (finding)'
code "Equipment in use (finding) code": '397917005' from "SNOMEDCT" display 'Equipment in use (finding)'
code "Durable medical equipment education, guidance, and counseling (procedure) code": '410286008' from "SNOMEDCT" display 'Durable medical equipment education, guidance, and counseling (procedure)'
code "Past history of procedure (situation) code": '416940007' from "SNOMEDCT" display 'Past history of procedure (situation)'
code "Functional movement disorder (disorder) code": '718362003' from "SNOMEDCT" display 'Functional movement disorder (disorder)'
code "Secondary diagnosis code": '81885-6' from "LOINC" display 'Secondary diagnosis'
code "Primary diagnosis code": '18630-4' from "LOINC" display 'Primary diagnosis'
code "Procedure aiding diagnosis (procedure) code": '165167006' from "SNOMEDCT" display 'Procedure aiding diagnosis (procedure)'
code "Blood gas analysis (procedure) code": '278297009' from "SNOMEDCT" display 'Blood gas analysis (procedure)'
code "Encounter Face to Face code": '20160302' from "SNOMEDCT" display 'Encounter Face to Face'
code "Seen by physician (finding) code": '305660003' from "SNOMEDCT" display 'Seen by physician (finding)'
code "Seen by clinical nurse specialist (finding) code": '305733002' from "SNOMEDCT" display 'Seen by clinical nurse specialist (finding)'
code "Seen by nurse practitioner (finding) code": '305757002' from "SNOMEDCT" display 'Seen by nurse practitioner (finding)'
code "Referred by physician assistant (finding) code": '2051000124106' from "SNOMEDCT" display 'Referred by physician assistant (finding)'
code "Home oxygen therapy (procedure) code": '426990007' from "SNOMEDCT" display 'Home oxygen therapy (procedure)'
code "Encounter Inpatient code": '20170504' from "SNOMEDCT" display 'Encounter Inpatient'
code "Encounter Hospital Outpatient code": '20151013' from "SNOMEDCT" display 'Encounter Hospital Outpatient'
code "initial code": 'IN' from "EntityNamePartQualifier" display 'initial'
code "title code": 'TITLE' from "EntityNamePartQualifier" display 'title'
code "Checking patient identity (procedure) code": '710958003' from "SNOMEDCT" display 'Checking patient identity (procedure)'
code "Confirming patient identity prior to procedure (procedure) code": '372040007' from "SNOMEDCT" display 'Confirming patient identity prior to procedure (procedure)'
code "Attending physician (occupation) code": '405279007' from "SNOMEDCT" display 'Attending physician (occupation)'
code "National provider ID code": '45952-9' from "LOINC" display 'National provider ID'
code "Illness (finding) code": '39104002' from "SNOMEDCT" display 'Illness (finding)'
code "Patient's condition worsened (finding) code": '271299001' from "SNOMEDCT" display 'Patients condition worsened (finding)'
code "Patient's condition improved (finding) code": '268910001' from "SNOMEDCT" display 'Patients condition improved (finding)'
code "Conditional prognosis (finding) code": '60484009' from "SNOMEDCT" display 'Conditional prognosis (finding)'
code "Mobile in home (finding) code": '302000008' from "SNOMEDCT" display 'Mobile in home (finding)'
code "Gathering of past medical history (procedure) code": '451571000124102' from "SNOMEDCT" display 'Gathering of past medical history (procedure)'
code "Therapeutic regimen (regime/therapy) code": '133877004' from "SNOMEDCT" display 'Therapeutic regimen (regime/therapy)'
code "Administration of prescribed medications based on arterial blood gas results (procedure) code": '370774005' from "SNOMEDCT" display 'Administration of prescribed medications based on arterial blood gas results (procedure)'
code "Ambulatory Health Care Facilities; Clinic/Center, Federally Qualified Health Center (FQHC) code": '261QF0400X' from "NUCCPT" display 'Ambulatory Health Care Facilities; Clinic/Center, Federally Qualified Health Center (FQHC)'
code "Evaluating interventions (procedure) code": '225303001' from "SNOMEDCT" display 'Evaluating interventions (procedure)'

code "Chronic Obstructive Pulmonary Disease code": '20160331' from "ICD10CM" display 'Chronic Obstructive Pulmonary Disease'
code "Interstitial lung disease (disorder) code": '233703007' from "SNOMEDCT" display 'Interstitial lung disease (disorder)'
code "Cystic fibrosis (disorder) code": '190905008' from "SNOMEDCT" display 'Cystic fibrosis (disorder)'
code "Bronchiectasis (disorder) code": '12295008' from "SNOMEDCT" display 'Bronchiectasis (disorder)'
code "Malignant tumor of lung (disorder) code": '363358000' from "SNOMEDCT" display 'Malignant tumor of lung (disorder)'
code "Hypoxia (disorder) code": '389086002' from "SNOMEDCT" display 'Hypoxia (disorder)'
code "Pulmonary hypertension (disorder) code": '70995007' from "SNOMEDCT" display 'Pulmonary hypertension (disorder)'
code "Erythrocytosis (disorder) code": '127062003' from "SNOMEDCT" display 'Erythrocytosis (disorder)'
code "Impaired Cognition code": '20151105' from "SNOMEDCT" display 'Impaired Cognition'
code "Restlessness (finding) code": '162221009' from "SNOMEDCT" display 'Restlessness (finding)'
code "Morning headache (finding) code": '162310002' from "SNOMEDCT" display 'Morning headache (finding)'
code "Inpatient stay (finding) code" : '308540004' from "SNOMEDCT" display 'Inpatient stay (finding)'
code "Patient's condition stable (finding) code": '359746009' from "SNOMEDCT" display 'Patients condition stable (finding)'
code "Treatment stopped - alternative therapy undertaken (situation) code": '182868002' from "SNOMEDCT" display 'Treatment stopped - alternative therapy undertaken (situation)'
code "Oxygen saturation measurement, arterial (procedure) code": '113080007' from "SNOMEDCT" display 'Oxygen saturation measurement, arterial (procedure)'
code "Oxygen measurement, partial pressure, arterial (procedure) code": '25579001' from "SNOMEDCT" display 'Oxygen measurement, partial pressure, arterial (procedure)'
code "Exercises (regime/therapy) code": '226029000' from "SNOMEDCT" display 'Exercises (regime/therapy)'
code "Resting state (finding) code": '128975004' from "SNOMEDCT" display 'Resting state (finding)'
code "Awake (finding) code": '248218005' from "SNOMEDCT" display 'Awake (finding)'
code "Sleeping out (finding) code": '224229008' from "SNOMEDCT" display 'Sleeping out (finding)'
code "P pulmonale (finding) code": '164914003' from "SNOMEDCT" display 'P pulmonale (finding)'
code "Insomnia (disorder) code": '193462001' from "SNOMEDCT" display 'Insomnia (disorder)'
code "Cor pulmonale (disorder) code": '83291003' from "SNOMEDCT" display 'Cor pulmonale (disorder)'
code "Dependent edema (finding) code": '248499004' from "SNOMEDCT" display 'Dependent edema (finding)'
code "Right heart failure (disorder) code": '128404006' from "SNOMEDCT" display 'Right heart failure (disorder)'
code "Pulmonary artery pressure monitoring (regime/therapy) code": '24599003' from "SNOMEDCT" display 'Pulmonary artery pressure monitoring (regime/therapy)'
code "Echocardiography (procedure) code": '40701008' from "SNOMEDCT" display 'Echocardiography (procedure)'
code "Hematocrit determination (procedure) code" : '28317006' from "SNOMEDCT" display 'Hematocrit determination (procedure)'
code "Unilateral headache (situation) code": '103006007' from "SNOMEDCT" display 'Unilateral headache (situation)'

concept "Chronic Obstructive Pulmonary Disease": {"Chronic Obstructive Pulmonary Disease code"} display 'Chronic Obstructive Pulmonary Disease'
concept "Interstitial lung disease (disorder)": {"Interstitial lung disease (disorder) code"} display 'Interstitial lung disease (disorder)'
concept "Cystic fibrosis (disorder)": {"Cystic fibrosis (disorder) code"} display 'Cystic fibrosis (disorder)'
concept "Bronchiectasis (disorder)": {"Bronchiectasis (disorder) code"} display 'Bronchiectasis (disorder)'
concept "Malignant tumor of lung (disorder)": {"Malignant tumor of lung (disorder) code"} display 'Malignant tumor of lung (disorder)'
concept "Hypoxia (disorder)": {"Hypoxia (disorder) code"} display 'Hypoxia (disorder)'
concept "Pulmonary hypertension (disorder)": {"Pulmonary hypertension (disorder) code"} display 'Pulmonary hypertension (disorder)'
concept "Erythrocytosis (disorder)": {"Erythrocytosis (disorder) code"} display 'Erythrocytosis (disorder)'
concept "Impaired Cognition": {"Impaired Cognition code"} display 'Impaired Cognition'
concept "Restlessness (finding)": {"Restlessness (finding) code"} display 'Restlessness (finding)'
concept "Morning headache (finding)": {"Morning headache (finding) code"} display 'Morning headache (finding)'
concept "Inpatient stay (finding)": {"Inpatient stay (finding) code"} display 'Inpatient stay (finding)'
concept "Patient's condition stable (finding)": {"Patient's condition stable (finding) code"} display 'Patients condition stable (finding)'
concept "Practitioner certification status (finding)": {"Practitioner certification status (finding) code"} display 'Practitioner certification status (finding)'
concept "Treatment stopped - alternative therapy undertaken (situation)": {"Treatment stopped - alternative therapy undertaken (situation) code"} display 'Treatment stopped - alternative therapy undertaken (situation)'
concept "Oxygen saturation measurement, arterial (procedure)": {"Oxygen saturation measurement, arterial (procedure) code"} display 'Oxygen saturation measurement, arterial (procedure)'
concept "Oxygen measurement, partial pressure, arterial (procedure)": {"Oxygen measurement, partial pressure, arterial (procedure) code"} display 'Oxygen measurement, partial pressure, arterial (procedure)'
concept "Exercises (regime/therapy)": {"Exercises (regime/therapy) code"} display 'Exercises (regime/therapy)'
concept "Resting state (finding)": {"Resting state (finding) code"} display 'Resting state (finding)'
concept "Awake (finding)": {"Awake (finding) code"} display 'Awake (finding)'
concept "Sleeping out (finding)": {"Sleeping out (finding) code"} display 'Sleeping out (finding)'
concept "P pulmonale (finding)": {"P pulmonale (finding) code"} display 'P pulmonale (finding)'
concept "Insomnia (disorder)": {"Insomnia (disorder) code"} display 'Insomnia (disorder)'
concept "Cor pulmonale (disorder)": {"Cor pulmonale (disorder) code"} display 'Cor pulmonale (disorder)'
concept "Dependent edema (finding)": {"Dependent edema (finding) code"} display 'Dependent edema (finding)'
concept "Right heart failure (disorder)": {"Right heart failure (disorder) code"} display 'Right heart failure (disorder)'
concept "Pulmonary artery pressure monitoring (regime/therapy)": {"Pulmonary artery pressure monitoring (regime/therapy) code"} display 'Pulmonary artery pressure monitoring (regime/therapy)'
concept "Echocardiography (procedure)": {"Echocardiography (procedure) code"} display 'Echocardiography (procedure)'
concept "Hematocrit determination (procedure)": {"Hematocrit determination (procedure) code"} display 'Hematocrit determination (procedure)'
concept "Unilateral headache (situation)": {"Unilateral headache (situation) code"} display 'Unilateral headache (situation)'

concept "Equipment related features (finding)": {"Equipment related features (finding) code"} display 'Equipment related features (finding)'
concept "Equipment requirement (finding)": {"Equipment requirement (finding) code"} display 'Equipment requirement (finding)'
concept "Equipment in use (finding)": {"Equipment in use (finding) code"} display 'Equipment in use (finding)'
concept "Durable medical equipment education, guidance, and counseling (procedure)": {"Durable medical equipment education, guidance, and counseling (procedure) code"} display 'Durable medical equipment education, guidance, and counseling (procedure)'
concept "Past history of procedure (situation)": {"Past history of procedure (situation) code"} display 'Past history of procedure (situation)'
concept "Evaluating interventions (procedure)": {"Evaluating interventions (procedure) code"} display 'Evaluating interventions (procedure)'
concept "Functional movement disorder (disorder)": {"Functional movement disorder (disorder) code"} display 'Functional movement disorder (disorder)'
concept "Ambulatory Health Care Facilities; Clinic/Center, Federally Qualified Health Center (FQHC)": {"Ambulatory Health Care Facilities; Clinic/Center, Federally Qualified Health Center (FQHC) code"}display 'Ambulatory Health Care Facilities; Clinic/Center, Federally Qualified Health Center (FQHC)'
concept "Secondary diagnosis": {"Secondary diagnosis code"} display 'Secondary diagnosis'
concept "Primary diagnosis": {"Primary diagnosis code"} display 'Primary diagnosis'
concept "Procedure aiding diagnosis (procedure)": {"Procedure aiding diagnosis (procedure) code"} display 'Procedure aiding diagnosis (procedure)'
concept "Blood gas analysis (procedure)": {"Blood gas analysis (procedure) code"} display 'Blood gas analysis (procedure)'
concept "Encounter Face to Face": {"Encounter Face to Face code"} display 'Encounter Face to Face'
concept "Seen by physician (finding)": {"Seen by physician (finding) code"} display 'Seen by physician (finding)'
concept "Seen by clinical nurse specialist (finding)": {"Seen by clinical nurse specialist (finding) code"} display 'Seen by clinical nurse specialist (finding)'
concept "Seen by nurse practitioner (finding)": {"Seen by nurse practitioner (finding) code"} display 'Seen by nurse practitioner (finding)'
concept "Referred by physician assistant (finding)": {"Referred by physician assistant (finding) code"} display 'Referred by physician assistant (finding)'
concept "Home oxygen therapy (procedure)": {"Home oxygen therapy (procedure) code"} display 'Home oxygen therapy (procedure)'
concept "Encounter Inpatient": {"Encounter Inpatient code"} display 'Encounter Inpatient'
concept "Encounter Hospital Outpatient": {"Encounter Hospital Outpatient code"} display 'Encounter Hospital Outpatient'
concept "initial": {"initial code"} display 'initial'
concept "title": {"title code"} display 'title'
concept "Checking patient identity (procedure)": {"Checking patient identity (procedure) code"} display 'Checking patient identity (procedure)'
concept "Confirming patient identity prior to procedure (procedure)": {"Confirming patient identity prior to procedure (procedure) code"} display 'Confirming patient identity prior to procedure (procedure)'
concept "Attending physician (occupation)": {"Attending physician (occupation) code"} display 'Attending physician (occupation)'
concept "National provider ID": {"National provider ID code"} display 'National provider ID'
concept "Illness (finding)": {"Illness (finding) code"} display 'Illness (finding)'
concept "Patient's condition worsened (finding)": {"Patient's condition worsened (finding) code"} display 'Patients condition worsened (finding)'
concept "Patient's condition improved (finding)": {"Patient's condition improved (finding) code"} display 'Patients condition improved (finding)'
concept "Conditional prognosis (finding)": {"Conditional prognosis (finding) code"} display 'Conditional prognosis (finding)'
concept "Mobile in home (finding)": {"Mobile in home (finding) code"} display 'Mobile in home (finding)'
concept "Gathering of past medical history (procedure)": {"Gathering of past medical history (procedure) code"} display 'Gathering of past medical history (procedure)'
concept "Therapeutic regimen (regime/therapy)": {"Therapeutic regimen (regime/therapy) code"} display 'Therapeutic regimen (regime/therapy)'
concept "Administration of prescribed medications based on arterial blood gas results (procedure)": {"Administration of prescribed medications based on arterial blood gas results (procedure) code"} display 'Administration of prescribed medications based on arterial blood gas results (procedure)'

context Patient

define "Indications":
	{
        {"Condition": "Chronic Obstructive Pulmonary Disease"},{'or'},
        {"Condition": "Interstitial lung disease (disorder)"},{'or'},
        {"Condition": "Cystic fibrosis (disorder)"},{'or'},
        {"Condition": "Bronchiectasis (disorder)"},{'or'},
        {"Condition": "Malignant tumor of lung (disorder)"},{'or'},
        {"Condition": "Hypoxia (disorder)"},{'or'},
        {"Condition": "Pulmonary hypertension (disorder)"},{'or'},
        {"Condition": "Erythrocytosis (disorder)"},{'or'},
        {"Condition": "Impaired Cognition"},{'or'},
        {"Observation": "Restlessness (finding)"},{'or'},
        {"Condition": "Morning headache (finding)"}
	}

define "BloodGasStudy":
	{"Procedure": "Blood gas analysis (procedure)"}

define "Qualifying BloodgasStudy":
          {"Encounter": "Inpatient stay (finding)"}
          union "BloodGasStudy"

define "Outpatient Encounter":
	{"Observation":"Patient's condition stable (finding)",
	"DiagnosticReport":"Practitioner certification status (finding)"}

define "Alternate Treatment":
	{"DiagnosticReport": "Treatment stopped - alternative therapy undertaken (situation)"}

define "Qualifying Outpatient":
	"BloodGasStudy"
	 union "Outpatient Encounter"

define "Saturation or PP":
	{"BloodGasStudy",{'and'},
	 {
	 {"Procedure": "Oxygen saturation measurement, arterial (procedure)"},{'or'},
	 {"Procedure": "Oxygen measurement, partial pressure, arterial (procedure)"}
	 }
	}

define "Saturation and PP":
	{"BloodGasStudy",{'and'},
	 {
	 {"Procedure": "Oxygen saturation measurement, arterial (procedure)"},{'and'},
	 {"Procedure": "Oxygen measurement, partial pressure, arterial (procedure)"}
	 }
	}

define "Group Exercise":
	{{"Procedure": "Exercises (regime/therapy)"},{'and'},"Saturation or PP"}

define "Group rest":
	{{"Observation": "Resting state (finding)"},{'and'},"Saturation or PP"}


define "Group Awake":
	{{"Observation": "Awake (finding)"},{'and'},"Saturation or PP"}

define "Symptoms to hypoxemia":
	{{"Condition": "P pulmonale (finding)"},{'or'},
	{"Condition": "Erythrocytosis (disorder)"},{'or'},
	{"Condition": "Impaired Cognition"},{'or'},
	{"Condition": "Insomnia (disorder)"},{'or'},
	{"Condition": "Cor pulmonale (disorder)"},{'or'},
	{"Condition": "Pulmonary hypertension (disorder)"}}


define "Decrease":
	{{"Observation": "Sleeping out (finding)"},{'and'},"Saturation or PP" }

define "Group Sleeping":
	 {"Decrease",{'and'},"Symptoms to hypoxemia"}


define "Group1 Criteria":
	"Group Exercise"
	union "Group rest"
	union "Group Awake"
	union "Group Sleeping"

define "Group2 Symptoms":
	{{{"Condition": "Dependent edema (finding)"},{'or'},
	{"Condition": "Right heart failure (disorder)"},{'or'},
	{"Condition": "Pulmonary hypertension (disorder)"},{'or'},
	{"Condition": "P pulmonale (finding)"},{'or'},
	{"Condition": "Erythrocytosis (disorder)"}}
	union
	{"Procedure": "Pulmonary artery pressure monitoring (regime/therapy)",
	 "Procedure": "Echocardiography (procedure)",
	 "Procedure": "Hematocrit determination (procedure)"}}

define "Group2 Awake":
	{"Group Awake",{'and'},"Group2 Symptoms"}

define "Group2 Exercise":
	{"Group Exercise",{'and'},"Group2 Symptoms"}

define "Group2 Sleep":
	{"Decrease",{'and'},"Group2 Symptoms"}

define "Initial Coverage":
	{"Procedure": "Home oxygen therapy (procedure)"}

define "Group2 Criteria":
	"Group2 Awake"
	union "Group2 Exercise"
	union "Group2 Sleep"
	union "Initial Coverage"

define "Cluster Headaches":
	{"Condition": "Unilateral headache (situation)"}

define "Group3 Criteria":
	{"Cluster Headaches",{'and'},"Saturation or PP"}

define  "Group Criteria":
	"Group1 Criteria"
	union "Group2 Criteria"
	union "Group3 Criteria"

define "Requirements":
	"Indications"
	union "Qualifying BloodgasStudy"
	union "Qualifying Outpatient"
	union "Alternate Treatment"
	union "Group Criteria"


define "Encounter Conduct":
	{{"Encounter": "Encounter Face to Face"},{'and'},
        {{"Encounter": "Seen by physician (finding)"},{'or'},
        {"Encounter": "Seen by clinical nurse specialist (finding)"},{'or'},
        {"Encounter": "Seen by nurse practitioner (finding)"},{'or'},
        {"Encounter": "Referred by physician assistant (finding)"}}}

define "Medical Record":
	{"DiagnosticReport":"Primary diagnosis",
	"Condition":"Illness (finding)",
	"Observation": "Patient's condition worsened (finding)",
	"Observation": "Patient's condition improved (finding)",
	"Observation": "Mobile in home (finding)",
	"ClinicalImpression":"Conditional prognosis (finding)",
	"Procedure": "Blood gas analysis (procedure)",
	"MedicationAdministration":"Administration of prescribed medications based on arterial blood gas results (procedure)",
	"Condition": "Functional movement disorder (disorder)",
	"Procedure": "Evaluating interventions (procedure)",
	"Observation": "Past history of procedure (situation)",
	"Procedure": "Gathering of past medical history (procedure)"
	}

define "Practitioner Signature":
	'e-prescription containing digital Signature of the Pratitioner and date'

define "Patient Name":
    Patient.name

define "WOPD Details Required":
	{"Patient":"Patient Name",
	"Practitioner":"Attending physician (occupation)",
	"DeviceRequest":"Equipment requirement (finding)",
	"DeviceUseStatement":"Equipment in use (finding)",
	"Observation": "Equipment related features (finding)",
	"Procedure": "Home oxygen therapy (procedure)",
	"Organization":"National provider ID",
	"Procedure": "Durable medical equipment education, guidance, and counseling (procedure)"
	}

define "Face-to-Face Encounter":
	"Encounter Conduct"
	union "WOPD Details Required"
	union "Practitioner Signature"

define "Documentations Required":
	"Face-to-Face Encounter"
	union "Medical Record"
	union "Requirements"