library HomeOxygenTherapy version '1'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "ICD10CM": '2.16.840.1.113883.6.90'
codesystem "SNOMEDCT": '2.16.840.1.113883.3.88.12.3221.7.4'

valueset "Home oxygen therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Chronic Obstructive Pulmonary Disease": '2.16.840.1.113883.3.464.1003.102.11.1021'
valueset "Interstitial lung disease (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Cystic Fibrosis": '2.16.840.1.113883.3.464.1003.102.11.1004'
valueset "Bronchiectasis": '2.16.840.1.113883.3.666.5.773'
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
valueset "Inpatient stay (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Discharge from Inpatient Facility": '2.16.840.1.113762.1.4.1138.721'
valueset "Encounter Hospital Outpatient": '2.16.840.1.113883.3.3157.1002.1'
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
valueset "Patient's condition stable (finding)": '2.16.840.1.113762.1.4.1096.114'
valueset "Practitioner certification status (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Treatment stopped - alternative therapy undertaken (situation)": '2.16.840.1.113883.3.88.12.3221.7.4'
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
valueset "Suppliers; Durable Medical Equipment & Medical Supplies, Oxygen Equipment & Supplies": '2.16.840.1.114222.4.11.1066'
valueset "Change recommended (qualifier value)": '2.16.840.1.113762.1.4.1096.204'



parameter "Measurement Period" Interval<DateTime>

context Patient

define "Indications": 
	["Diagnosis": "Chronic Obstructive Pulmonary Disease"]
	or ["Diagnosis": "Interstitial lung disease (disorder)"]
	or ["Diagnosis": "Cystic Fibrosis"]
	or ["Diagnosis": "Bronchiectasis"]
	or ["Diagnosis": "Malignant tumor of lung (disorder)"]
	or ["Diagnosis": "Hypoxia (disorder)"]
	or ["Diagnosis": "Pulmonary hypertension (disorder)"]
	or ["Diagnosis": "Erythrocytosis (disorder)"]
	or ["Diagnosis": "Impaired Cognition"]
	or ["Diagnosis": "Restlessness (finding)"]
	or ["Diagnosis": "Morning headache (finding)"]
	
define "Not Covered":
        ["Procedure, Performed": "Oximetry (procedure)"]
         union ["Procedure, Performed": "Respiratory, Developmental, Rehabilitative and Restorative Service Providers; Respiratory Therapist, Certified"]
         union ["Procedure, Performed": "Oxygen therapy (procedure)"]
	
define "Inpatient Encounters":
	["Encounter, Performed": "Inpatient"]E
	where E.relevantPeriod during "Measurement Period"
	
define "Outpatient Encounters":
	["Encounter, Performed": "Encounter Hospital Outpatient"]O
	where O.relevantPeriod during "Measurement Period"
	
define "BloodGasStudy":
	["Procedure, Performed": "Blood gas analysis (procedure)"]P
	where P.relevantPeriod during "Measurement Period"
	
define "Qualifying BloodgasStudy":
	"BloodGasStudy" Po  
		with "Inpatient Encounters" E 
	   		such that duration(Po.startTime, E.stopTime) < 2 days
	   		
	   	
define "Outpatient Encounter":
	["Diagnosis": "Patient's condition stable (finding)"]D union ["Diagnostic Study, Performed":"Practitioner certification status (finding)"]C
	where D.relevantPeriod starts 30 days before start of C.authorDateTime
	
define "Qualifying Outpatient":
	["Procedure, Performed" : "Blood gas analysis (procedure)"] and "Outpatient Encounter"
	
define "Alternate Treatment":
	["Diagnostic Study, Performed": "Treatment stopped - alternative therapy undertaken (situation)"]Alt
	where Alt.result is "clinically ineffective"
	
define "Group1 Condition1":
	["Diagnostic Study, Performed": "Blood gas analysis (procedure)"] union ["Diagnostic Study, Performed": "Oxygen saturation measurement, arterial (procedure)"]Ox
	where Ox.result <= 88 '%'
	and ["Diagnostic Study, Performed": "Oxygen measurement, partial pressure, arterial (procedure)"]Pa
	   	where Pa.result <= 55 'mm of Hg'
	   	
define "Group1 Condition2 Exercise":
	["Assessment, Performed": "Exercises (regime/therapy)"] union ["Diagnostic Study, Performed": "Oxygen saturation measurement, arterial (procedure)"]Ex
		where Ex.result >= 89 '%'
	 and ["Assessment, Performed": "Exercises (regime/therapy)"] union ["Diagnostic Study, Performed": "Oxygen measurement, partial pressure, arterial (procedure)"]Pe
	   	where Pe.result <= 56 'mm of Hg'  
	
define "Group1 Condition2 rest":
	["Assessment, Performed": "Resting state (finding)"] union ["Diagnostic Study, Performed": "Oxygen saturation measurement, arterial (procedure)"]Ex
		where Ex.result <= 88 '%'
	 and ["Assessment, Performed": "Resting state (finding)"] union ["Diagnostic Study, Performed": "Oxygen measurement, partial pressure, arterial (procedure)"]Pe
	   	where Pe.result <= 55 'mm of Hg'
	  
define "Group1 Condition2 Awake":	
	["Assessment, Performed": "Awake (finding)"] union ["Diagnostic Study, Performed": "Oxygen saturation measurement, arterial (procedure)"]Ex
		where Ex.result >= 89 '%'
	 and ["Assessment, Performed": "Awake (finding)"] union ["Diagnostic Study, Performed": "Oxygen measurement, partial pressure, arterial (procedure)"]Pe
	   	where Pe.result >= 56 'mm of Hg'
	   	
define "Symptoms to hypoxemia":
	["Diagnosis": "P pulmonale (finding)"]
	or ["Diagnosis": "Erythrocytosis (disorder)"]
	or ["Diagnosis": "Impaired Cognition"]
	or ["Diagnosis": "Insomnia (disorder)"]
	or ["Diagnosis": "Cor pulmonale (disorder)"]
	or ["Diagnosis": "Pulmonary hypertension (disorder)"]
	
define "Decrease":
	["Assessment, Performed": "Sleeping out (finding)"]A union ["Diagnostic Study, Performed": "Oxygen saturation measurement, arterial (procedure)"]Ex
		where Ex.result <= 83 '%' and A.relevantPeriod = 5 minutes
	 and ["Assessment, Performed": "Sleeping out (finding)"]a union ["Diagnostic Study, Performed": "Oxygen measurement, partial pressure, arterial (procedure)"]Pe
	   	where Pe.result <= 45 'mm of Hg' and a.relevantPeriod = 5 minutes
	 and "Symptoms to hypoxemia"
	 
define "Group1 Conditon2 Sleeping":
	 "Group1 Condition2 Awake" 
	 and ["Assessment, Performed": "Sleeping out (finding)"]A union ["Diagnostic Study, Performed": "Oxygen saturation measurement, arterial (procedure)"]Ex
		where Ex.result <= 88 '%' and A.relevantPeriod = 5 minutes
	 and ["Assessment, Performed": "Sleeping out (finding)"]a union ["Diagnostic Study, Performed": "Oxygen measurement, partial pressure, arterial (procedure)"]Pe
	   	where Pe.result <= 55 'mm of Hg' and a.relevantPeriod = 5 minutes
	 and "Decrease"
	
define "Group1 Criteria":
	"Group1 Condition1" 
	and "Group1 Condition2 Exercise"
	and "Group1 Condition2 rest"
	and "Group1 Condition2 Awake"
	and "Group1 Conditon2 Sleeping"

define "Group2 Symptoms":
	["Diagnosis": "Dependent edema (finding)"] union ["Diagnosis": "Right heart failure (disorder)"]
	or ["Diagnostic Study, Performed": "Pulmonary artery pressure monitoring (regime/therapy)"] union ["Diagnosis": "Pulmonary hypertension (disorder)"] union ["Diagnostic Study, Performed": "Echocardiography (procedure)"] union ["Diagnostic Study, Performed": "P pulmonale (finding)"]
	or ["Diagnosis": "Erythrocytosis (disorder)"] union ["Diagnostic Study, Performed": "Hematocrit lab test"]H
		where H.result > 56 '%'
	
	
define "Group2 Condition1 Awake":
	["Assessment, Performed": "Awake (finding)"] union ["Diagnostic Study, Performed": "Oxygen saturation measurement, arterial (procedure)"]Ex
		where Ex.result = 89 '%'
	 and ["Assessment, Performed": "Awake (finding)"] union ["Diagnostic Study, Performed": "Oxygen measurement, partial pressure, arterial (procedure)"]Pe
	   	where Pe.result >= 56 'mm of Hg' and Pe.result <= 59 'mm of Hg'
	 and "Group2 Symptoms"
	 
define "Group2 Condition1 Exercise":
	(["Assessment, Performed": "Exercises (regime/therapy)"] union ["Diagnostic Study, Performed": "Oxygen saturation measurement, arterial (procedure)"]Ex
		where Ex.result = 89 '%'
	 or ["Assessment, Performed": "Exercises (regime/therapy)"] union ["Diagnostic Study, Performed": "Oxygen measurement, partial pressure, arterial (procedure)"]Pe
	   	where Pe.result >= 56 'mm of Hg' and  Pe.result <= 59 'mm of Hg')
	 and "Group2 Symptoms"
	 
define "Group2 Condition1 Sleep":
	(["Assessment, Performed": "Sleeping out (finding)"]A union ["Diagnostic Study, Performed": "Oxygen saturation measurement, arterial (procedure)"]Ex
		where Ex.result = 89 '%' and A.relevantPeriod = 5 minutes
	 or ["Assessment, Performed": "Sleeping out (finding)"]a union ["Diagnostic Study, Performed": "Oxygen measurement, partial pressure, arterial (procedure)"]Pe
	   	where Pe.result >= 56 'mm of Hg' and Pe.result <= 59 'mm of Hg' and a.relevantPeriod = 5 minutes)
	 and "Group2 Symptoms"
	 
define "Initial Coverage":
	["Procedure, Performed": "Home oxygen therapy (procedure)"]Th
	where Th.relevantPeriod = 3 months 
	and ["Intervention, Performed": ""]
	
define "Group2 Criteria":
	"Group2 Condition1 Awake"
	or "Group2 Condition1 Exercise"
	or "Group2 Condition1 Sleep"
	or "Initial Coverage"
	
define "Long-term oxygen therapy":
	["Diagnostic Study, Performed": "Oxygen saturation measurement, arterial (procedure)"]Ex
		where Ex.result >= 89 '%'
	 or ["Diagnostic Study, Performed": "Oxygen measurement, partial pressure, arterial (procedure)"]Pe
	   	where Pe.result >= 56 'mm of Hg' and Pe.result <= 65 'mm of Hg'
	   	
define "Cluster Headaches":
	["Diagnosis": "Unilateral headache (situation)"]Un
	where Un.Timing > 15 minutes and Un.Timing < 180 minute
		
define "Group3 Criteria":
	("Long-term oxygen therapy"
	or "Cluster Headaches")
	and (["Diagnostic Study, Performed": "Oxygen saturation measurement, arterial (procedure)"]Dx
		where Dx.result >= 90 '%'
	or ["Diagnostic Study, Performed": "Oxygen measurement, partial pressure, arterial (procedure)"]Da
	   	where Da.result >= 60 'mm of Hg')
	   	
define  "Group Criteria":
	"Group1 Criteria"
	or "Group2 Criteria"
	or "Group3 Criteria"
	
define "Coverage Criteria":
	"Indications"
	and "Qualifying BloodgasStudy"
	and "Qualifying Outpatient"
	and "Alternate Treatment"
	
define "Encounter Requirement1":
	(["Procedure, Performed": "Prescription (procedure)"]Pr
	where Pr.authorDateTime overlaps "Measurement Period")
	
define "Evaluation":
	["Procedure, Performed": "Evaluation AND/OR management - new patient (procedure)"]
	   	
define "Encounters":
	(["Encounter, Performed": "Encounter Face to Face"] and ["Encounter, Performed": "Seen by physician (finding)"])
	or (["Encounter, Performed": "Encounter Face to Face"] and ["Encounter, Performed": "Seen by clinical nurse specialist (finding)"])
	or (["Encounter, Performed": "Encounter Face to Face"] and ["Encounter, Performed": "Seen by nurse practitioner (finding)"])
	or (["Encounter, Performed": "Encounter Face to Face"] and ["Encounter, Performed": "Referred by physician assistant (finding)"])
		
	
define "HomeOxygentherapy":
	["Procedure, Performed": "Home oxygen therapy (procedure)"]Ho
	where Ho.relevantPeriod in "Measurement Period"
	
define "New Prescription":
	["Procedure, Performed": "Renewal of prescription (procedure)"] and ["Encounter, Performed": "Encounter Face to Face"]
	and "Home Oxygen Therapy"
	
define "Encounter Requirements":
	"Evaluation" and
	"New Prescription" and
	["Encounter, Performed": "In-person encounter (procedure)"] In 
		with "Encounter Requirement1" Er such that 
	  		 duration(Er."start datetime", In."stop datetime") < 6 months
	  		 		 
define "New Prescription Requirement":
	["Procedure, Performed": "Medicare (Non-managed Care)"]
	or ["Procedure, Performed": "Change of prescription (procedure)"]
	or ["Procedure, Performed": "Renewal of prescription (procedure)"]
	or (["Procedure, Performed": "replaces"] union ["Procedure, Performed": "Durable medical equipment case management (procedure)"])
	or ["Assessment, Performed": "Change recommended (qualifier value)"] union ["Device, Order": "Suppliers; Durable Medical Equipment & Medical Supplies, Oxygen Equipment & Supplies"]
	
define "Face-Face Requirements":
	"New Prescription Requirement"
	and "Encounter Requirements"
	and "New Prescription"
	and "Encounter Requirement1"
	and "Evaluation"
	
define "Medical Record":
         ["Assessment, Performed": "Advance Care Plan"] union ["Procedure, Performed": "Home oxygen therapy management (procedure)"] and exists("Assessment for home oxygen therapy (procedure)") 
         union ["Procedure, Performed": "Home oxygen therapy management (procedure)"] and ["Device, Applied": "Oxygen Device"] 
         union exists("Illness (finding)" and "Patient's condition worsened (finding)" and "Patient's condition improved (finding)" and "Conditional prognosis (finding)" and "Administration of prescribed medications based on arterial blood gas results (procedure)" and "Therapeutic regimen (regime/therapy)" and "Gathering of past medical history (procedure)")
 
define "Physician":
	["Patient Characteristic": "Physician (occupation)"]Py
	where Py.id = "National provider ID"
		and Py.code = "Physician Name"
		
define "Ordering Practitioner":
	["Encounter, Performed": "Face to Face Encounter"]
	and (["Assessment, Performed": "Seen by physician (finding)"]
	or ["Assessment, Performed": "Seen by practitioner (finding)"])
	and ["Assessment, Performed": "Prescription (procedure)"] Ap
	where Ap.relevantPeriod in "Measurement Period"
	
define "Demographics":
	["Patient Characteristic": "Patient identifier"]
	and ["Procedure, Performed": "Patient registration (procedure)"]
	and "Physician"
	and "Ho.relevantPeriod"
	and ["Procedure, Performed": "Durable medical equipment education, guidance, and counseling (procedure)"]
	and ["Procedure, Performed": "Documentation of medication therapy management plan (procedure)"]
	and "Ordering Practitioner"
	and "Ap.dateTime"
	     
define "WOPD":
	"Demographics"
	and ["Encounter, Performed": "Face to Face Encounter"] F
        where F.Author dateTime= "Physician (occupation)" or 
        F.Author dateTime= "Nurse practitioner (occupation)" or
        F.Author dateTime= "Referral to clinical nurse specialist (procedure)" or
        F.Author dateTime= "Physician assistant (occupation)"
        union ["Laboratory Test, Performed": "Laboratory reporting, electronic (procedure)"] 
        union ["Assessment, Performed": "Advance Care Plan"] union ["Encounter, Performed": "Face to Face Encounter"] and ["Assessment, Recommended": "Prescription (procedure)"]
              included in("Durable medical equipment surveillance (regime/therapy)" and "Suppliers; Prosthetic/Orthotic Supplier")
        union exists("")
        union exists("Provision of talking monitored dosage system (procedure)" or "Route of Administration" union "Assessment for home oxygen therapy (procedure)" or "Infusion (procedure)" union ["Medication, Dispensed": "Quantity finding (finding)"] or ["Medication, Dispensed": "Prescription (procedure)"]P
               union count(P.Refills))
        and ["Intervention, Recommended": "Home oxygen therapy (procedure)"] Rin
	where Rin.author = "Physician"
	
define "Coverage":
	"WOPD"
	and "Medical Record"
	and "Face-Face Requirements"
	and "Coverage Criteria"
