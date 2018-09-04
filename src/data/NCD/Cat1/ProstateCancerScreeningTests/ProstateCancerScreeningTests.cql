library ChlamydiaScreening_Common version '2'

using QDM version '5.3'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
valueset "Patient advised about prostate cancer screening (situation)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Digital examination of rectum (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Prostate-specific antigen monitoring (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Clinical examination education (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Prostate nodule (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Prostate specific antigen abnormal (finding)": '2.16.840.1.113762.1.4.1018.240'
valueset "Osteopathy (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Referral to physician assistant (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Referral to nurse practitioner (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Referral to clinical nurse specialist (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Referral to nurse midwife (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Adenocarcinoma of prostate (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Immunocytochemical procedure (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Physician service (procedure)": '2.16.840.1.113883.3.88.12.80.28'
codesystem "ICD10CM": '2.16.840.1.113883.6.90'
valueset "Prostate Cancer": '2.16.840.1.113762.1.4.1116.306'
//valueset "Prostate-Specific Antigen [Chemical/Ingredient]": '2.16.840.1.113762.1.4.1010.1'
valueset "Primary malignant neoplasm of prostate (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
//Metastatic adenocarcinoma
