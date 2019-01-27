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
codesystem "NUCCPT":'https://www.nlm.nih.gov/research/umls/sourcereleasedocs/current/NUCCPT/sourcerepresentation.html'
codesystem "CPT":'https://www.aapc.com/resources/medical-coding/cpt.aspx'
codesystem "ICD10CM":'https://www.cdc.gov/nchs/icd/icd10cm.htm'
codesystem "ICD10PCS":'https://www.cdc.gov/nchs/icd/icd10cm_pcs.htm'

/*
valueset "Home oxygen therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Chronic obstructive pulmonary disease, unspecified": '2.16.840.1.113883.3.464.1003.102.11.1021'
valueset "Interstitial pulmonary disease, unspecified": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Cystic fibrosis with pulmonary manifestations": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Bronchiectasis, uncomplicated": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Malignant neoplasm of unspecified part of unspecified bronchus or lung": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hypoxemia": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Primary pulmonary hypertension": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Right heart failure, unspecified": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Secondary polycythemia": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Mild cognitive impairment, so stated": '2.16.840.1.113762.1.4.1046.89'
valueset "Restlessness and agitation": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Chronic tension-type headache, intractable": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Arterial Blood Gas With Oxyhemoglobin": '2.16.840.1.113883.3.88.12.80.28'
valueset "Inpatient stay (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Patient's condition stable (finding)": '2.16.840.1.113762.1.4.1096.114'
valueset "Practitioner certification status (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Treatment stopped - alternative therapy undertaken (situation)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Gases, blood, O2 saturation only, by direct measurement, except pulse oximetry": '2.16.840.1.113883.3.88.12.80.28'
valueset "Gases, blood, any combination of pH, pCO2, pO2, CO2, HCO3 (including calculated O2 saturation)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Therapeutic Exercise": '2.16.840.1.113883.3.88.12.80.28'
valueset "Resting state (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Sleeping out (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Awake (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "P pulmonale (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Insomnia, unspecified": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Cor pulmonale (chronic)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Edema, unspecified": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Other Cardiovascular Procedures": '2.16.840.1.113883.3.88.12.80.28'
valueset "Transthoracic echocardiography": '2.16.840.1.113883.3.88.12.80.28'
valueset "Hematocrit" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Cluster headache syndrome, unspecified, not intractable": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Attending physician (occupation)":'2.16.840.1.113762.1.4.1099.14'
valueset "National provider ID": '2.16.840.1.113762.1.4.1099.13'
valueset "Seen by nurse practitioner (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Seen by physician (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Referred by physician assistant (finding)": '2.16.840.1.113762.1.4.1096.216'
valueset "Prolonged Services With Direct Face-to-Face Patient Contact": '2.16.840.1.113762.1.4.1111.78'
valueset "Seen by clinical nurse specialist (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Illness, unspecified": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Patient's condition worsened (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Patient's condition improved (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Mobile in home (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Slowness and poor responsiveness": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Administration of prescribed medications based on arterial blood gas results (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Conversion disorder with motor symptom or deficit":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Evaluating interventions (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Past history of procedure (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Gathering of past medical history (procedure)": '2.16.840.1.113762.1.4.1096.118'
valueset "Physician (occupation)": '2.16.840.1.113762.1.4.1096.129'
valueset "Equipment in use (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Equipment requirement (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Equipment related features (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Durable medical equipment education, guidance, and counseling (procedure)": '2.16.840.1.113762.1.4.1099.13'
*/

code "Chronic obstructive pulmonary disease, unspecified code": 'J44.9' from "ICD10CM" display 'Chronic obstructive pulmonary disease, unspecified'
code "Interstitial pulmonary disease, unspecified code": 'J84.9' from "ICD10CM" display 'Interstitial pulmonary disease, unspecified'
code "Cystic fibrosis with pulmonary manifestations code": 'E84.0' from "ICD10CM" display 'Cystic fibrosis with pulmonary manifestations'
code "Bronchiectasis, uncomplicated code": 'J47.9' from "ICD10CM" display 'Bronchiectasis, uncomplicated'
code "Malignant neoplasm of unspecified part of unspecified bronchus or lung code": 'C34.90' from "ICD10CM" display 'Malignant neoplasm of unspecified part of unspecified bronchus or lung'
code "Hypoxemia code": 'R09.02' from "ICD10CM" display 'Hypoxemia'
code "Primary pulmonary hypertension code": 'I27.0' from "ICD10CM" display 'Primary pulmonary hypertension'
code "Secondary polycythemia code": 'D75.1' from "ICD10CM" display 'Secondary polycythemia'
code "Mild cognitive impairment, so stated code": 'G31.84' from "ICD10CM" display 'Mild cognitive impairment, so stated'
code "Restlessness and agitation code": 'R45.1' from "ICD10CM" display 'Restlessness and agitation'
code "Chronic tension-type headache, intractable code": 'G44.221' from "ICD10CM" display 'Chronic tension-type headache, intractable'
code "Gases, blood, O2 saturation only, by direct measurement, except pulse oximetry code": '82810' from "CPT" display 'Gases, blood, O2 saturation only, by direct measurement, except pulse oximetry'
code "Gases, blood, any combination of pH, pCO2, pO2, CO2, HCO3 (including calculated O2 saturation) code": '82803' from "CPT" display 'Gases, blood, any combination of pH, pCO2, pO2, CO2, HCO3 (including calculated O2 saturation)'
code "Therapeutic Exercise code": '97110' from "CPT" display 'Therapeutic Exercise'
//code "P pulmonale (finding) code": '164914003' from "ICD10CM" display 'P pulmonale (finding)'
code "Insomnia, unspecified code": 'G47.00' from "ICD10CM" display 'Insomnia, unspecified'
code "Cor pulmonale (chronic) code": 'I27.81' from "ICD10CM" display 'Cor pulmonale (chronic)'
code "Edema, unspecified code": 'R60.9' from "ICD10CM" display 'Edema, unspecified'
code "Right heart failure, unspecified code": 'I50.810' from "ICD10CM" display 'Right heart failure, unspecified'
code "Other Cardiovascular Procedures code": '93799' from "CPT" display 'Other Cardiovascular Procedures'
code "Transthoracic echocardiography code": '93306' from "CPT" display 'Transthoracic echocardiography'
code "Hematocrit code" : '85014QW' from "CPT" display 'Hematocrit'
code "Cluster headache syndrome, unspecified, not intractable code": 'G44.009' from "ICD10CM" display 'Cluster headache syndrome, unspecified, not intractable'
code "Arterial Blood Gas With Oxyhemoglobin code": '82805' from "CPT" display 'Arterial Blood Gas With Oxyhemoglobin'
code "Prolonged Services With Direct Face-to-Face Patient Contact 99354 code": '99354' from "CPT" display 'Prolonged Services With Direct Face-to-Face Patient Contact 99354'
code "Prolonged Services With Direct Face-to-Face Patient Contact 99355 code" : '99355' from "CPT" display 'Prolonged Services With Direct Face-to-Face Patient Contact 99355'
code "Prolonged Services With Direct Face-to-Face Patient Contact 99356 code" : '99356' from "CPT" display 'Prolonged Services With Direct Face-to-Face Patient Contact 99356'
code "Prolonged Services With Direct Face-to-Face Patient Contact 99357 code" : '99357' from "CPT" display 'Prolonged Services With Direct Face-to-Face Patient Contact 99357'
code "National provider ID code": '45952-9' from "LOINC" display 'National provider ID'
code "Illness, unspecified code": 'R69' from "ICD10CM" display 'Illness, unspecified'
code "Slowness and poor responsiveness code": 'R46.4' from "ICD10CM" display 'Slowness and poor responsiveness'
code "Conversion disorder with motor symptom or deficit code": 'F44.4' from "ICD10CM" display 'Conversion disorder with motor symptom or deficit'
code "Primary diagnosis code": '18630-4' from "LOINC" display 'Primary diagnosis'

code "Mobile in home (finding) code": '302000008' from "SNOMEDCT" display 'Mobile in home (finding)'
code "Equipment related features (finding) code": '405655001' from "SNOMEDCT" display 'Equipment related features (finding)'
code "Equipment requirement (finding) code": '698532002' from "SNOMEDCT" display 'Equipment requirement (finding)'
code "Equipment in use (finding) code": '397917005' from "SNOMEDCT" display 'Equipment in use (finding)'
code "Durable medical equipment education, guidance, and counseling (procedure) code": '410286008' from "SNOMEDCT" display 'Durable medical equipment education, guidance, and counseling (procedure)'
code "Attending physician (occupation) code": '405279007' from "SNOMEDCT" display 'Attending physician (occupation)'
code "Administration of prescribed medications based on arterial blood gas results (procedure) code": '370774005' from "SNOMEDCT" display 'Administration of prescribed medications based on arterial blood gas results (procedure)'
code "Past history of procedure (situation) code": '416940007' from "SNOMEDCT" display 'Past history of procedure (situation)'
code "Evaluating interventions (procedure) code": '225303001' from "SNOMEDCT" display 'Evaluating interventions (procedure)'
code "Home oxygen therapy (procedure) code": '426990007' from "SNOMEDCT" display 'Home oxygen therapy (procedure)'
code "Patient's condition worsened (finding) code": '271299001' from "SNOMEDCT" display 'Patient condition worsened (finding)'
code "Patient's condition improved (finding) code": '268910001' from "SNOMEDCT" display 'Patient condition improved (finding)'
code "Inpatient stay (finding)" : '308540004' from "SNOMEDCT" display 'Inpatient stay (finding)'

code "Patient's condition stable (finding) code": '359746009' from "SNOMEDCT" display 'Patient condition stable (finding)'
code "Practitioner certification status (finding) code": '417707001' from "SNOMEDCT" display 'Practitioner certification status (finding)'
code "Treatment stopped - alternative therapy undertaken (situation) code": '182868002' from "SNOMEDCT" display 'Treatment stopped - alternative therapy undertaken (situation)'
code "Resting state (finding) code": '128975004' from "SNOMEDCT" display 'Resting state (finding)'
code "Awake (finding) code": '248218005' from "SNOMEDCT" display 'Awake (finding)'
code "Sleeping out (finding) code": '224229008' from "SNOMEDCT" display 'Sleeping out (finding)'
code "Seen by physician (finding) code": '305660003' from "SNOMEDCT" display 'Seen by physician (finding)'
code "Seen by clinical nurse specialist (finding) code": '305733002' from "SNOMEDCT" display 'Seen by clinical nurse specialist (finding)'
code "Seen by nurse practitioner (finding) code": '305757002' from "SNOMEDCT" display 'Seen by nurse practitioner (finding)'

concept "Chronic obstructive pulmonary disease, unspecified": {"Chronic obstructive pulmonary disease, unspecified code"} display 'Chronic obstructive pulmonary disease, unspecified'
concept "Interstitial pulmonary disease, unspecified": {"Interstitial pulmonary disease, unspecified code"} display 'Interstitial pulmonary disease, unspecified'
concept "Cystic fibrosis with pulmonary manifestations": {"Cystic fibrosis with pulmonary manifestations code"} display 'Cystic fibrosis with pulmonary manifestations'
concept "Bronchiectasis, uncomplicated": {"Bronchiectasis, uncomplicated code"} display 'Bronchiectasis, uncomplicated'
concept "Malignant neoplasm of unspecified part of unspecified bronchus or lung": {"Malignant neoplasm of unspecified part of unspecified bronchus or lung code"} display 'Malignant neoplasm of unspecified part of unspecified bronchus or lung'
concept "Hypoxemia": {"Hypoxemia code"} display 'Hypoxemia'
concept "Primary pulmonary hypertension": {"Primary pulmonary hypertension code"} display 'Primary pulmonary hypertension'
concept "Secondary polycythemia": {"Secondary polycythemia code"} display 'Secondary polycythemia'
concept "Mild cognitive impairment, so stated": {"Mild cognitive impairment, so stated code"} display 'Mild cognitive impairment, so stated'
concept "Restlessness and agitation": {"Restlessness and agitation code"} display 'Restlessness and agitation'
concept "Chronic tension-type headache, intractable": {"Chronic tension-type headache, intractable code"} display 'Chronic tension-type headache, intractable'
//concept "Inpatient stay (finding)": {"Inpatient stay (finding) code"} display 'Inpatient stay (finding)'
concept "Patient's condition stable (finding)": {"Patient's condition stable (finding) code"} display 'Patient condition stable (finding)'
concept "Practitioner certification status (finding)": {"Practitioner certification status (finding) code"} display 'Practitioner certification status (finding)'
concept "Treatment stopped - alternative therapy undertaken (situation)": {"Treatment stopped - alternative therapy undertaken (situation) code"} display 'Treatment stopped - alternative therapy undertaken (situation)'
concept "Gases, blood, O2 saturation only, by direct measurement, except pulse oximetry": {"Gases, blood, O2 saturation only, by direct measurement, except pulse oximetry code"} display 'Gases, blood, O2 saturation only, by direct measurement, except pulse oximetry'
concept "Gases, blood, any combination of pH, pCO2, pO2, CO2, HCO3 (including calculated O2 saturation)": {"Gases, blood, any combination of pH, pCO2, pO2, CO2, HCO3 (including calculated O2 saturation) code"} display 'Gases, blood, any combination of pH, pCO2, pO2, CO2, HCO3 (including calculated O2 saturation)'
concept "Therapeutic Exercise": {"Therapeutic Exercise code"} display 'Therapeutic Exercise'
//concept "Resting state (finding)": {"Resting state (finding) code"} display 'Resting state (finding)'
//concept "Awake (finding)": {"Awake (finding) code"} display 'Awake (finding)'
//concept "Sleeping out (finding)": {"Sleeping out (finding) code"} display 'Sleeping out (finding)'
//concept "P pulmonale (finding)": {"P pulmonale (finding) code"} display 'P pulmonale (finding)'
concept "Insomnia, unspecified": {"Insomnia, unspecified code"} display 'Insomnia, unspecified'
concept "Cor pulmonale (chronic)": {"Cor pulmonale (chronic) code"} display 'Cor pulmonale (chronic)'
concept "Edema, unspecified": {"Edema, unspecified code"} display 'Edema, unspecified'
concept "Right heart failure, unspecified": {"Right heart failure, unspecified code"} display 'Right heart failure, unspecified'
concept "Other Cardiovascular Procedures": {"Other Cardiovascular Procedures code"} display 'Other Cardiovascular Procedures'
concept "Transthoracic echocardiography": {"Transthoracic echocardiography code"} display 'Transthoracic echocardiography'
concept "Hematocrit": {"Hematocrit code"} display 'Hematocrit'
concept "Cluster headache syndrome, unspecified, not intractable": {"Cluster headache syndrome, unspecified, not intractable code"} display 'Cluster headache syndrome, unspecified, not intractable'
concept "Equipment related features (finding)": {"Equipment related features (finding) code"} display 'Equipment related features (finding)'
concept "Equipment requirement (finding)": {"Equipment requirement (finding) code"} display 'Equipment requirement (finding)'
concept "Equipment in use (finding)": {"Equipment in use (finding) code"} display 'Equipment in use (finding)'
concept "Durable medical equipment education, guidance, and counseling (procedure)": {"Durable medical equipment education, guidance, and counseling (procedure) code"} display 'Durable medical equipment education, guidance, and counseling (procedure)'
concept "Arterial Blood Gas With Oxyhemoglobin": {"Arterial Blood Gas With Oxyhemoglobin code"} display 'Arterial Blood Gas With Oxyhemoglobin'
concept "Prolonged Services With Direct Face-to-Face Patient Contact 99354": {"Prolonged Services With Direct Face-to-Face Patient Contact 99354 code"} display 'Prolonged Services With Direct Face-to-Face Patient Contact 99354'
concept "Prolonged Services With Direct Face-to-Face Patient Contact 99355": {"Prolonged Services With Direct Face-to-Face Patient Contact 99355 code"} display 'Prolonged Services With Direct Face-to-Face Patient Contact 99355'
concept "Prolonged Services With Direct Face-to-Face Patient Contact 99356": {"Prolonged Services With Direct Face-to-Face Patient Contact 99356 code"} display 'Prolonged Services With Direct Face-to-Face Patient Contact 99356'
concept "Prolonged Services With Direct Face-to-Face Patient Contact 99357": {"Prolonged Services With Direct Face-to-Face Patient Contact 99357 code"} display 'Prolonged Services With Direct Face-to-Face Patient Contact 99357'
//concept "Seen by physician (finding)": {"Seen by physician (finding) code"} display 'Seen by physician (finding)'
//concept "Seen by clinical nurse specialist (finding)": {"Seen by clinical nurse specialist (finding) code"} display 'Seen by clinical nurse specialist (finding)'
//concept "Seen by nurse practitioner (finding)": {"Seen by nurse practitioner (finding) code"} display 'Seen by nurse practitioner (finding)'
//concept "Referred by physician assistant (finding)": {"Referred by physician assistant (finding) code"} display 'Referred by physician assistant (finding)'
concept "Home oxygen therapy (procedure)": {"Home oxygen therapy (procedure) code"} display 'Home oxygen therapy (procedure)'
concept "National provider ID": {"National provider ID code"} display 'National provider ID'
concept "Illness, unspecified": {"Illness, unspecified code"} display 'Illness, unspecified'
concept "Patient's condition worsened (finding)": {"Patient's condition worsened (finding) code"} display 'Patient condition worsened (finding)'
concept "Patient's condition improved (finding)": {"Patient's condition improved (finding) code"} display 'Patient condition improved (finding)'
concept "Slowness and poor responsiveness": {"Slowness and poor responsiveness code"} display 'Slowness and poor responsiveness'
concept "Mobile in home (finding)": {"Mobile in home (finding) code"} display 'Mobile in home (finding)'
//concept "Attending physician (occupation)": {"Attending physician (occupation) code"} display 'Attending physician (occupation)'
concept "Administration of prescribed medications based on arterial blood gas results (procedure)": {"Administration of prescribed medications based on arterial blood gas results (procedure) code"} display 'Administration of prescribed medications based on arterial blood gas results (procedure)'
concept "Past history of procedure (situation)": {"Past history of procedure (situation) code"} display 'Past history of procedure (situation)'
concept "Evaluating interventions (procedure)": {"Evaluating interventions (procedure) code"} display 'Evaluating interventions (procedure)'
concept "Conversion disorder with motor symptom or deficit": {"Conversion disorder with motor symptom or deficit code"} display 'Conversion disorder with motor symptom or deficit'
concept "Primary diagnosis": {"Primary diagnosis code"} display 'Primary diagnosis'

context Patient

define "IC1":
    {
    "Condition":{
            "code":"Chronic obstructive pulmonary disease, unspecified"
        }
    }

define "IC2":
    {
        "Condition": {
            "code":"Interstitial pulmonary disease, unspecified"
        }
    }

define "IC3":
    {
        "Condition": {
            "code":"Cystic fibrosis with pulmonary manifestations"
        }
    }

define "IC4":
    {
        "Condition": {
            "code":"Bronchiectasis, uncomplicated"
        }
    }

define "IC5":
    {
        "Condition": {
            "code":"Malignant neoplasm of unspecified part of unspecified bronchus or lung"
        }
    }

define "IC6":
    {
        "Condition": {
            "code":"Hypoxemia"
        }
    }

define "IC7":
    {
        "Condition": {
            "code":"Primary pulmonary hypertension"
        }
    }

define "IC8":
    {
        "Condition": {
            "code":"Secondary polycythemia"
        }
    }

define "IC9":
    {
        "Condition": {
            "code":"Mild cognitive impairment, so stated"
        }
    }

define "IC10":
    {
        "Observation": {
            "code":"Restlessness and agitation"
        }
    }

define "IC11":
    {
        "Condition": {
            "code":"Chronic tension-type headache, intractable"
        }
    }

define "IC12":
    {
        "Condition": {
            "code":"Insomnia, unspecified"
        }
    }

define "IC13":
    {
        "Condition": {
            "code":"Cor pulmonale (chronic)"
        }
    }

define "IC14":
    {
        "Condition": {
            "code":"Edema, unspecified"
        }
    }

define "IC15":
    {
        "Condition": {
            "code":"Right heart failure, unspecified"
        }
    }

define "Indications":
	{'or',
        "IC1",
        "IC2",
        "IC3",
        "IC4",
        "IC5",
        "IC6",
        "IC7",
        "IC8",
        "IC9",
        "IC10",
        "IC11"
	}

define "BloodGasStudy":
	{
	    "Procedure":{
	        "code":"Arterial Blood Gas With Oxyhemoglobin"
	    }
	}

define "Qualifying BloodgasStudy":
      {'and',
          {
            "Encounter":{
                "type": 'Inpatient stay'
            }
          },
        "BloodGasStudy"
      }

define "Outpatient Encounter":
	{'and',
        {"Observation": {
            "code": 'Patient condition stable or not'
            }
        },
        {
         "DiagnosticReport":{
            "code": 'Practitioner certification status'
            }
        }
    }

define "Alternate Treatment":
	{
	    "DiagnosticReport":{
	        "code": 'Treatment stopped - alternative therapy undertaken (situation)'
	    }
	}

define "Qualifying Outpatient":
	{
	'and',"BloodGasStudy",
	 "Outpatient Encounter"
	 }

define "Saturation or PP":
    {'and', "BloodGasStudy",
        {'or',
            {
            "Procedure":{
                "code": "Gases, blood, O2 saturation only, by direct measurement, except pulse oximetry"
                }
            },
            {
            "Procedure":{
                "code": "Gases, blood, any combination of pH, pCO2, pO2, CO2, HCO3 (including calculated O2 saturation)"
                }
            }
        }
    }

define "Saturation and PP":
    {'and',"BloodGasStudy",
        {'and',
            {
            "Procedure":{
                "code": "Gases, blood, O2 saturation only, by direct measurement, except pulse oximetry"
                }
            },
            {
            "Procedure":{
                "code": "Gases, blood, any combination of pH, pCO2, pO2, CO2, HCO3 (including calculated O2 saturation)"
                }
            }
        }
    }

define "Group Exercise":
	{'and',
	    {
	    "Procedure":{
	        "code":"Therapeutic Exercise"
	        }
	    },
	    "Saturation or PP"
	}

define "Group rest":
	{'and',
	    {
	    "Observation": {
	        "code":'Resting state'
	        }
	    },
	    "Saturation or PP"
	}


define "Group Awake":
	{'and',
	    {
	    "Observation":{
	        "code": 'Awake'
	        }
	    },
	    "Saturation or PP"
	}

define "Symptoms to hypoxemia":
//	{{"Condition": "P pulmonale (finding)"},{'or'},
	{'or',
        "IC8",
        "IC9",
        "IC12",
        "IC13",
        "IC7"
	}


define "Decrease":
	{'and',
	    {"Observation":{
	        "code": 'Sleeping out'
	        }
	    },
	    "Saturation or PP"
	}

define "Group Sleeping":
	 {'and',
         "Decrease",
         "Symptoms to hypoxemia"
	 }


define "Group1 Criteria":
	{'or',"Group Exercise",
	 "Group rest",
	 "Group Awake",
	 "Group Sleeping"}

define "PC1":
    {"Procedure": {
        "code": "Other Cardiovascular Procedures"
        }
    }

define "PC2":
    {"Procedure": {
        "code": "Transthoracic echocardiography"
        }
    }

define "PC3":
    {"Procedure": {
        "code": "Hematocrit"
        }
    }

define "Group2 Symptoms":
	{'and',
        {'or',
            "IC14",
            "IC15",
            "IC7",
        //	{"Condition": "P pulmonale (finding)"},{'or'},
            "IC8"
        },
        {'or',
             "PC1",
             "PC2",
             "PC3"
        }
	 }

define "Group2 Awake":
	{'and',
        "Group Awake",
        "Group2 Symptoms"
	}

define "Group2 Exercise":
	{'and',
        "Group Exercise",
        "Group2 Symptoms"
	}

define "Group2 Sleep":
	{'and',
        "Decrease",
        "Group2 Symptoms"
	}

define "Initial Coverage":
	{
	    "Procedure": {
	        "code": "Home oxygen therapy (procedure)"
	    }
	}

define "Group2 Criteria":
	{'and',
        {'or',
            "Group2 Awake",
            "Group2 Exercise",
            "Group2 Sleep"
        },
        "Initial Coverage"
    }

define "Cluster Headaches":
	{
	"Condition": {
	    "code":"Cluster headache syndrome, unspecified, not intractable"
	    }
	}

define "Group3 Criteria":
	{'and',
        "Cluster Headaches",
        "Saturation or PP"
	}

define  "Group Criteria":
	{'or',
         "Group1 Criteria",
         "Group2 Criteria",
         "Group3 Criteria"
    }

define "BeneficiaryInformation":
 	{"Patient":{
 			"name":'Beneficiary Name',
            "identifier":'Beneficiary Medicare Number',
            "birthDate":'Beneficiary Date of Birth',
            "gender":'Beneficiary Gender',
            "address": 'Beneficiary Address',
            "managingOrganization":'Place of Service'
           }
     }

define "Supplier Information":
    {"SupplyRequest":{
    			"supplier":{
                    "name":'Supplier Name',
                    "identifier":' Supplier National Provider Identification',
                    "address":'Supplier Address',
                    "phone":'Supplier Phone Number'
                   }
               }
    }

define "RequestorInformation":
	{"Claim":
    		{
   			"enterer":{
   			    "name":'Contact Name',
   			    "phone":'Telephone Number',
   			    "address":'Address'
   			    }
   			}
   	}


define "OtherInformation":
    {"Claim":{
   		    "created":'Submission Date',
    		"supportingInfo":{
    		    "code":'HCPCS Codes'
    		},
    		"diagnosis":{
                "diagnosis":{
                    "diagnosisCodeableConcept":'Diagnosis code'
                    }
                }
    		}
    }

define "DocumentsInForm1":
    {"FormRequest":{
		       "checkbox": 'Indicate if the request is an initial or resubmission review',
		       "text": 'Indicate if the request is expedited and the reason why',
		       "number": 'Supplier National Supplier Clearinghouse (NSC) Number'
		    }
	}


define "WOPD Details Required":
 	{"Claim":{
     	"patient":{
            "name":Patient.name
            },
        "provider":{
            "name":'Physician or Practitioner Name',
            "identifier":'Practitioner National Provider Identifier (NPI)'
            },
        "item":{
                "detail":'Description of the item ordered',
                "encounter":{
                    "period":{
                        "end":'Date of the face-to-face examination'
                    }
                },
                "udi":{
                    "specialization":'Durable medical equipment  guidance',
                    "property":'Durable medical equipment education'
                }
            },
        "diagnosis":{
            "diagnosis":{
                "diagnosisReference":'Pertinent diagnoses/conditions that relate to the need for the item ordered'
                }
            }
        },
    //Signature has to be linked to the Physician attribute in Claim
    "Signature":{
        "who":'Physician signature',
        "when":'Date of physician signature'
        }
    }

define "EC1":
   {"Encounter":{
    		"type":"Prolonged Services With Direct Face-to-Face Patient Contact 99354"

    		}
    }

define "EC2":
   {"Encounter":{
    		"type":"Prolonged Services With Direct Face-to-Face Patient Contact 99355"

    		}
    }

define "EC3":
   {"Encounter":{
    		"type":
    			"Prolonged Services With Direct Face-to-Face Patient Contact 99356"

    		}
    }

define "EC4":
   {"Encounter":{
    		"type":"Prolonged Services With Direct Face-to-Face Patient Contact 99357"

    		}
    }

define "Encounter1":
	 {"Encounter":{
        	"participant":'Physician'

        		}
    	}
define "Encounter2":
	 {"Encounter":{
        	"participant":'Nurse Practitioner (NP)'

        		}
    	}
define "Encounter3":
    {"Encounter":{
        	"participant":
            			'Clinical Nurse Specialist (CNS)'

            	}
    }

define "Encounter4":
    {"Encounter":{
        	"participant":' Physician Assistant (PA)'

            	}
    }



define "EncounterConduct":
    {'and',
        {'or',
            "EC1",
            "EC2",
            "EC3",
            "EC4"
		},
		{'or',
            "Encounter1",
            "Encounter2",
            "Encounter3",
            "Encounter4"
	    }

    }

define "DocumentsInForm2":
    {"FormRequest":{
		       "checkbox": 'if portable oxygen is needed or not',
		       "text": 'If portable oxygen is needed, an indication that he or she is mobile within the home',
		       "text-type":'Prognosis'
		    }
	}

define "Medical Record":
 	{"Condition":{
     	"code": "Primary diagnosis",
        "onset":{
            "onsetPeriod":'Duration of condition'
            },
        "abatement":{
            "abatementPeriod":'Duration of condition'
            },
        "clinicalStatus": 'Clinical course (worsening or improving)',
        "stage":{
                "assessment":{
                    "code":"Arterial Blood Gas With Oxyhemoglobin",
                    "conclusion": 'Results of the blood gas study',
                    "focus": 'Nature and extent of functional limitations',
                    "device":{
                        "note":'Past experience with related items'
                        },
                    "note": 'Other therapeutic interventions and results'
                    }
                },
        "note":'Other pertinent information'
        }
    }

define "Practitioner Signature":
	{"MedicationPrescription":{
			"prescriber":'e-prescription containing digital Signature of the Pratitioner and date'
			}
	}

define "WOPD":
	{
        "Encounter" :"EncounterConduct",
        "WOPD Document": "WOPD Details Required"
	}

define "Documents":
    {
    "CMN For Oxygen":'https://www.cms.gov/Medicare/CMS-Forms/CMS-Forms/downloads/CMS484.pdf'
    }

define "Code Requirements":
    {
        "Indications":{
                "Indications"
            },
        "Qualifying BloodgasStudy":{
                "Qualifying BloodgasStudy"
            },
        "Qualifying Outpatient":{
                "Qualifying Outpatient"
            },
        "Alternate Treatment":{
                "Alternate Treatment"
            },
        "Group Criteria":{
                "Group Criteria"
            }
    }

define "PriorAuthorization":
	true

define "PriorAuthorizationRequirements":
   {
        "Codes":"Code Requirements",
        "DocumentsFromFHIR": {
                "WOPD",
	            "Medical Record",
                "BeneficiaryInformation",
                "Supplier Information",
                "RequestorInformation",
                "OtherInformation"
            },
	    "InfoFromForm": {
                "DocumentsInForm1",
                "DocumentsInForm2"
	    },
        "DocumentsToAttach":{
			    "Documents"
		}
    }