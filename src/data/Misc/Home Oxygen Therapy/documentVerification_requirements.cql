library HomeOxygenTherapy version '1'

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
codesystem "EntityNamePartQualifier": '2.16.840.1.113883.11.20.9.26'
codesystem "LOINC": '2.16.840.1.113762.1.4.1099.13'
codesystem "NUCCPT":'2.16.840.1.114222.4.11.1066'

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
valueset "Inpatient stay (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Patient's condition stable (finding)": '2.16.840.1.113762.1.4.1096.114'
valueset "Practitioner certification status (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Treatment stopped - alternative therapy undertaken (situation)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Oxygen saturation measurement, arterial (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Oxygen measurement, partial pressure, arterial (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Exercises (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Resting state (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Sleeping out (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Awake (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "P pulmonale (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Insomnia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Cor pulmonale (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Dependent edema (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Pulmonary artery pressure monitoring (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Echocardiography (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Hematocrit determination (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Unilateral headache (situation)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Attending physician (occupation)":'2.16.840.1.113762.1.4.1099.14'
valueset "National provider ID": '2.16.840.1.113762.1.4.1099.13'
valueset "Seen by nurse practitioner (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Seen by physician (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Referred by physician assistant (finding)": '2.16.840.1.113762.1.4.1096.216'
valueset "Encounter Face to Face": '2.16.840.1.113762.1.4.1111.78'
valueset "Seen by clinical nurse specialist (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Illness (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Patient's condition worsened (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Patient's condition improved (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Mobile in home (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Conditional prognosis (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Administration of prescribed medications based on arterial blood gas results (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Functional movement disorder (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Evaluating interventions (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Past history of procedure (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Gathering of past medical history (procedure)": '2.16.840.1.113762.1.4.1096.118'
valueset "Physician (occupation)": '2.16.840.1.113762.1.4.1096.129'
valueset "Equipment in use (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Equipment requirement (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Equipment related features (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Durable medical equipment education, guidance, and counseling (procedure)": '2.16.840.1.113762.1.4.1099.13'

code "Home oxygen therapy (procedure) code": '426990007' from "SNOMEDCT" display 'Home oxygen therapy (procedure)'
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
code "Inpatient stay (finding)" : '308540004' from "SNOMEDCT" display 'Inpatient stay (finding)'
code "Patient's condition stable (finding) code": '359746009' from "SNOMEDCT" display "Patient's condition stable (finding)"
code "Practitioner certification status (finding) code": '417707001' from "SNOMEDCT" display 'Practitioner certification status (finding)'
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
code "Hematocrit determination (procedure)" : '28317006' from "SNOMEDCT" display 'Hematocrit determination (procedure)'
code "Unilateral headache (situation) code": '103006007' from "SNOMEDCT" display 'Unilateral headache (situation)'
code "Blood gas analysis (procedure) code": '278297009' from "SNOMEDCT" display 'Blood gas analysis (procedure)'
code "Encounter Face to Face code": '20160302' from "SNOMEDCT" display 'Encounter Face to Face'
code "Seen by physician (finding) code": '305660003' from "SNOMEDCT" display 'Seen by physician (finding)'
code "Seen by clinical nurse specialist (finding) code": '305733002' from "SNOMEDCT" display 'Seen by clinical nurse specialist (finding)'
code "Seen by nurse practitioner (finding) code": '305757002' from "SNOMEDCT" display 'Seen by nurse practitioner (finding)'
code "National provider ID code": '45952-9' from "LOINC" display 'National provider ID'
code "Illness (finding) code": '39104002' from "SNOMEDCT" display 'Illness (finding)'
code "Patient's condition worsened (finding) code": '271299001' from "SNOMEDCT" display "Patient's condition worsened (finding)"
code "Patient's condition improved (finding) code": '268910001' from "SNOMEDCT" display "Patient's condition improved (finding)"
code "Conditional prognosis (finding) code": '60484009' from "SNOMEDCT" display 'Conditional prognosis (finding)'
code "Mobile in home (finding) code": '302000008' from "SNOMEDCT" display 'Mobile in home (finding)'
code "Equipment related features (finding) code": '405655001' from "SNOMEDCT" display 'Equipment related features (finding)'
code "Equipment requirement (finding) code": '698532002' from "SNOMEDCT" display 'Equipment requirement (finding)'
code "Equipment in use (finding) code": '397917005' from "SNOMEDCT" display 'Equipment in use (finding)'
code "Durable medical equipment education, guidance, and counseling (procedure) code": '410286008' from "SNOMEDCT" display 'Durable medical equipment education, guidance, and counseling (procedure)'
code "Attending physician (occupation) code": '405279007' from "SNOMEDCT" display 'Attending physician (occupation)'
code "Administration of prescribed medications based on arterial blood gas results (procedure) code": '370774005' from "SNOMEDCT" display 'Administration of prescribed medications based on arterial blood gas results (procedure)'
code "Past history of procedure (situation) code": '416940007' from "SNOMEDCT" display 'Past history of procedure (situation)'
code "Functional movement disorder (disorder) code": '718362003' from "SNOMEDCT" display 'Functional movement disorder (disorder)'
code "Evaluating interventions (procedure) code": '225303001' from "SNOMEDCT" display 'Evaluating interventions (procedure)'
code "Primary diagnosis code": '18630-4' from "LOINC" display 'Primary diagnosis'

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
concept "Patient's condition stable (finding)": {"Patient's condition stable (finding) code"} display "Patient's condition stable (finding)"
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
concept "Blood gas analysis (procedure)": {"Blood gas analysis (procedure) code"} display 'Blood gas analysis (procedure)'
concept "Encounter Face to Face": {"Encounter Face to Face code"} display 'Encounter Face to Face'
concept "Seen by physician (finding)": {"Seen by physician (finding) code"} display 'Seen by physician (finding)'
concept "Seen by clinical nurse specialist (finding)": {"Seen by clinical nurse specialist (finding) code"} display 'Seen by clinical nurse specialist (finding)'
concept "Seen by nurse practitioner (finding)": {"Seen by nurse practitioner (finding) code"} display 'Seen by nurse practitioner (finding)'
concept "Referred by physician assistant (finding)": {"Referred by physician assistant (finding) code"} display 'Referred by physician assistant (finding)'
concept "Home oxygen therapy (procedure)": {"Home oxygen therapy (procedure) code"} display 'Home oxygen therapy (procedure)'
concept "National provider ID": {"National provider ID code"} display 'National provider ID'
concept "Illness (finding)": {"Illness (finding) code"} display 'Illness (finding)'
concept "Patient's condition worsened (finding)": {"Patient's condition worsened (finding) code"} display "Patient's condition worsened (finding)"
concept "Patient's condition improved (finding)": {"Patient's condition improved (finding) code"} display "Patient's condition improved (finding)"
concept "Conditional prognosis (finding)": {"Conditional prognosis (finding) code"} display 'Conditional prognosis (finding)'
concept "Mobile in home (finding)": {"Mobile in home (finding) code"} display 'Mobile in home (finding)'
concept "Attending physician (occupation)": {"Attending physician (occupation) code"} display 'Attending physician (occupation)'
concept "Administration of prescribed medications based on arterial blood gas results (procedure)": {"Administration of prescribed medications based on arterial blood gas results (procedure) code"} display 'Administration of prescribed medications based on arterial blood gas results (procedure)'
concept "Past history of procedure (situation)": {"Past history of procedure (situation) code"} display 'Past history of procedure (situation)'
concept "Evaluating interventions (procedure)": {"Evaluating interventions (procedure) code"} display 'Evaluating interventions (procedure)'
concept "Functional movement disorder (disorder)": {"Functional movement disorder (disorder) code"} display 'Functional movement disorder (disorder)'
concept "Primary diagnosis": {"Primary diagnosis code"} display 'Primary diagnosis'

context Patient

define "Indications":
	{"Condition":"Chronic Obstructive Pulmonary Disease",
	"Condition": "Interstitial lung disease (disorder)",
	"Condition": "Cystic fibrosis (disorder)",
	"Condition": "Bronchiectasis (disorder)",
	"Condition": "Malignant tumor of lung (disorder)",
	"Condition": "Hypoxia (disorder)",
	"Condition": "Pulmonary hypertension (disorder)",
	"Condition": "Erythrocytosis (disorder)",
	"Condition": "Impaired Cognition",
	"Observation":"Restlessness (finding)",
	"Condition": "Morning headache (finding)"}

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

define "Group1 Condition1":
	{"Procedure": "Blood gas analysis (procedure)",
	"Procedure": "Oxygen saturation measurement, arterial (procedure)",
	"Procedure": "Oxygen measurement, partial pressure, arterial (procedure)"}

define "Group1 Condition2 Exercise":
	{"Procedure": "Exercises (regime/therapy)",
	"Procedure": "Oxygen saturation measurement, arterial (procedure)",
	"Procedure": "Oxygen measurement, partial pressure, arterial (procedure)"}

define "Group1 Condition2 rest":
	{"Observation": "Resting state (finding)",
	"Procedure": "Oxygen saturation measurement, arterial (procedure)",
	"Procedure": "Oxygen measurement, partial pressure, arterial (procedure)"}


define "Group1 Condition2 Awake":
	{"Observation": "Awake (finding)",
	"Procedure": "Oxygen saturation measurement, arterial (procedure)",
	"Procedure": "Oxygen measurement, partial pressure, arterial (procedure)"}

define "Symptoms to hypoxemia":
	{"Condition": "P pulmonale (finding)",
	"Condition": "Erythrocytosis (disorder)",
	"Condition": "Impaired Cognition",
	"Condition": "Insomnia (disorder)",
	"Condition": "Cor pulmonale (disorder)",
	"Condition": "Pulmonary hypertension (disorder)"}


define "Decrease":
	{"Observation": "Sleeping out (finding)",
	"Procedure": "Oxygen saturation measurement, arterial (procedure)",
	"Procedure": "Oxygen measurement, partial pressure, arterial (procedure)"}
	union "Symptoms to hypoxemia"

define "Group1 Conditon2 Sleeping":
	 "Group1 Condition2 Awake"
	 union "Decrease"
	 union {"Observation": "Sleeping out (finding)",
		    "Procedure": "Oxygen saturation measurement, arterial (procedure)"],
		    "Procedure": "Oxygen measurement, partial pressure, arterial (procedure)"}

define "Group1 Criteria":
	"Group1 Condition1"
	union "Group1 Condition2 Exercise"
	union "Group1 Condition2 rest"
	union "Group1 Condition2 Awake"
	union  "Group1 Conditon2 Sleeping"

define "Group2 Symptoms":
	{"Condition": "Dependent edema (finding)",
	"Condition": "Right heart failure (disorder)",
	"Procedure": "Pulmonary artery pressure monitoring (regime/therapy)",
	"Condition": "Pulmonary hypertension (disorder)",
	"Procedure": "Echocardiography (procedure)",
	"Condition": "P pulmonale (finding)",
	"Condition": "Erythrocytosis (disorder)",
	"Procedure": "Hematocrit determination (procedure)"}

define "Group2 Condition1 Awake":
	{"Observation": "Awake (finding)",
	"Procedure": "Oxygen saturation measurement, arterial (procedure)",
	"Procedure": "Oxygen measurement, partial pressure, arterial (procedure)"}
	union "Group2 Symptoms"

define "Group2 Condition1 Exercise":
	{"Procedure": "Exercises (regime/therapy)",
	"Procedure": "Oxygen saturation measurement, arterial (procedure)",
	"Procedure": "Oxygen measurement, partial pressure, arterial (procedure)"}
	union "Group2 Symptoms"

define "Group2 Condition1 Sleep1.1":
	{"Observation": "Sleeping out (finding)",
	"Procedure": "Oxygen saturation measurement, arterial (procedure)"}
	union "Group2 Symptoms"

define "Group2 Condition1 Sleep1.2":
	 {"Observation": "Sleeping out (finding)",
	 "Procedure": "Oxygen measurement, partial pressure, arterial (procedure)"}
	 union "Group2 Symptoms"

define "Group2 Condition1 Sleep":
		"Group2 Condition1 Sleep1.1" union "Group2 Condition1 Sleep1.2"

define "Initial Coverage":
	{"Procedure": "Home oxygen therapy (procedure)"}

define "Group2 Criteria":
	"Group2 Condition1 Awake"
	union "Group2 Condition1 Exercise"
	union "Group2 Condition1 Sleep"
	union "Initial Coverage"

define "Long-term oxygen therapy":
	{"Procedure": "Oxygen saturation measurement, arterial (procedure)",
	"Procedure": "Oxygen measurement, partial pressure, arterial (procedure)"}

define "Cluster Headaches":
	{"Condition": "Unilateral headache (situation)"}

define "Group3 Criteria":
	"Long-term oxygen therapy"
	union "Cluster Headaches"
	union {"Procedure": "Oxygen saturation measurement, arterial (procedure)",
	        "Procedure": "Oxygen measurement, partial pressure, arterial (procedure)"}

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

define "Physician":
	(exists [Practitioner: "Attending physician (occupation)"]Py
	where Py.identifier = "National provider ID"
	return Py.qualification.code)

define "Encounter Conduct":
	{"Encounter": "Encounter Face to Face",
	"Encounter": "Seen by physician (finding)",
	"Encounter": "Seen by clinical nurse specialist (finding)",
	"Encounter": "Seen by nurse practitioner (finding)",
	"Encounter": "Referred by physician assistant (finding)"}

define "Medical Record":
	{"DiagnosticReport":"Primary diagnosis",
	{"Condition":"Illness (finding)",
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

define "WOPD Details Required":
	{"Patient":Patient.name.given + ' ' + Patient.name.family,
	"Practitioner":"Physician (occupation)",
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

