library ChlamydiaScreening_Common version '2'

using QDM version '5.3'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "LOINC": '2.16.840.1.113883.6.1'
codesystem "RXNORM": '2.16.840.1.113883.6.88'
codesystem "ICD10CM": '2.16.840.1.113883.6.90'
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
codesystem "ICD9CM": '2.16.840.1.113883.6.103'
valueset "Partial Thromboplastin Time": '2.16.840.1.113762.1.4.1045.25'
valueset "Unfractionated Heparin": '2.16.840.1.113883.3.117.1.7.1.218'
valueset "Prothrombin Time": '2.16.840.1.113883.17.4077.3.1006'
valueset "Anticoagulant Therapy": '2.16.840.1.113883.3.117.1.7.1.200'
valueset "Heparin therapy (procedure)": '2.16.840.1.113883.3.88.12.80.2'
valueset "Warfarin therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Hematoma of skin (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Petechiae (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Disseminated intravascular coagulation (disorder)": '2.16.840.1.113883.17.4077.3.1002'
valueset "Bleeding (finding)": '2.16.840.1.113762.1.4.1018.240'
valueset "Deep venous thrombosis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Intrinsic coagulation pathway finding (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Dysfibrinogenemia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Afibrinogenemia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Chronic Liver Disease": '2.16.840.1.113883.3.464.1003.199.11.1065'
valueset "Wilson's disease (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hemophilia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Blood coagulation disorder (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Lupus erythematosus (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Factor VIII inhibitor disorder (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Lupus anticoagulant disorder (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Sepsis": '2.16.840.1.113883.17.4077.2.2045'
valueset "Congenital von Willebrand's disease (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Von Willebrand's disease": '2.16.840.1.113883.17.4077.3.1002'
valueset "Venous thrombosis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Arterial thrombosis (disorder)": '2.16.840.1.113762.1.4.1018.240'
valueset "Hypercoagulability state (finding)": '2.16.840.1.113762.1.4.1018.240'
valueset "Kidney Failure": '2.16.840.1.113883.3.464.1003.109.12.1027'
//congenital coagulopathies
valueset "Coagulopathies": '2.16.840.1.113883.17.4077.2.1008'
valueset "Coagulation (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//Bleeding risk
valueset "Thrombocytopenia": '2.16.840.1.113762.1.4.1045.45'
//swollen extremity with or without prior trauma
valueset "Liver Disease": '2.16.840.1.113762.1.4.1047.42'
valueset "At risk of hemorrhage (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Chronic liver disease (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Liver Disease SNOMEDCT": '2.16.840.1.113762.1.4.1047.12'
//History of bleeding
//Family History of Heparin therapy
valueset "Poisoning caused by warfarin sodium (disorder)": '2.16.840.1.113883.17.4077.2.2078'
valueset "Drug dosage altered (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Thrombolytic therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'

