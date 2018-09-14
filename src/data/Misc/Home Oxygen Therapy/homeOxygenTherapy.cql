//Abarelix for the Treatment of Prostate Cancer
library ChlamydiaScreening_Common version '2'

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
//Chronic Stable State
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
