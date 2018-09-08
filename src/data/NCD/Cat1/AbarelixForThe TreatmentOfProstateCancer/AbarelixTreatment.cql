//Abarelix for the Treatment of Prostate Cancer
library ChlamydiaScreening_Common version '2'

using QDM version '5.3'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)


codesystem "RXNORM": '2.16.840.1.113883.6.88'
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
valueset "abarelix": '2.16.840.1.113762.1.4.1010.1'
valueset "GnRH Agonist": '2.16.840.1.113762.1.4.1116.346'
//valueset "Opioid Medications": '2.16.840.1.113883.3.3157.1004.26'
valueset "Carcinoma of prostate (disorder)": '2.16.840.1.113883.3.464.1003.108.12.1011'
valueset "Palliative care (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Neurological finding (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
//Metastases
valueset "Extrinsic ureteral obstruction (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Carcinoma, metastatic (morphologic abnormality)": '2.16.840.1.113883.3.88.12.3221.8.9'
valueset "Secondary malignant neoplastic disease (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Anaphylaxis": '2.16.840.1.113762.1.4.1045.91'
valueset "Allergic reaction (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Bilateral orchidectomy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Opioids": '2.16.840.1.113762.1.4.1116.449'
valueset "Prostate cancer care review (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Palliative care education (procedure)": '2.16.840.1.113883.11.20.9.34'
define "Covered":
        ["Diagnosis": "GnRH Agonist"]
        or ["Diagnosis": "Bilateral orchidectomy (procedure)"]
        or ["Diagnosis": "Extrinsic ureteral obstruction (disorder)"]
        or ["Diagnosis":"Carcinoma, metastatic (morphologic abnormality)"]
        //skeletal metastases
        or ["Diagnosis": "Opioids"]
        and ["Procedure, Performed": "abarelix"]
define "Physicians":
        ["Diagnosis": "Prostate cancer care review (procedure)"]
        and ["Diagnosis": "Allergic reaction (disorder)"]
        and ["Diagnosis": "Anaphylaxis"]
        and ["Medication, Administered": "abarelix"]abarelix
        where abarelix.Relevant Period = '30'
        and ["Diagnosis": "Palliative care (regime/therapy)"]
        and ["Diagnosis":"Palliative care education (procedure)"]
define "Not Covered":
        "Physicians" and not "Covered"
define "Coverage":
        "Covered" and "Physicians" and not "Not Covered"        
        

