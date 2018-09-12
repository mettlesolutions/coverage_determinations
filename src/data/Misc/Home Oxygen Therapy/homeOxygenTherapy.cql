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
valueset "Hospital admission (procedure)": '2.16.840.1.113883.17.4077.3.2001'
