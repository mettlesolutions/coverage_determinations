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

define "Indications":
    {
      "rule":'The treating physician examined the patient and determined that he or she has either a severe lung disease (some examples: chronic obstructive pulmonary disease, diffuse interstitial lung disease, cystic fibrosis, bronchiectasis, and widespread pulmonary neoplasm) or has Hypoxia-related symptoms or findings (some examples: pulmonary hypertension, recurring congestive heart failure due to cor pulmonale, erythrocytosis, impairment of cognitive process, nocturnal restlessness, and morning headache)',
      "type":'FHIR',
      "fhir_data":{'or',
                      {'or',
                         {
                            "Condition":{
                               "code":"Chronic obstructive pulmonary disease, unspecified"
                            }
                         },
                         {
                            "Condition":{
                               "code":"Interstitial pulmonary disease, unspecified"
                            }
                         },
                         {
                            "Condition":{
                               "code":"Cystic fibrosis with pulmonary manifestations"
                            }
                         },
                         {
                            "Condition":{
                               "code":"Bronchiectasis, uncomplicated"
                            }
                         },
                         {
                            "Condition":{
                               "code":"Malignant neoplasm of unspecified part of unspecified bronchus or lung"
                            }
                         }
                      },
                      {'or',
                         {
                            "Condition":{
                               "code":"Hypoxemia"
                            }
                         },
                         {
                            "Condition":{
                               "code":"Primary pulmonary hypertension"
                            }
                         },
                         {
                            "Condition":{
                               "code":"Secondary polycythemia"
                            }
                         },
                         {
                            "Condition":{
                               "code":"Mild cognitive impairment, so stated"
                            }
                         },
                         {
                            "Observation":{
                               "code":"Restlessness and agitation"
                            }
                         },
                         {
                            "Condition":{
                               "code":"Chronic tension-type headache, intractable"
                            }
                         }
                      }
           }
   }

define "Qualifying Blood gas study":
    {
      "rule":'The treating physician or a qualified provider or supplier of laboratory services conducted the qualifying blood gas study',
      "type":'FHIR',
      "fhir_data":{
         {
            "DiagnosticReport":{
               "code":"Arterial Blood Gas With Oxyhemoglobin",
               "performer":'The treating physician or a qualified provider or supplier of laboratory services'
            }
         }
      }
   }

define "Qualifying Blood gas study Conditions":
    {
      "rule":'The qualifying blood gas study value was obtained either during an inpatient hospital stay – Closest to, but no earlier than, 2 days prior to the hospital discharge date, with home oxygen therapy beginning immediately following discharge or during an outpatient encounter – Within 30 days of the date of Initial Certification while the patient is in a chronic stable state, which is when the patient is not in a period of acute illness or an exacerbation of his or her underlying disease',
      "type":'FHIR',
      "fhir_data":{'or',
                      {'and',
                         {
                            "DiagnosticReport":{
                               "code":"Arterial Blood Gas With Oxyhemoglobin",
                               "encounter":{
                                    "type":'Inpatient stay'
                               },
                               "effective":'2 days prior to the hospital discharge date'
                            }
                         },
                         {
                            "Procedure": {
                                "code": "Home oxygen therapy (procedure)",
                                "performed":'Immediately following discharge'
                            }
                         }
                      },
                     {'and',
                         {
                            "DiagnosticReport":{
                               "code":"Arterial Blood Gas With Oxyhemoglobin",
                               "encounter":{
                                    "type":'Outpatient Encounter'
                               },
                               "effective":'Within 30 days of the date of Initial Certification'
                            }
                         },
                         {
                            "Observation":{
                               "code":'Patient is in a chronic stable state'
                            }
                         }
                     }
            }
    }

define "Alternative therapy":
    {
      "rule":'The treating physician tried or considered alternative treatments and they were deemed clinically ineffective',
      "type":'FHIR',
      "fhir_data":{
         {
            "Procedure":{
               "code":'Alternative therapy undertaken',
               "performer":{
                    "actor": 'The treating physician'
               },
               "outcome":'Unsuccessful'
            }
         }
      }
   }

define "Group Criteria":
    {
      "rule":'Patient on room air while at rest (awake) when tested:Arterial oxygen saturation is at or below 88 percent or Arterial Partial Pressure of Oxygen (PO2) is at or below 55 mm Hg. Patient tested during exercise and, if during the day while at rest, arterial PO2 is at or above 56 mm Hg or an arterial oxygen saturation is at or above 89 percent: Arterial PO2 is at or below 55 mm Hg or an arterial oxygen saturation is at or below 88 percent and Documented improvement of hypoxemia during exercise with oxygen. Patient tested during sleep and if arterial PO2 is at or above 56 mm Hg or an arterial oxygen saturation is at or above 89 percent while awake, additional testing must show: Arterial PO2 is at or below 55 mm Hg or an arterial oxygen saturation is at or below 88 percent for at least 5 minutes taken during sleep or Decrease in arterial PO2 of more than 10 mm Hg or a decrease in arterial oxygen saturation more than 5 percent for at least 5 minutes associated with symptoms or signs more than 5 percent from baseline saturation for at least 5 minutes taken during sleep associated with symptoms or signs reasonably attributable to hypoxemia (some examples of symptoms are impairment of cognitive processes and nocturnal restlessness or insomnia and some examples of signs are cor pulmonale, “P” pulmonale on electrocardiogram [EKG], documented pulmonary hypertension, and erythrocytosis reasonably attributable to hypoxemia) or Initial coverage of Group I home oxygen therapy is limited to 12 months or the treating physician-specified length of need for oxygen, whichever is shorter. (or) Patient on room air at rest while awake when tested: Arterial oxygen saturation of 89 percent at rest (awake) or Arterial PO2 of 56–59 mm Hg and Dependent edema suggesting congestive heart failure or Pulmonary hypertension or cor pulmonale, determined by measurement of pulmonary artery pressure, gated blood pool scan, echocardiogram, or “P” pulmonale on EKG (P wave greater than 3 mm in standard leads II, III, or AVF) or Erythrocythemia with a hematocrit greater than 56 percent or Patient tested during exercise: Arterial oxygen saturation of 89 percent or Arterial PO2 of 56–59 mm Hg and Dependent edema suggesting congestive heart failure and Pulmonary hypertension or cor pulmonale, determined by measurement of pulmonary artery pressure, gated blood pool scan, echocardiogram, or “P” pulmonale on EKG (P wave greater than 3 mm in standard leads II, III, or AVF) or Erythrocythemia with a hematocrit greater than 56 percent or Patient tested during sleep for at least 5 minutes: Arterial oxygen saturation of 89 percent or Arterial PO2 of 56–59 mm Hg and Dependent edema suggesting congestive heart failure and Pulmonary hypertension or cor pulmonale, determined by measurement of pulmonary artery pressure, gated blood pool scan, echocardiogram, or “P” pulmonale on EKG (P wave greater than 3 mm in standard leads II, III, or AVF) or and Erythrocythemia with a hematocrit greater than 56 percent or (or) Arterial oxygen saturation at or above 90 percent or Arterial PO2 at or above 60 mm Hg',
      "type":'FHIR',
      "fhir_data":{'or',
                        {'and',{'and',{
                                        "Observation":{
                                           "code":'Resting state'
                                        }
                                     },
                                     {'or',{
                                            "Procedure":{
                                               "code":"Gases, blood, O2 saturation only, by direct measurement, except pulse oximetry"
                                            }
                                         },
                                         {
                                            "Procedure":{
                                               "code":"Gases, blood, any combination of pH, pCO2, pO2, CO2, HCO3 (including calculated O2 saturation)"
                                            }
                                         }
                                     }
                               },
                               {'and',{
                                        "Observation":{
                                           "code": 'During Exercise'
                                        }
                                     },
                                     {'or',{
                                            "Procedure":{
                                               "code":"Gases, blood, O2 saturation only, by direct measurement, except pulse oximetry"
                                            }
                                         },
                                         {
                                            "Procedure":{
                                               "code":"Gases, blood, any combination of pH, pCO2, pO2, CO2, HCO3 (including calculated O2 saturation)"
                                            }
                                         }
                                     }
                               },
                               {'and',{
                                        "Observation":{
                                           "code": 'During Sleep'
                                        }
                                     },
                                     {'or',{
                                            "Procedure":{
                                               "code":"Gases, blood, O2 saturation only, by direct measurement, except pulse oximetry"
                                            }
                                         },
                                         {
                                            "Procedure":{
                                               "code":"Gases, blood, any combination of pH, pCO2, pO2, CO2, HCO3 (including calculated O2 saturation)"
                                            }
                                         }
                                     },
                                     {'or',{
                                            "Condition":{
                                               "code":"Primary pulmonary hypertension"
                                            }
                                         },
                                         {
                                            "Condition":{
                                               "code":"Secondary polycythemia"
                                            }
                                         },
                                         {
                                            "Condition":{
                                               "code":"Mild cognitive impairment, so stated"
                                            }
                                         },
                                         {
                                            "Condition":{
                                               "code":"Insomnia, unspecified"
                                            }
                                         },
                                         {
                                            "Condition":{
                                               "code":"Cor pulmonale (chronic)"
                                            }
                                         }
                                     }
                               }
                        },
                        {'and',
                            {'and',{'and',{
                                            "Observation":{
                                               "code":'Resting state'
                                            }
                                         },
                                         {'or',{
                                                "Procedure":{
                                                   "code":"Gases, blood, O2 saturation only, by direct measurement, except pulse oximetry"
                                                }
                                             },
                                             {
                                                "Procedure":{
                                                   "code":"Gases, blood, any combination of pH, pCO2, pO2, CO2, HCO3 (including calculated O2 saturation)"
                                                }
                                             }
                                         }
                                   },
                                   {'and',{
                                            "Observation":{
                                               "code": 'During Exercise'
                                            }
                                         },
                                         {'or',{
                                                "Procedure":{
                                                   "code":"Gases, blood, O2 saturation only, by direct measurement, except pulse oximetry"
                                                }
                                             },
                                             {
                                                "Procedure":{
                                                   "code":"Gases, blood, any combination of pH, pCO2, pO2, CO2, HCO3 (including calculated O2 saturation)"
                                                }
                                             }
                                         }
                                   },
                                   {'and',{
                                            "Observation":{
                                               "code":'During Sleep'
                                            }
                                         },
                                         {'or',{
                                                "Procedure":{
                                                   "code":"Gases, blood, O2 saturation only, by direct measurement, except pulse oximetry"
                                                }
                                             },
                                             {
                                                "Procedure":{
                                                   "code":"Gases, blood, any combination of pH, pCO2, pO2, CO2, HCO3 (including calculated O2 saturation)"
                                                }
                                             }
                                         }
                                   }
                            },
                             {'or',{
                                    "Condition":{
                                       "code":"Edema, unspecified"
                                    }
                                 },
                                 {
                                    "Condition":{
                                       "code":"Right heart failure, unspecified"
                                    }
                                 },
                                 {
                                    "Condition":{
                                       "code":"Primary pulmonary hypertension"
                                    }
                                 },
                                 {
                                    "Condition":{
                                       "code":"Secondary polycythemia"
                                    }
                                 }
                             },
                             {'or',
                                 {
                                    "Procedure":{
                                       "code":"Other Cardiovascular Procedures"
                                    }
                                 },
                                 {
                                    "Procedure":{
                                       "code":"Transthoracic echocardiography"
                                    }
                                 },
                                 {
                                    "Procedure":{
                                       "code":"Hematocrit"
                                    }
                                 }
                             }
                        },
                        {'or',{
                                "Procedure":{
                                   "code":"Gases, blood, O2 saturation only, by direct measurement, except pulse oximetry"
                                }
                             },
                             {
                                "Procedure":{
                                   "code":"Gases, blood, any combination of pH, pCO2, pO2, CO2, HCO3 (including calculated O2 saturation)"
                                }
                             }
                        }
          }
    }

define "Code Requirements":
    {
        "Indications",
        "Qualifying Blood gas study",
        "Qualifying Blood gas study Conditions",
        "Alternative therapy",
        "Group Criteria"
    }

define "PA Requirements- Submitter":
    {
      "rule":'Submitters should include the Prior Authorization package data elements',
      "type":'FHIR',
      "fhir_data":{
         {
            "Patient":{
               "name":'Beneficiary Name',
               "identifier":'Beneficiary Medicare Number',
               "birthDate":'Beneficiary Date of Birth',
               "gender":'Beneficiary Gender',
               "address":'Beneficiary Address',
               "managingOrganization":'Place of Service'
            }
         },
         {
            "Claim":{
               "enterer":{
                  "name":'Contact Name',
                  "telecom":'Telephone Number',
                  "address":'Address'
               }
            }
         },
         {
            "Claim":{
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
      }
   }


define "WOPD Details Required":
 	{
      "rule":'Written Order (Prescription) Prior to Delivery (WOPD) under the Treating Physician Responsibilities must include the Patient name, Physician or Practitioner Name, Practitioner National Provider Identifier (NPI), Description of the item ordered, Pertinent diagnoses/conditions that relate to the need for the item ordered, an indication if the request is an initial or resubmission review, an indicataion if the request is expedited and the reason why, Supplier National Supplier Clearinghouse (NSC) Number and the Physician signature along with the date of the Physician signature',
      "type":'FHIR',
      "fhir_data":{
             {
                "Claim":{
                   "patient":{
                      "name":'Patient name'
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
                      }
                   },
                   "diagnosis":{
                      "diagnosis":{
                         "diagnosisReference":'Pertinent diagnoses/conditions that relate to the need for the item ordered'
                      }
                   }
                },
                "Bundle":{
                   "signature":{
                      "who":'Practitioner',
                      "when":'Date of Practitioner signature'
                   }
                }
             },
             {
                "FormRequest":{
                   "checkbox":'Indicate if the request is an initial or resubmission review',
                   "text":'Indicate if the request is expedited and the reason why',
                   "number":'Supplier National Supplier Clearinghouse (NSC) Number'
                }
             }
          }
    }


define "EncounterConduct":
    {
      "rule":'The face-to-face examination with the patient should be performed by the Physician or Nurse Practitioner (NP) or Clinical Nurse Specialist (CNS) or Physician Assistant (PA)',
      "type":'FHIR',
      "fhir_data":{'and',
                        {'or',
                            {
                            "Encounter":{
                               "type":"Prolonged Services With Direct Face-to-Face Patient Contact 99354"
                                }
                             },
                             {
                                "Encounter":{
                                   "type":"Prolonged Services With Direct Face-to-Face Patient Contact 99355"
                                }
                             },
                             {
                                "Encounter":{
                                   "type":"Prolonged Services With Direct Face-to-Face Patient Contact 99356"
                                }
                             },
                             {
                                "Encounter":{
                                   "type":"Prolonged Services With Direct Face-to-Face Patient Contact 99357"
                                }
                             }
                        },
                        {'or',
                            {
                            "Encounter":{
                               "participant":'Physician'
                                }
                             },
                             {
                                "Encounter":{
                                   "participant":'Nurse Practitioner (NP)'
                                }
                             },
                             {
                                "Encounter":{
                                   "participant":'Clinical Nurse Specialist (CNS)'
                                }
                             },
                             {
                                "Encounter":{
                                   "participant": 'Physician Assistant (PA)'
                                }
                             }
                        }
                    }
    }

define "Medical Record":
 	{"rule":'The medical record of the patient should include the Primary diagnosis, Duration of condition, Clinical course (worsening or improving),Prognosis, if portable oxygen is needed, an indication that he or she is mobile within the home, Results of the blood gas study,Nature and extent of functional limitations,Past experience with related items, Other therapeutic interventions and results and Other pertinent information',
    "type":'FHIR',
    "fhir_data":{
         {
            "Condition":{
               "code":"Primary diagnosis",
               "onset":{
                  "onsetPeriod":'Onset Period'
               },
               "abatement":{
                  "abatementPeriod":'Abatement Period'
               },
               "clinicalStatus":'Clinical course (worsening or improving)',
               "stage":{
                  "assessment":{
                     "code":'Arterial Blood Gas With Oxyhemoglobin',
                     "conclusion":'Results of the blood gas study',
                     "focus":'Nature and extent of functional limitations',
                     "device":{
                        "note":'Past experience with related items'
                     },
                     "note":'Other therapeutic interventions and results'
                  }
               },
               "note":'Other pertinent information'
            }
         },
         {
            "FormRequest":{
               "checkbox":'if portable oxygen is needed or not',
               "text":'If portable oxygen is needed, an indication that he or she is mobile within the home',
               "text-type":'Prognosis'
            }
         }
      }
   }



define "WOPD":
	{
        "Encounter" :"EncounterConduct",
        "WOPD Document": "WOPD Details Required"
	}



define "CMN Document- Physician":
 	{
      "rule":'CERTIFICATE OF MEDICAL NECESSITY(CMN) for Oxygen.The physician must fill in Section B and D of the CMN',
      "type":'FHIR',
      "fhir_data":{
         {
            "Bundle":{
               "signature":{
                  "who":'Practitioner',
                  "when":'Date of Practitioner signature'
               }
            }
         },
         {
            "Claim":{
               "diagnosis":{
                  "diagnosis":{
                     "diagnosisCodeableConcept":'DIAGNOSIS CODES'
                  }
               },
               "prescription":{
                  "occurrence":{
                     "occurrencePeriod":'Estimated Length of need'
                  }
               }
            }
         },
         {
            "FormRequest":{
               "text":'Enter the result of arterial blood gas PO2 in mm Hg',
               "text":'Enter the result of oxygen saturation test in %',
               "date":'Date of test',
               "checkbox":'Was the test performed with the patient in a chronic stable state as an outpatient?',
               "checkbox":'Was the test performed within two days prior to discharge from an inpatient facility to home?',
               "checkbox":'Was the test performed under other circumstances?',
               "checkbox":'The condition of the test: At Rest, During Exercise, During Sleep',
               "checkbox":'If you are ordering portable oxygen,is the patient mobile within home?',
               "text":'Enter the highest oxygen flow rate ordered for this patient in liters per minute,If less than 1 LPM enter a X',
               "text":'If greater than 4 LPM is prescribed, enter results of recent arterial blood gas PO2 test in mm Hg with patient in a chronic stable state',
               "text":'If greater than 4 LPM is prescribed, enter results of recent Enter the result of oxygen saturation test in % with patient in a chronic stable state',
               "date":'If greater than 4 LPM is prescribed, enter date of test with patient in a chronic stable state',
               "boolean":'Does the patient have dependent edema due to congestive heart failure?',
               "boolean":'Does the patient have cor pulmonale or pulmonary hypertension documented by P pulmonale on an EKG or by an echocardiogram, gated blood pool scan or direct pulmonary artery pressure measurement?',
               "boolean":'Does the patient have a hematocrit greater than 56%?'
            }
         }
      }
   }

define "CMN Document- Supplier":
    {
      "rule":'CERTIFICATE OF MEDICAL NECESSITY(CMN) for Oxygen.The supplier completes Sections A and C of the CMN for Oxygen. You should include this information in these sections.',
      "type":'Supplier',
      "fhir_data":{
         {
            "Patient":{
               "name":'Patient name',
               "address":'Patient address',
               "telecom":'Patient phone',
               "identifier":'Patient identifier',
               "birthDate":'Patient Date of Birth',
               "gender":'Patient Gender'
            }
         },
         {
            "Observation":{
               "category":{
                  "vital-signs":'Patient Height and Weight'
               }
            }
         },
         {
            "SupplyRequest":{
               "supplier":{
                  "name":'Supplier Name',
                  "identifier":'Supplier National Provider Identification',
                  "address":'Supplier Address',
                  "telecom":'Supplier Phone Number'
               },
               "item":{
                  "itemCodeableConcept":'Supply Item/Service Procedure Code'
               }
            }
         },
         {
            "Practitioner":{
               "name":'Physician Name',
               "identifier":'Physician National Provider Identifier (NPI)',
               "address":'Physician Address',
               "telecom":'Physician phone'
            }
         },
         {
            "Organisation":{
               "name":'Facility Name',
               "address":'Facility Address'
            }
         },
         {
            "Form Request":{
               "text":'Narrative description of all items, accessories and option ordered',
               "text":'Suppliers charge',
               "text":'The Medicare fee schedule allowance for each item(s),options,accessories,supplies and drugs,if applicable'
            }
         }
      }
   }

define "PA Requirements- Supplier":
    {
      "rule":'The Supplier Responsibilities must be the possession of the documentation of the Written Order (Prescription) Prior to Delivery (WOPD) and the face-to-face examination',
      "type":'Supplier',
      "fhir_data":{
         {
            "Claim":{
               "patient":{
                  "name":'Patient name'
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
                  "udi":'Durable medical equipment code'
               },
               "diagnosis":{
                  "diagnosis":{
                     "diagnosisReference":'Pertinent diagnoses/conditions that relate to the need for the item ordered'
                  }
               }
            },
            "Bundle":{
               "signature":{
                  "who":'Practitioner',
                  "when":'Date of Practitioner signature'
               }
            }
         },
         {
            "FormRequest":{
               "checkbox":'Indicate if the request is an initial or resubmission review',
               "text":'Indicate if the request is expedited and the reason why',
               "number":'Supplier National Supplier Clearinghouse (NSC) Number'
            }
         },
         {
            "DocumentReference":{
               "date":'Date of receipt',
               "context":{
                  "encounter":{
                     "type":'Face-to-face examination'
                  }
               }
            }
         }
      }
   }

define "Supplier Maintained Documents":
    {
      "rule":'The Supplier must ensure the maintainance of the WOPD or CMN for Oxygen in the medical record',
      "type":'Supplier Attachable Documents',
      "fhir_data":{
         {
            "WOPD":'Written Order (Prescription) Prior to Delivery (WOPD)'
         },
         {
            "CMN":'CERTIFICATE OF MEDICAL NECESSITY(CMN) for Oxygen'
         }
      }
   }


define "PriorAuthorization":
	true
