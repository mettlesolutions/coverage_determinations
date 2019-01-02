//Home Oxygen Therapy
library HomeOxygenTherapy 

using FHIR version '1.8'
include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "ICD10CM": '2.16.840.1.113883.6.90'
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
codesystem "LOINC": '2.16.840.1.113883.6.1'
codesystem "NUCCPT" : '2.16.840.1.113883.6.101'
codesystem "ActRelationshipType" : '2.16.840.1.113883.5.1002'

valueset "Home oxygen therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Severe chronic obstructive pulmonary disease (disorder)" : '2.16.840.1.113883.3.464.1003.102.12.1007'
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
valueset "Outpatient procedure (procedure)" : '2.16.840.1.113883.3.3157.1002.14'
//Alternative treatment
valueset "Oximetry (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Oxygen saturation measurement, arterial (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Oxygen measurement, partial pressure, arterial (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Insomnia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Cor pulmonale (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "P pulmonale (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
//electrocardiogram [EKG]
valueset "Dependent edema (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Pulmonary artery pressure monitoring (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
//gated blood pool scan
//echocardiogram
valueset "Unilateral headache (situation)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Inpatient stay (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Patient's condition stable (finding)": '2.16.840.1.113762.1.4.1096.114'
valueset "Practitioner certification status (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Treatment stopped - alternative therapy undertaken (situation)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Echocardiography (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Exercises (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Resting state (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Sleeping out (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Awake (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Respiratory, Developmental, Rehabilitative and Restorative Service Providers; Respiratory Therapist, Certified": '2.16.840.1.114222.4.11.1066'
//Oxygen services furnished by an airline
//Stationary oxygen
//Portable oxygen
valueset "Oxygen therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//Accessories, maintenance, and repairs of patient-owned oxygen
valueset "Suppliers; Durable Medical Equipment & Medical Supplies, Oxygen Equipment & Supplies": '2.16.840.1.114222.4.11.1066'
//doctor of osteopathy
//podiatric surgeon
valueset "Oxygen (substance)": '2.16.840.1.113762.1.4.1010.2'
valueset "Device (physical object)": '2.16.840.1.113762.1.4.1181.3'
valueset "Does move (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Does not move (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Laboratory reporting, electronic (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Home oxygen therapy management (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//Date Of Service
//Duration of condition
//Seen by practitioner
valueset "Illness (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Patient's condition worsened (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Patient's condition improved (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Conditional prognosis (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
//Results of the blood gas study,(Need to find)--> either printed data from the test or written in the notes
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
valueset "Administration of prescribed medications based on arterial blood gas results (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//valueset "Advance Care Plan": '2.16.840.1.113762.1.4.1116.468' 
valueset "Assessment for home oxygen therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Physician (occupation)": '2.16.840.1.113762.1.4.1096.129'
valueset "Nurse practitioner (occupation)": '2.16.840.1.113762.1.4.1096.129'
valueset "Physician assistant (occupation)": '2.16.840.1.113762.1.4.1096.129'
valueset "In-person encounter (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Durable medical equipment surveillance (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Renewal of prescription (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Referral to clinical nurse specialist (procedure)": '2.16.840.1.113883.3.464.1003.101.12.1046'
valueset "Seen by clinical nurse specialist (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Seen by nurse practitioner (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Seen by physician (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Referred by physician assistant (finding)": '2.16.840.1.113762.1.4.1096.216'
valueset "Prescription (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Change of prescription (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Evaluation AND/OR management - new patient (procedure)": '2.16.840.1.113883.3.2286'
valueset "Medicare (Non-managed Care)": '2.16.840.1.114222.4.11.3591'
valueset "National provider ID": '2.16.840.1.113762.1.4.1099.13'
valueset "Patient identifier": '2.16.840.1.113762.1.4.1099.13'
valueset "Durable medical equipment education, guidance, and counseling (procedure)": '2.16.840.1.113762.1.4.1099.13'
valueset "Durable medical equipment case management (procedure)": '2.16.840.1.113762.1.4.1099.13'
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
valueset "Revision of internal fixation device, broken or displaced (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Respiratory flow rate measured (situation)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Quantity finding (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Documentation of medication therapy management plan (procedure)"  :'2.16.840.1.113883.3.88.12.80.28'
valueset "Suppliers; Prosthetic/Orthotic Supplier" : '2.16.840.1.114222.4.11.1066'
valueset "Patient encounter procedure (procedure)" : '2.16.840.1.113762.1.4.1047.428'
valueset "Has advance care plan (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hematocrit determination (procedure)" : '2.16.840.1.113883.3.88.12.80.28'

code "Severe chronic obstructive pulmonary disease (disorder) code" : '313299006' from "SNOMEDCT" display 'Severe chronic obstructive pulmonary disease (disorder)'
code "Interstitial lung disease (disorder) code": '233703007' from "SNOMEDCT" display 'Interstitial lung disease (disorder)'
code "Cystic fibrosis (disorder) code" : '190905008' from "SNOMEDCT" display 'Cystic fibrosis (disorder)'
code "Bronchiectasis (disorder) code" : '12295008' from "SNOMEDCT" display 'Bronchiectasis (disorder)'
code "Malignant tumor of lung (disorder) code" : '363358000' from  "SNOMEDCT" display 'Malignant tumor of lung (disorder)'
code "Hypoxia (disorder) code" : '389086002' from "SNOMEDCT" display 'Hypoxia (disorder)'
code "Pulmonary hypertension (disorder) code":'70995007' from "SNOMEDCT" display 'Pulmonary hypertension (disorder)'
code "Erythrocytosis (disorder) code" : '127062003' from "SNOMEDCT" display 'Erythrocytosis (disorder)'
code "Impaired Cognition code": '386806002' from "SNOMEDCT" display 'Impaired Cognition'
code "Restlessness (finding) code": '162221009' from "SNOMEDCT" display 'Restlessness (finding)'
code "Morning headache (finding) code": '162310002' from "SNOMEDCT" display 'Morning headache (finding)'
code "Oximetry (procedure) code": '264598005' from "SNOMEDCT" display 'Oximetry (procedure)'
code "Respiratory, Developmental, Rehabilitative and Restorative Service Providers; Respiratory Therapist, Certified code": '227800000X' from "SNOMEDCT" display 'Respiratory, Developmental, Rehabilitative and Restorative Service Providers; Respiratory Therapist, Certified'
code "Oxygen therapy (procedure) code": '57485005' from "SNOMEDCT" display 'Oxygen therapy (procedure)'
code "Oxygen (substance) code": '24099007' from "SNOMEDCT" display 'Oxygen (substance)'
code "Inpatient stay (finding) code": '308540004' from "SNOMEDCT" display 'Inpatient stay (finding)'
code "Blood gas analysis (procedure) code": '278297009' from "SNOMEDCT" display 'Blood gas analysis (procedure)'
code "Patient's condition stable (finding) code": '359746009' from "SNOMEDCT" display "Patient's condition stable (finding)"
code "Practitioner certification status (finding) code": '417707001' from "SNOMEDCT" display "Practitioner certification status (finding)"
code "Blood gas analysis (procedure) code": '278297009' from "SNOMEDCT" display "Blood gas analysis (procedure)"
code "Treatment stopped - alternative therapy undertaken (situation) code": '182868002' from "SNOMEDCT" display "Treatment stopped - alternative therapy undertaken (situation)"
code "Oxygen saturation measurement, arterial (procedure) code": '113080007' from "SNOMEDCT" display "Oxygen saturation measurement, arterial (procedure)"
code "Exercises (regime/therapy) code": '226029000' from "SNOMEDCT" display "Exercises (regime/therapy)"
code "Oxygen measurement, partial pressure, arterial (procedure) code": '25579001' from "SNOMEDCT" display "Oxygen measurement, partial pressure, arterial (procedure)"
code "P pulmonale (finding) code": '164914003' from "SNOMEDCT" display "P pulmonale (finding)"
code "Insomnia (disorder) code": '193462001' from "SNOMEDCT" display "Insomnia (disorder)"
code "Cor pulmonale (disorder) code": '83291003' from "SNOMEDCT" display "Cor pulmonale (disorder)"
code "Pulmonary hypertension (disorder) code": '70995007' from "SNOMEDCT" display "Pulmonary hypertension (disorder)"
code "Sleeping out (finding) code": '224229008' from "SNOMEDCT" display "Sleeping out (finding)"
code "Dependent edema (finding) code": '248499004' from "SNOMEDCT" display "Dependent edema (finding)"
code "Right heart failure (disorder) code": '128404006' from "SNOMEDCT" display "Right heart failure (disorder)"
code "Pulmonary artery pressure monitoring (regime/therapy) code": '24599003' from "SNOMEDCT" display "Pulmonary artery pressure monitoring (regime/therapy)"
code "Pulmonary hypertension (disorder) code": '70995007' from "SNOMEDCT" display "Pulmonary hypertension (disorder)"
code "Echocardiography (procedure) code": '40701008' from "SNOMEDCT" display "Echocardiography (procedure)"
code "Hematocrit determination (procedure) code" : '28317006' from "SNOMEDCT" display "Hematocrit determination (procedure)"
code "Awake (finding) code": '248218005' from "SNOMEDCT" display "Awake (finding)"
code "Home oxygen therapy (procedure) code": '426990007' from "SNOMEDCT" display "Home oxygen therapy (procedure)"
code "Unilateral headache (situation) code": '103006007' from "SNOMEDCT" display "Unilateral headache (situation)"
code "Prescription (procedure) code": '16076005' from "SNOMEDCT" display "Prescription (procedure)"
code "Resting state (finding) code" : '' from "SNOMEDCT" display "Resting state (finding)"
code "Evaluation AND/OR management - new patient (procedure) code": '108220007' from "SNOMEDCT" display "Evaluation AND/OR management - new patient (procedure)"
code "Medicare (Non-managed Care) code": '12' from "SNOMEDCT" display "Medicare (Non-managed Care)"
code "Change of prescription (procedure) code": '113012008' from "SNOMEDCT" display "Change of prescription (procedure)"
code "Renewal of prescription (procedure) code": '103742009' from "SNOMEDCT" display "Renewal of prescription (procedure)"
code "Durable medical equipment case management (procedure) code": '410331005' from "SNOMEDCT" display "Durable medical equipment case management (procedure)"
code "Change recommended (qualifier value) code": '703466009' from "SNOMEDCT" display "Change recommended (qualifier value)"
code "Suppliers; Durable Medical Equipment & Medical Supplies, Oxygen Equipment & Supplies code": '332BX2000X' from "NUCCPT" display "Suppliers; Durable Medical Equipment & Medical Supplies, Oxygen Equipment & Supplies"
code "Documentation of medication therapy management plan (procedure) code": '429101000124104' from "SNOMEDCT" display  "Documentation of medication therapy management plan (procedure)" 
code "Home oxygen therapy management (procedure) code": '737854006' from "SNOMEDCT" display "Home oxygen therapy management (procedure)"
code "Assessment for home oxygen therapy (procedure) code": '445966008' from "SNOMEDCT" display "Assessment for home oxygen therapy (procedure)"
code "Illness (finding) code": '39104002' from "SNOMEDCT" display "Illness (finding)"
code "Patient's condition worsened (finding) code": '271299001' from "SNOMEDCT" display "Patient's condition worsened (finding)"
code "Patient's condition improved (finding) code" : '268910001' from "SNOMEDCT" display "Patient's condition improved (finding)"
code "Conditional prognosis (finding) code" : '60484009' from "SNOMEDCT" display "Conditional prognosis (finding)"
code "Administration of prescribed medications based on arterial blood gas results (procedure) code" : '370774005' from "SNOMEDCT" display "Administration of prescribed medications based on arterial blood gas results (procedure)"
code "Therapeutic regimen (regime/therapy) code" : '133877004' from "SNOMEDCT" display "Therapeutic regimen (regime/therapy)"
code "Gathering of past medical history (procedure) code" : '451571000124102' from "SNOMEDCT" display "Gathering of past medical history (procedure)"
code "Physician (occupation) code" : '309343006' from "SNOMEDCT" display "Physician (occupation)"
code "Seen by physician (finding) code" : '305660003' from "SNOMEDCT" display "Seen by physician (finding)"
code "Patient registration (procedure) code":'184047000' from "SNOMEDCT" display "Patient registration (procedure)"
code "Patient encounter procedure (procedure)  code" : '308335008' from "SNOMEDCT" display "Patient encounter procedure (procedure)"
code "Referral to clinical nurse specialist (procedure) code" : '306320001' from "SNOMEDCT" display "Referral to clinical nurse specialist (procedure)"
code "Durable medical equipment education, guidance, and counseling (procedure) code" : '410286008' from "SNOMEDCT" display "Durable medical equipment education, guidance, and counseling (procedure)"
code "Nurse practitioner (occupation) code": '224571005' from "SNOMEDCT" display "Nurse practitioner (occupation)"
code "Physician assistant (occupation) code":'449161006' from "SNOMEDCT" display "Physician assistant (occupation)"
code "Laboratory reporting, electronic (procedure) code":'33526004' from "SNOMEDCT" display "Laboratory reporting, electronic (procedure)"
code "Has advance care plan (finding) code": '714748000' from "SNOMEDCT" display "Has advance care plan (finding)"
code "Durable medical equipment surveillance (regime/therapy) code" : '410380000' from "SNOMEDCT" display "Durable medical equipment surveillance (regime/therapy)"
code "Suppliers; Prosthetic/Orthotic Supplier code" : '335E00000X' from "NUCCPT" display "Suppliers; Prosthetic/Orthotic Supplier"
code "Provision of talking monitored dosage system (procedure) code" : '713110009' from "SNOMEDCT" display "Provision of talking monitored dosage system (procedure)"
//Route of Administaration
code "Infusion (procedure) code":'36576007' from "SNOMEDCT" display "Infusion (procedure)"
code "Quantity finding (finding) code":'107651007' from "SNOMEDCT" display "Quantity finding (finding)"
code "Documentation procedure (procedure) code" : '23745001' from "SNOMEDCT" display "Documentation procedure (procedure)"
code "Domestic responsibility rehabilitation (regime/therapy) code" : '183357003' from "SNOMEDCT" display "Domestic responsibility rehabilitation (regime/therapy)"
code "Treatment completed (situation) code" : '182992009' from "SNOMEDCT" display "Treatment completed (situation)"
code "Previous treatment repeat (situation) code" : '182919001' from "SNOMEDCT" display "Previous treatment repeat (situation)"
code "Oxygen (substance) code" : '24099007' from "SNOMEDCT" display "Oxygen (substance)"
code "Revision of internal fixation device, broken or displaced (procedure) code" : '112706000' from "SNOMEDCT" display "Revision of internal fixation device, broken or displaced (procedure)"
code "Respiratory flow rate measured (situation) code":'165034005' from "SNOMEDCT" display "Respiratory flow rate measured (situation)"
code "Device (physical object) code" : '49062001' from "SNOMEDCT" display "Device (physical object)"
code "Does move (finding) code" : '302000008' from "SNOMEDCT" display "Does move (finding)"
code "Does not move (finding) code" : '302001007' from "SNOMEDCT" display "Does not move (finding)"
code "Preparation of medical certificate (procedure) code" : '103695000' from "SNOMEDCT" display "Preparation of medical certificate (procedure)"
code "Medical service (procedure) code" : '373655009' from "SNOMEDCT" display "Medical service (procedure)"
code "Outpatient procedure (procedure) code" : '371883000' from "SNOMEDCT" display "Outpatient procedure (procedure)"
code "Seen by clinical nurse specialist (finding) code" :'305733002' from "SNOMEDCT" display "Seen by clinical nurse specialist (finding)"
code "Seen by nurse practitioner (finding) code" : '305757002' from "SNOMEDCT" display "Seen by nurse practitioner (finding)"
code "Referred by physician assistant (finding) code": '2051000124106' from "SNOEMDCT" display "Referred by physician assistant (finding)"
code "In-person encounter (procedure) code" : '453701000124103' from "SNOMEDCT" display "In-person encounter (procedure)"
code "replaces code" : 'RPLC' from "ActRelationshipType" display "replaces"
code "National provider ID code": '45952-9' from "LONIC" display "National provider ID"
code "Patient identifier code" : '76435-7' from "LONIC" display "Patient identifier"

concept "Severe chronic obstructive pulmonary disease (disorder)" : {"Severe chronic obstructive pulmonary disease (disorder) code"} display 'Severe chronic obstructive pulmonary disease (disorder)'
concept "Interstitial lung disease (disorder)": {"Interstitial lung disease (disorder) code"} display 'Interstitial lung disease (disorder)'
concept "Cystic fibrosis (disorder)" : {"Cystic fibrosis (disorder) code"} display 'Cystic fibrosis (disorder)'
concept "Bronchiectasis (disorder)" : {"Bronchiectasis (disorder) code"} display 'Bronchiectasis (disorder)'
concept "Malignant tumor of lung (disorder)" : {"Malignant tumor of lung (disorder) code"} display 'Malignant tumor of lung (disorder)'
concept "Hypoxia (disorder)" : { "Hypoxia (disorder) code"} display 'Hypoxia (disorder)'
concept "Pulmonary hypertension (disorder)" : {"Pulmonary hypertension (disorder) code"} display 'Pulmonary hypertension (disorder)'
concept "Erythrocytosis (disorder)" :  {"Erythrocytosis (disorder) code"} display 'Erythrocytosis (disorder)'
concept "Impaired Cognition" : {"Impaired Cognition code"} display 'Impaired Cognition'
concept "Restlessness (finding)" : {"Restlessness (finding) code" } display 'Restlessness (finding)'
concept "Morning headache (finding)" : {"Morning headache (finding) code"} display 'Morning headache (finding)'
concept "Oximetry (procedure)" : {"Oximetry (procedure) code"} display 'Oximetry (procedure)'
concept "Oxygen therapy (procedure)" : {"Oxygen therapy (procedure) code"} display 'Oxygen therapy (procedure)'
concept "Device (physical object)" : {"Device (physical object) code"} display 'Device (physical object)'
concept "Respiratory, Developmental, Rehabilitative and Restorative Service Providers; Respiratory Therapist, Certified code" : {"Respiratory, Developmental, Rehabilitative and Restorative Service Providers; Respiratory Therapist, Certified code"} display 'Respiratory, Developmental, Rehabilitative and Restorative Service Providers; Respiratory Therapist, Certified code'
concept "Oxygen (substance)" : {"Oxygen (substance) code"} display 'Oxygen (substance)'
concept "Inpatient stay (finding)" : {"Inpatient stay (finding) code"} display 'Inpatient stay (finding)'
concept "Outpatient procedure (procedure)" : { "Outpatient procedure (procedure) code"} display 'Outpatient procedure (procedure)'
concept "Blood gas analysis (procedure)" : { "Blood gas analysis (procedure) code"} display 'Blood gas analysis (procedure)'
concept "Patient's condition stable (finding)": {"Patient's condition stable (finding) code"} display "Patient's condition stable (finding)"
concept "Practitioner certification status (finding)" : {"Practitioner certification status (finding) code"} display 'Practitioner certification status (finding)'
concept "Treatment stopped - alternative therapy undertaken (situation)" : {"Treatment stopped - alternative therapy undertaken (situation) code"} display 'Treatment stopped - alternative therapy undertaken (situation)'
concept "Oxygen saturation measurement, arterial (procedure)" : {"Oxygen saturation measurement, arterial (procedure) code"} display 'Oxygen saturation measurement, arterial (procedure)'
concept "Oxygen measurement, partial pressure, arterial (procedure)" : {"Oxygen measurement, partial pressure, arterial (procedure) code"} display 'Oxygen measurement, partial pressure, arterial (procedure)'
concept "Exercises (regime/therapy)" : {"Exercises (regime/therapy) code"} display 'Exercises (regime/therapy)'
concept "Resting state (finding)" : {"Resting state (finding) code"} display 'Resting state (finding)'
concept "Awake (finding)" : {"Awake (finding) code"} display 'Awake (finding)'
concept "P pulmonale (finding)" : {"P pulmonale (finding) code"} display "P pulmonale (finding)"
concept "Insomnia (disorder)" : {"Insomnia (disorder) code"} display "Insomnia (disorder)"
concept "Cor pulmonale (disorder)" : {"Cor pulmonale (disorder) code"} display "Cor pulmonale (disorder)"
concept "Sleeping out (finding)" : {"Sleeping out (finding) code"} display "Sleeping out (finding)"
concept "Dependent edema (finding)" : {"Dependent edema (finding) code"} display "Dependent edema (finding)"
concept "Right heart failure (disorder)" : {"Right heart failure (disorder) code"} display "Right heart failure (disorder)"
concept "Pulmonary artery pressure monitoring (regime/therapy)" : {"Pulmonary artery pressure monitoring (regime/therapy) code"} display  "Pulmonary artery pressure monitoring (regime/therapy)"
concept "Echocardiography (procedure)" : {"Echocardiography (procedure) code"} display "Echocardiography (procedure)"
concept "Hematocrit determination (procedure)" : {"Hematocrit determination (procedure) code"} display "Hematocrit determination (procedure)"
concept "Home oxygen therapy (procedure)" : {"Home oxygen therapy (procedure) code"} display "Home oxygen therapy (procedure)"
concept "Unilateral headache (situation)" : {"Unilateral headache (situation) code"} display "Unilateral headache (situation)"
concept "Prescription (procedure)" : {"Prescription (procedure) code"} display "Prescription (procedure)"
concept "Evaluation AND/OR management - new patient (procedure)" : {"Evaluation AND/OR management - new patient (procedure) code"} display "Evaluation AND/OR management - new patient (procedure)"
concept "Patient encounter procedure (procedure)" : {"Patient encounter procedure (procedure) code"} display "Patient encounter procedure (procedure)"
concept "Seen by physician (finding)" : {"Seen by physician (finding) code"} display "Seen by physician (finding)"
concept "Seen by clinical nurse specialist (finding)" : {"Seen by clinical nurse specialist (finding) code"} display "Seen by clinical nurse specialist (finding)"
concept "Seen by nurse practitioner (finding)" : {"Seen by nurse practitioner (finding) code"} display "Seen by nurse practitioner (finding)"
concept "Referred by physician assistant (finding)" : {"Referred by physician assistant (finding) code"} display "Referred by physician assistant (finding)"
concept "Renewal of prescription (procedure)" : {"Renewal of prescription (procedure) code"} display "Renewal of prescription (procedure)"
concept "In-person encounter (procedure)" : {"In-person encounter (procedure) code"} display "In-person encounter (procedure)"
concept "Medicare (Non-managed Care)" : {"Medicare (Non-managed Care) code"} display "Medicare (Non-managed Care)"
concept "Change of prescription (procedure)" : {"Change of prescription (procedure) code"} display "Change of prescription (procedure)"
concept "replaces" : {"replaces"} display "replaces"
concept "Durable medical equipment case management (procedure)" : {"Durable medical equipment case management (procedure) code"} display "Durable medical equipment case management (procedure)"
concept "Change recommended (qualifier value)" : {"Change recommended (qualifier value) code"} display "Change recommended (qualifier value)"
concept "Suppliers; Durable Medical Equipment & Medical Supplies, Oxygen Equipment & Supplies": {"Suppliers; Durable Medical Equipment & Medical Supplies, Oxygen Equipment & Supplies code"} display "Suppliers; Durable Medical Equipment & Medical Supplies, Oxygen Equipment & Supplies"
concept "Physician (occupation)" :{"Physician (occupation) code"} display "Physician (occupation)"
concept "Has advance care plan (finding)" : {"Has advance care plan (finding) code"} display "Has advance care plan (finding)"
concept "Home oxygen therapy management (procedure)" : {"Home oxygen therapy management (procedure)"} display "Home oxygen therapy management (procedure)"
concept "Assessment for home oxygen therapy (procedure)" : {"Assessment for home oxygen therapy (procedure)"} display "Assessment for home oxygen therapy (procedure)"
concept "Illness (finding)" : {"Illness (finding)"} display "Illness (finding)"
concept "Patient's condition worsened (finding)" : {"Patient's condition worsened (finding) code"} display "Patient's condition worsened (finding)"
concept "Patient's condition improved (finding)" : {"Patient's condition improved (finding) code"} display "Patient's condition improved (finding)"
concept "Conditional prognosis (finding)" : {"Conditional prognosis (finding) code"} display "Conditional prognosis (finding)"
concept "Administration of prescribed medications based on arterial blood gas results (procedure)" : {"Administration of prescribed medications based on arterial blood gas results (procedure) code"} display "Administration of prescribed medications based on arterial blood gas results (procedure)"
concept "Therapeutic regimen (regime/therapy)" : {"Therapeutic regimen (regime/therapy) code"} display "Therapeutic regimen (regime/therapy)"
concept "Gathering of past medical history (procedure)" : {"Gathering of past medical history (procedure) code"} display "Gathering of past medical history (procedure)"
concept "National provider ID" : {"National provider ID code"} display "National provider ID"
concept "Patient identifier" : {"Patient identifier code"} display "Patient identifier"
concept "Patient registration (procedure)" : {"Patient registration (procedure) code"} display "Patient registration (procedure)"
concept "Durable medical equipment education, guidance, and counseling (procedure)" : {"Durable medical equipment education, guidance, and counseling (procedure) code"} display "Durable medical equipment education, guidance, and counseling (procedure)"
concept "Documentation of medication therapy management plan (procedure)" : {"Documentation of medication therapy management plan (procedure) code"} display "Documentation of medication therapy management plan (procedure)"
concept "Nurse practitioner (occupation)" : {"Nurse practitioner (occupation) code"} display "Nurse practitioner (occupation)"
concept "Physician assistant (occupation)": {"Physician assistant (occupation) code"} display "Physician assistant (occupation)"
concept "Referral to clinical nurse specialist (procedure)" : {"Referral to clinical nurse specialist (procedure) code"} display "Referral to clinical nurse specialist (procedure)"
concept "Laboratory reporting, electronic (procedure)" : {"Laboratory reporting, electronic (procedure) code"} display "Laboratory reporting, electronic (procedure)"
concept "Durable medical equipment surveillance (regime/therapy)": {"Durable medical equipment surveillance (regime/therapy) code"} display "Durable medical equipment surveillance (regime/therapy)"
concept "Suppliers; Prosthetic/Orthotic Supplier" : {"Suppliers; Prosthetic/Orthotic Supplier code"} display "Suppliers; Prosthetic/Orthotic Supplier"
concept "Provision of talking monitored dosage system (procedure)" : {"Provision of talking monitored dosage system (procedure) code"} display "Provision of talking monitored dosage system (procedure)"
concept "Route of Administration" : {"Route of Administration code"} display "Route of Administration"
concept "Infusion (procedure)" : {"Infusion (procedure) code"} display "Infusion (procedure)"
concept "Quantity finding (finding)" : {"Quantity finding (finding) code"} display "Quantity finding (finding)"
concept "Documentation procedure (procedure)" : {"Documentation procedure (procedure) code"} display "Documentation procedure (procedure)"
concept "Domestic responsibility rehabilitation (regime/therapy)" : {"Domestic responsibility rehabilitation (regime/therapy) code"} display "Domestic responsibility rehabilitation (regime/therapy)"
concept "Treatment completed (situation)" : {"Treatment completed (situation) code"} display "Treatment completed (situation)"
concept "Previous treatment repeat (situation)" : {"Previous treatment repeat (situation) code"} display "Previous treatment repeat (situation)"
concept "Revision of internal fixation device, broken or displaced (procedure)" : {"Revision of internal fixation device, broken or displaced (procedure) code"} display "Revision of internal fixation device, broken or displaced (procedure)"
concept "Respiratory flow rate measured (situation)" : {"Respiratory flow rate measured (situation) code"} display "Respiratory flow rate measured (situation)"
concept "Does move (finding)" : {"Does move (finding) code"} display "Does move (finding)"
concept "Does not move (finding)" : {"Does not move (finding) code"} display "Does not move (finding)"
concept "Preparation of medical certificate (procedure)" : {"Preparation of medical certificate (procedure) code"} display "Preparation of medical certificate (procedure)"
concept "Medical service (procedure)" : {"Medical service (procedure) code"} display "Medical service (procedure)"

parameter "Measurement Period" Interval<DateTime>
parameter Value default Interval[56,59] 
parameter Time default Interval[15,180] 
parameter Days default Interval[61,90]

context Patient

define "Indications": 
	( exists (["Condition": "Severe chronic obstructive pulmonary disease (disorder)"] )
	or (exists (["Condition": "Interstitial lung disease (disorder)"] ) )
	or (exists (["Condition": "Cystic fibrosis (disorder)"] ) )
	or (exists (["Condition": "Bronchiectasis (disorder)"] ) )
	or (exists (["Condition": "Malignant tumor of lung (disorder)"] ) )
	or (exists (["Condition": "Hypoxia (disorder)"] ) )
	or (exists (["Condition": "Pulmonary hypertension (disorder)"] ) )
	or (exists (["Condition": "Erythrocytosis (disorder)"] ) )
	or (exists (["Condition": "Impaired Cognition"] ) )
	or (exists (["Condition": "Restlessness (finding)"] ) )
	or (exists (["Condition": "Morning headache (finding)"] ) )
	)
	
define "Not Covered(Oxygen Item)":
        (exists ["Procedure": "Oximetry (procedure)"])
         and (exists ["Procedure": "Respiratory, Developmental, Rehabilitative and Restorative Service Providers; Respiratory Therapist, Certified"])
         and (exists ["Procedure": "Oxygen therapy (procedure)"])
         
define "Oxygen Device":
         (exists ( ["Procedure": "Device (physical object)"] )
          and (exists ( ["MedicationAdministration": "Oxygen (substance)"] ) )
         )
         
define "Inpatient Encounters":
	(exists ["Encounter": "Inpatient stay (finding)"]E
	where E.period during "Measurement Period")
	
define "Outpatient Encounters":
	(exists ["Encounter": "Outpatient procedure (procedure)"]O
	where O.period during "Measurement Period")
	
define "BloodGasStudy":
	(exists ["Procedure": "Blood gas analysis (procedure)"]P
	where P.performed during "Measurement Period")
	
define "Qualifying BloodgasStudy":
          if("BloodGasStudy")
          then
          	(exists ["Encounter": "Inpatient stay (finding)"]E
	    where duration in days of E.period = 2 before "Measurement Period")	
            
           else
               null
	   	    
define "Outpatient Encounter":
	if(exists ["Condition":"Patient's condition stable (finding)"]D where (D.severity) = 30 'days')
	then
		(exists ["DiagnosticReport":"Practitioner certification status (finding)"])
	else
	    null
	
	
define "Qualifying Outpatient":
	(exists (["Procedure" : "Blood gas analysis (procedure)"] )
	 and "Outpatient Encounter")
	
		
define "Alternate Treatment":
	(exists ["DiagnosticReport": "Treatment stopped - alternative therapy undertaken (situation)"])
	//where  A.status = "clinically ineffective")
	
define "Group1 Condition1":
	( exists (["DiagnosticReport": "Blood gas analysis (procedure)"]) and  (exists ["DiagnosticReport": "Oxygen saturation measurement, arterial (procedure)"]Ox
		where Ox.result = 88 '%')
			and ( exists ["DiagnosticReport": "Oxygen measurement, partial pressure, arterial (procedure)"]Pa
	   			where Pa.result = 55 'mm of Hg')
	)
	   	
define "Group1 Condition2 Exercise":
	(exists ["Observation": "Exercises (regime/therapy)"] and (exists ["DiagnosticReport": "Oxygen saturation measurement, arterial (procedure)"]Ex
		where Ex.result = 89 '%')
	 and (exists (["Observation": "Exercises (regime/therapy)"]) and (exists ["DiagnosticReport": "Oxygen measurement, partial pressure, arterial (procedure)"]Pe
	   	where Pe.result = 56 'mm of Hg' ) )
	)	
	
define "Group1 Condition2 rest":
	(exists ["Observation": "Resting state (finding)"] and (exists ["DiagnosticReport": "Oxygen saturation measurement, arterial (procedure)"]Ex
		where Ex.result = 88 '%')
	 and (exists (["Observation": "Resting state (finding)"])) and (exists ["DiagnosticReport": "Oxygen measurement, partial pressure, arterial (procedure)"]Pe
	   	where Pe.result = 55 'mm of Hg')
	)
	
	  
define "Group1 Condition2 Awake":	
	(exists ["Observation": "Awake (finding)"] and (exists ["DiagnosticReport": "Oxygen saturation measurement, arterial (procedure)"]Ex
		where Ex.result = 89 '%' )
	 and (exists ["Observation": "Awake (finding)"]) and (exists["DiagnosticReport": "Oxygen measurement, partial pressure, arterial (procedure)"]Pe
	   	where Pe.result = 56 'mm of Hg')
	 )
	   	
define "Symptoms to hypoxemia":
	(exists ( ["Condition": "P pulmonale (finding)"] )
	or (exists ( ["Condition": "Erythrocytosis (disorder)"] ) )
	or (exists ( ["Condition": "Impaired Cognition"] ) )
	or (exists ( ["Condition": "Insomnia (disorder)"] ) )
	or (exists ( ["Condition": "Cor pulmonale (disorder)"] ) )
	or (exists ( ["Condition": "Pulmonary hypertension (disorder)"] ) )
	)
	
	
define "Decrease":
	(exists ["Observation": "Sleeping out (finding)"]A where (A.effective) = 5 'minutes'
	and (exists ["DiagnosticReport": "Oxygen saturation measurement, arterial (procedure)"]Ex
		where Ex.result = 83 '%'  )
	 and (exists ["Observation": "Sleeping out (finding)"]a where (a.effective) = 5 'minutes' 
	 and (exists ["DiagnosticReport": "Oxygen measurement, partial pressure, arterial (procedure)"]Pe
	   	where Pe.result = 45 'mm of Hg' )
	 and "Symptoms to hypoxemia"
	))
	
	 
define "Group1 Conditon2 Sleeping":
	 "Group1 Condition2 Awake"
	 	and (exists ["Observation": "Sleeping out (finding)"]A where (A.effective) = 5 'minutes'
	 	and (exists ["DiagnosticReport": "Oxygen saturation measurement, arterial (procedure)"]Ex
			where Ex.result = 88 '%'  ) )
	        and (exists ["Observation": "Sleeping out (finding)"]a where  (a.effective) = 5 'minutes' 
	        and (exists["DiagnosticReport": "Oxygen measurement, partial pressure, arterial (procedure)"]Pe
	   		where Pe.result = 55 'mm of Hg'  ) )
	 	and "Decrease" 
	
	 
define "Group1 Criteria":
	 "Group1 Condition1"
		and "Group1 Condition2 Exercise"
		and "Group1 Condition2 rest"
		and "Group1 Condition2 Awake"
		and  "Group1 Conditon2 Sleeping"
	
define "Group2 Symptoms":
	(exists ["Condition": "Dependent edema (finding)"]) 
	 and (exists ["Condition": "Right heart failure (disorder)"])
	 or  (exists ["DiagnosticReport": "Pulmonary artery pressure monitoring (regime/therapy)"]  
	 and (exists ["Condition": "Pulmonary hypertension (disorder)"]))
	 and (exists ["DiagnosticReport": "Echocardiography (procedure)"]
	 and  (exists ["Condition": "P pulmonale (finding)"]))
	 or (exists ["Condition": "Erythrocytosis (disorder)"])
	 and  (exists ["DiagnosticReport": "Hematocrit determination (procedure)"]H where H.result = 56 '%' ) 

define "Group2 Condition1 Awake":
	(exists ["Observation": "Awake (finding)"] and (exists ["DiagnosticReport": "Oxygen saturation measurement, arterial (procedure)"]Ex
		where Ex.result = 89 '%' )
	 and (exists ["Observation": "Awake (finding)"] and (exists ["DiagnosticReport": "Oxygen measurement, partial pressure, arterial (procedure)"]Pe
	   	where Pe.result = Value ) ) 
	 and "Group2 Symptoms"
	)
	 
define "Group2 Condition1 Exercise":
	(exists ["Observation": "Exercises (regime/therapy)"] and 
	(exists ["DiagnosticReport": "Oxygen saturation measurement, arterial (procedure)"]Ex
		where Ex.result = 89 '%') 
	 or (exists  ["Observation": "Exercises (regime/therapy)"] and
	  (exists ["DiagnosticReport": "Oxygen measurement, partial pressure, arterial (procedure)"]Pe
	   	where Pe.result = Value )
	 and "Group2 Symptoms" 
	))
	 
define "Group2 Condition1 Sleep1.1":
	(exists ["Observation": "Sleeping out (finding)"]A where (A.effective) = 5 'minutes'
	 and (exists ["DiagnosticReport": "Oxygen saturation measurement, arterial (procedure)"]Ex
		where Ex.result = 89 '%' )) and "Group2 Symptoms"
		
define "Group2 Condition1 Sleep1.2":	 
	 (exists (["Observation": "Sleeping out (finding)"]S
	 where  (S.effective) = 5 'minutes')
	 and (exists ["DiagnosticReport": "Oxygen measurement, partial pressure, arterial (procedure)"]Pe
	   	where Pe.result = Value in 'mm of HG' ) )
	and "Group2 Symptoms"

define "Group2 Condition1 Sleep":
		"Group2 Condition1 Sleep1.1" or "Group2 Condition1 Sleep1.2"
	 
define "Initial Coverage":
	( exists ["Procedure": "Home oxygen therapy (procedure)"]Th
			where duration in  months of Th.performed = 3
	)
	
define "Group2 Criteria":
	"Group2 Condition1 Awake"
	or "Group2 Condition1 Exercise" 
	or "Group2 Condition1 Sleep"
	or "Initial Coverage"
	
	
define "Long-term oxygen therapy":
	( exists  ["DiagnosticReport": "Oxygen saturation measurement, arterial (procedure)"]Ex
		where Ex.result = 89 '%')
	 or (exists ["DiagnosticReport": "Oxygen measurement, partial pressure, arterial (procedure)"]Pe
	   	where Pe.result = 56 'mm of Hg' and Pe.result = 65 'mm of Hg') 
	
	
	   	
define "Cluster Headaches":
	( exists ["Condition": "Unilateral headache (situation)"]Un
		where Un.severity = Time in 'minutes'
	)
		
define "Group3 Criteria":
	"Long-term oxygen therapy"
			or "Cluster Headaches"
		
	and  (exists ["DiagnosticReport": "Oxygen saturation measurement, arterial (procedure)"]Dx
			where Dx.result = 90 '%')
		or ( exists (["DiagnosticReport": "Oxygen measurement, partial pressure, arterial (procedure)"]Da
	   		where Da.result = 60 'mm of Hg') )
	 	
define  "Group Criteria":
	"Group1 Criteria"
		or "Group2 Criteria" 
		or  "Group3 Criteria" 
	
	
define "Coverage Criteria":
	"Indications"
	and "Qualifying BloodgasStudy"
	and "Qualifying Outpatient"
	and "Alternate Treatment"
	
define "Encounter Requirement1":
	(exists ["Procedure": "Prescription (procedure)"] P
	where P.performed overlaps  "Measurement Period")
	
define "Evaluation":
	(exists ["Procedure": "Evaluation AND/OR management - new patient (procedure)"])
	   	
define "Encounters":
	(exists ["Encounter": "Patient encounter procedure (procedure)"]) and (exists ["Encounter": "Seen by physician (finding)"])
	or (exists ["Encounter": "Patient encounter procedure (procedure)"]) and (exists ["Encounter": "Seen by clinical nurse specialist (finding)"])
	or (exists ["Encounter": "Patient encounter procedure (procedure)"]) and (exists ["Encounter": "Seen by nurse practitioner (finding)"])
	or (exists ["Encounter": "Patient encounter procedure (procedure)"]) and (exists ["Encounter": "Referred by physician assistant (finding)"])
		
	
define "Home Oxygen Therapy":
	(exists ["Procedure": "Home oxygen therapy (procedure)"]Ho
	where Ho.performed overlaps  "Measurement Period")
	
define "New Prescription":
	 (exists ["Procedure":"Renewal of prescription (procedure)"])
	and (exists ["Encounter":"Patient encounter procedure (procedure)"])
	and "Home Oxygen Therapy"
	
define "Condition1":
		(exists ["Encounter": "In-person encounter (procedure)"]I
		where duration in months of I.period = 6 before "Encounter Requirement1") 


define "Encounter Requirements":
	"Evaluation" 
	 and "New Prescription"
	and "Condition1"
	 
	  		 		 
define "New Prescription Requirement":
	(exists ["Procedure": "Medicare (Non-managed Care)"]
	or (exists ["Procedure": "Change of prescription (procedure)"])
	or (exists ["Procedure": "Renewal of prescription (procedure)"])
	or (exists ["Procedure": "replaces"]) and (exists ["Procedure": "Durable medical equipment case management (procedure)"])
	or (exists ["Observation": "Change recommended (qualifier value)"])
	 and (exists ["ProcedureRequest": "Suppliers; Durable Medical Equipment & Medical Supplies, Oxygen Equipment & Supplies"])
	)
	
define "Face-Face Requirements":
	"New Prescription Requirement"
	and "Encounter Requirements"
	and "New Prescription"
	and "Encounter Requirement1"
	and "Evaluation"
	
define "Medical Record":
         (exists ["Observation": "Has advance care plan (finding)"] and (exists ["Procedure": "Home oxygen therapy management (procedure)"]) and
          (exists["Procedure" :"Assessment for home oxygen therapy (procedure)"]) 
         and  "Oxygen Device"
         and (exists ["Condition":"Illness (finding)"]) and (exists ["Condition":"Patient's condition worsened (finding)"]) and 
         (exists ["Condition":"Patient's condition improved (finding)"]) and 
         (exists ["Condition" :"Conditional prognosis (finding)"]) and 
         (exists ["Procedure":"Administration of prescribed medications based on arterial blood gas results (procedure)" ])and 
         (exists ["Procedure": "Therapeutic regimen (regime/therapy)"]) and (exists ["Procedure":"Gathering of past medical history (procedure)"])
         )
 
define "Physician":
	(exists ["Practitioner": "Physician (occupation)"]Py
	where Py.identifier = "National provider ID")
		
		
define "Ordering Practitioner":
	(exists ["Encounter": "Patient encounter procedure (procedure)"])
	and (exists ["Observation":"Seen by physician (finding)"]])
	//or (exists ["Observation": "Seen by practitioner (finding)"])
	and (exists ["Observation":"Prescription (procedure)"] Ap
	where Ap.method during "Measurement Period")
	
define "Demographics":
	(exists ["Patient":"Patient identifier"])
	and (exists ["Procedure":"Patient registration (procedure)"])
	and "Physician"
	and (exists ["Procedure":"Durable medical equipment education, guidance, and counseling (procedure)"])
	and (exists ["Procedure":"Documentation of medication therapy management plan (procedure)"])
	and "Ordering Practitioner"
	
define "Practitioners":
		(exists ["Practitioner":"Physician (occupation)"])
		or (exists ["Practitioner":"Nurse practitioner (occupation)"])
		or (exists ["Practitioner":"Physician assistant (occupation)"])
			
define "Encounter Identifiers":
	(exists ["Encounter":"Patient encounter procedure (procedure)"] 
        and "Practitioners"
        and (exists ["Procedure":"Referral to clinical nurse specialist (procedure)"]))
        
        
	     
define "WOPD":
	"Demographics"
	and "Encounter Identifiers"
        and (exists ["Observation":"Laboratory reporting, electronic (procedure)"])
        and (exists ["Observation": "Has advance care plan (finding)"]) 
        and (exists ["Encounter":"Patient encounter procedure (procedure)"])
        and (exists ["ProcedureRequest":"Prescription (procedure)"])
        and (exists ["Procedure":"Durable medical equipment surveillance (regime/therapy)"]) 
        and (exists ["Procedure":"Suppliers; Prosthetic/Orthotic Supplier"])
        and (exists ["Procedure":"Provision of talking monitored dosage system (procedure)"]) 
        or (exists ["Procedure":"Route of Administration"])
        and (exists ["Procedure":"Assessment for home oxygen therapy (procedure)"]) 
        or (exists ["Procedure":"Infusion (procedure)"])
        and (exists ["Observation":"Quantity finding (finding)"]) 
      	or (exists ["Procedure": "Prescription (procedure)"])      
        and (exists ["ProcedureRequest":"Home oxygen therapy (procedure)"])
        and (exists ["Encounter":"Physician (occupation)"])
	

define "Supplier Responsibilities(WOPD)":
         if (exists ["Observation": "Documentation procedure (procedure)"] and (exists ["Encounter": "Patient encounter procedure (procedure)"])
          and (exists ["Observation": "Prescription (procedure)"]))
          then "Oxygen Device"
          else
              null
          
define "Not Covered(Supplier WOPD)":

         if("Oxygen Device")
         then
         	(exists ["Observation": "Prescription (procedure)"])
         else
         	null
                  
define "Physician Responsibility":
            (exists ["Observation": "Domestic responsibility rehabilitation (regime/therapy)"] DO
            where DO.performer= "Physician (occupation)")
            
define "Condition 1(BGT)":
       (exists ["Procedure": "Blood gas analysis (procedure)"]P
	where duration in months of  P.performed = 30 before "Measurement Period")

define "Condition 2(BGT)":
        not (exists ["Procedure": "Blood gas analysis (procedure)"]P
	where duration in months of  P.performed = 30 before "Measurement Period")
          
define "Condition 3(BGT)":
 	"Group1 Criteria" and  
    	 if("BloodGasStudy")
          then
          	(exists ["Encounter": "Inpatient stay (finding)"]E
	    where duration in months of E.period = 13 before "Measurement Period")	
            
           else
               null
      
define "Condition 4(BGT)":
             "Qualifying BloodgasStudy" and not (exists ["Encounter": "Treatment completed (situation)"] T
             where duration in days of T.period = Days )
             and  "Qualifying BloodgasStudy" and "Group1 Criteria" or "Group2 Criteria"
	     and (exists ["MedicationAdministration": "Oxygen (substance)"])      
                       
define "Condition 6(BGT)":
        (exists ["Procedure": "Blood gas analysis (procedure)"]P
	where duration in days of  P.performed = 30 before "Measurement Period" and duration in days of P.performed <= 30)
        
define "Condition 7(BGT)":
        (exists ["Procedure": "Blood gas analysis (procedure)"]P
	where duration in days of  P.performed = 30 before "Measurement Period") and (exists ["Condition": "Sleeping out (finding)"])
         and not (exists ["Encounter": "Previous treatment repeat (situation)"])
      or (exists ["Condition": "Awake (finding)"]) or (exists ["Condition": "Exercises (regime/therapy)"])
         and (exists ["Observation": "Previous treatment repeat (situation)"]) and (exists ["Procedure": "Blood gas analysis (procedure)"]P
	where duration in days of  P.performed = 30 before "Measurement Period")
   
     
define "Blood Gas Study Requirements":
           "Condition 1(BGT)" and "Condition 2(BGT)"and "Condition 3(BGT)" and "Condition 4(BGT)" and "Condition 6(BGT)" and "Condition 7(BGT)"
           
define "Condition 4(Submit Form)":
         (exists ["Procedure": "Revision of internal fixation device, broken or displaced (procedure)"])

define "Condition 8(Submit Form)":
          (exists ["Observation": "Respiratory flow rate measured (situation)"] RF
           where (RF. value) < 1 'Liter Per Minute' or
                 (RF.value) >= 1 and (RF.value)<= 4 'Liter Per Minute' or
                 (RF.value) > 4 'Liter Per Minute' )
                 
define "Portable Oxygen Device":
         (exists ["Procedure": "Device (physical object)"])
          and (exists ["Condition": "Does move (finding)"])
          and (exists ["MedicationAdministration": "Oxygen (substance)"])
          
define "Stationary Oxygen Device":
        (exists  ["Procedure": "Device (physical object)"])
         and (exists ["Condition": "Does not move (finding)"])
          and (exists ["MedicationAdministration": "Oxygen (substance)"])
        
define "Condition 9(Submit Form)":
          "Portable Oxygen Device" and 
          (exists ["DiagnosticReport": "Practitioner certification status (finding)"]) and "Stationary Oxygen Device"
          
define "Condition 10(Submit Form)":
          "Stationary Oxygen Device" and
          (exists ["DiagnosticReport": "Practitioner certification status (finding)"]) and  "Portable Oxygen Device"
        
define "Submit Form":
        "Condition 4(Submit Form)" and "Condition 8(Submit Form)" and "Condition 9(Submit Form)" and "Condition 10(Submit Form)" 
      
           
define "CMN and Its Requirements":
        (exists ["Observation": "Preparation of medical certificate (procedure)"]) and (exists ["Observation": "Medical service (procedure)"])
        and "Blood Gas Study Requirements" and "Submit Form"  
        
define "Condition 1.1(PVR)":
 	(exists ["DiagnosticReport": "Practitioner certification status (finding)"]P
 	where (P.effective) during "Measurement Period")


define "Condition 1(PVR)":
         (exists ["Encounter": "Seen by physician (finding)"]S where duration in days of S.period before "Condition 1.1(PVR)")
         
define "Condition 2(PVR)":
        (exists ["Encounter": "Seen by physician (finding)"] PHY where duration in days of PHY.period = 90 before "Measurement Period")
        and (exists ["MedicationAdministration": "Oxygen (substance)"])
        
define "Physician Visit Requirements":
        "Condition 1(PVR)" and "Condition 2(PVR)"
                    
define "Covered":
	"WOPD"
	 "Medical Record"
	and "Face-Face Requirements"
	and "Coverage Criteria"
        and "Supplier Responsibilities(WOPD)"
        and "CMN and Its Requirements"
        and "Physician Responsibility"
        
define "Not Covered":
        "Not Covered(Oxygen Item)" and "Not Covered(Supplier WOPD)"
        
