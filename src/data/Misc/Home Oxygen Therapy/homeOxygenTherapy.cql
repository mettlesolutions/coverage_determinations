library HomeOxygenTherapy version '1'

using QDM version '5.3'

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
//Quantity ordered and frequency used
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
	["Procedure, Performed" : "Blood gas analysis (procedure)"]P  
	with "Inpatient Encounters"E such that duration(P.startTime, E.stopTime) in days < 2 days
		
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
	
define "Portable Oxygen Device":
         ["Diagnosis": "Device (physical object)"]
          and ["Diagnosis": "Does move (finding)"]
          and ["Substance,Administered": "Oxygen (substance)"]

define "Stationary Oxygen Device":
         ["Diagnosis": "Device (physical object)"]
         and ["Diagnosis": "Does not move (finding)"]
          and ["Substance,Administered": "Oxygen (substance)"]

define "Stationary gaseous":
          ["Substance, Administered": "Gaseous substance (substance)"]
           and ["Diagnosis": "Does not move (finding)"]

define "Portable Contents":
           ["Diagnostic Study": "Arterial oxygen concentration measurement (procedure)"]
           and ["Diagnosis": "Does move (finding)"]
           
define "Stationary Contents":
         ["Diagnostic Study": "Arterial oxygen concentration measurement (procedure)"]
           and ["Diagnosis": "Does not move (finding)"]
           
define "Portable gaseous device":
           ["Substance, Administered": "Gaseous substance (substance)"]
           and ["Diagnosis": "Does move (finding)"] 
           and ["Diagnosis": "Device (physical object)"]   

define "Stationary gaseous device":
           ["Substance, Administered": "Gaseous substance (substance)"]
           and ["Diagnosis": "Does not move (finding)"] 
           and ["Diagnosis": "Device (physical object)"]   
                        
define "Not Covered(Initial 36)":
         ["Diagnostic Study, Performed": "Arterial oxygen concentration measurement (procedure)"] OC
         union ["Diagnostic Study, Performed": "Stationary Oxygen Device"] SD
        // where duration in months of OC same as duration in months of SD
         where OC same month as SD
            
define "Covered(Initial 36)":
           "Stationary gaseous" or ["Substance, Administered": "Liquid oxygen (substance)"] LO
           during duration in months of LO same as 36
          // during "stationary gaseous" same month as LO
           union "Stationary Content".startTime same as "Stationary Oxygen Device".stopTime
           
define "Condition 3(Initial 36)":
         ["Diagnosis": "Stationary gaseous device"]
         or ["Diagnosis": "Portable gaseous device"]
         during duration in months of "Stationary gaseous device" same as 36
         union "Portable Content".startTime = "Stationary gaseous device".stopTime
         
define "Condition 4(Initial 36)":
         ["Device, Applied": "Stationary gaseous device"] and ["Device, Applied": "Portable gaseous device"]  
         during duration in months of "Stationary gaseous device" same as 36
         union "Portable Contents".startTime = "Stationary gaseous device".stopTime
         and "Stationary Contents".startTime = "Stationary gaseous device".stopTime     
           
