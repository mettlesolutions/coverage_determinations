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
valueset "Prostate Cancer": '2.16.840.1.113883.3.526.2.92'
valueset "Bladder outlet obstruction (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Malignant neoplasm of bone (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Active surveillance of prostate cancer (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Allergic reaction management (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Anaphylaxis care (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Patient has metastatic disease at diagnosis": '2.16.840.1.113762.1.4.1116.396'
valueset "Physician visit with evaluation AND/OR management service (procedure)": '2.16.840.1.113883.3.88.12.80.28'
context Patient

define "Covered":
      ["Diagnosis": "Prostate Cancer"] union not ["Procedure, Performed": "GnRH Agonist"]
      or ["Diagnosis": "Prostate Cancer"] union not ["Procedure, Performed": "Bilateral orchidectomy (procedure)"]
      //risk of neurological compromise due to metastases
      or ["Diagnosis": "Prostate Cancer"] union ["Diagnosis": "Bladder outlet obstruction (disorder)"] union ["Diagnosis": "Patient has metastatic disease at diagnosis"]
      or ["Diagnosis": "Prostate Cancer"] union ["Diagnosis": "Malignant neoplasm of bone (disorder)"]
      and ["Procedure, Performed": "abarelix"]
define "Physicians":
        ["Diagnosis": "Physician visit with evaluation AND/OR management service (procedure)"]
        or ["Diagnosis": "Prostate Cancer"] and ["Procedure, Performed": "Active surveillance of prostate cancer (regime/therapy)"]
        union ["Diagnosis": "Allergic reaction (disorder)"] and ["Procedure, Performed": "Allergic reaction management (regime/therapy)"]
        union ["Diagnosis": "Anaphylaxis"] and ["Procedure, Performed": "Anaphylaxis care (regime/therapy)"]
        union ["Medication, Administered": "abarelix"]abarelix
        where abarelix.Relevant Period = '30 min'
        union ["Provider Care Experience": "Palliative care education (procedure)"]
        union ["Communication: From Provider to Patient"]knowledge
        where knowledge.relatedTo = 'Palliative care education (procedure)'
        //Report serious adverse events as soon as possible to the manufacturer and/or the FDA.
define "Not Covered":
        not "Physicians" and not "Covered"
define "Coverage":
        "Covered" and "Physicians" and not "Not Covered"        
        

