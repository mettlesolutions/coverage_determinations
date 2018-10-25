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
valueset "Attending physician (occupation)":'2.16.840.1.113883.6.96'
valueset "Checking patient identity (procedure)":'2.16.840.1.113883.6.96'
valueset "Confirming patient identity prior to procedure (procedure)":'2.16.840.1.113883.6.96'
valueset "Date of onset - Reported":'2.16.840.1.113883.6.1'
valueset "Patient identifier":'2.16.840.1.113883.6.1'
	
parameter "Measurement Period" Interval<DateTime>
parameter "Encounter Diagnosis" List<String>


context Patient

define "HomeOxygentherapy":
	["Procedure, Performed": "Home oxygen therapy (procedure)"]HT
	where HT.relevantPeriod in "Measurement Period"


define "Coverage": 
	"Face-to-Face Encounter"
	union "Medical Record"


define "BloodGasStudy":
	["Procedure, Performed": "Blood gas analysis (procedure)"]P
	where P.relevantPeriod during "Measurement Period"


define "Medical Record":
	"Patient Encounter-Diagnosis"
	union "Illness (finding)"
	union "Patient's condition worsened (finding)"
	union "Patient's condition improved (finding)"
	union "Conditional prognosis (finding)"
	union ["Diagnosis": "Does move (finding)"]
	union "Gathering of past medical history (procedure)"
	union "Therapeutic regimen (regime/therapy)"
	union "Administration of prescribed medications based on arterial blood gas results (procedure)"
	union ["Diagnostic Study, Performed": "BloodGasStudy"] BGS where BGS.result is not null

	
define "Face-to-Face Encounter":
	exists("Encounter Conduct")
        union "WOPD Details Required"
        

define "Encounter Conduct":
	exists(["Encounter, Performed": "Encounter Face to Face"]) and exists(["Encounter, Performed": "Seen by physician (finding)"])
	or exists(["Encounter, Performed": "Encounter Face to Face"]) and exists(["Encounter, Performed": "Seen by clinical nurse specialist (finding)"])
	or exists(["Encounter, Performed": "Encounter Face to Face"]) and exists(["Encounter, Performed": "Seen by nurse practitioner (finding)"])
	or exists(["Encounter, Performed": "Encounter Face to Face"]) and exists(["Encounter, Performed": "Referred by physician assistant (finding)"])
        

define "WOPD Details Required":
	"Patient ID"
	union "Physician"
	union "Patient Encounter-Order"
	union "Date of onset - Reported"
	union "National provider ID"
	union ["Provider Characteristic":"Physician"]Phy where Phy.authorDatetime is not null


define "Inpatient Encounter-Diagnosis":
	["Encounter, Performed": "Inpatient"]E
	where E.relevantPeriod during "Measurement Period"
	return E.diagnoses
	

define "Outpatient Encounter-Diagnosis":
	["Encounter, Performed": "Encounter Hospital Outpatient"]O
	where O.relevantPeriod during "Measurement Period"
	return O.diagnoses
	
define "Inpatient Encounter-Order":
	["Encounter, Performed": "Inpatient"]E
	where E.relevantPeriod during "Measurement Period"
	return E.authorDatetime
	

define "Outpatient Encounter-Order":
	["Encounter, Performed": "Encounter Hospital Outpatient"]O
	where O.relevantPeriod during "Measurement Period"
	return O.authorDatetime


define "Person Name":
	"initial" union "title"
	

define "Patient ID":
	["Procedure, Performed":"Checking patient identity (procedure)"]P 
	union ["Procedure, Performed":"Confirming patient identity prior to procedure (procedure)"]CP
	return CP.result


define "Physician":
	["Provider Characteristic": "Attending physician (occupation)"]Py
	where Py.id = "National provider ID"
	return Py.code


define "Patient Encounter-Order":
	"Inpatient Encounter-Order" union "Outpatient Encounter-Order"

define "Patient Encounter-Diagnosis":
	"Inpatient Encounter-Diagnosis" union "Outpatient Encounter-Diagnosis"
	//["Encounter, Performed": "Inpatient"]E where E.diagnoses is not null
	//union ["Encounter, Performed": "Encounter Hospital Outpatient"]O where O.diagnoses is not null
	//case 
	//when exists(E.result) then return E.diagnoses
	//when exists(O.result) then return O.diagnoses
	//else "Encounter Diagnosis"= null
	//end
	//return "Encounter Diagnosis"
