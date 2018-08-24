library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Thyroid function tests normal (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Thyroid function tests abnormal (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Euthyroid (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
//Hypofunction
valueset "Hypothyroidism (disorder)": '2.16.840.1.113762.1.4.1018.240'
valueset "Secondary hypothyroidism (disorder)": '2.16.840.1.113762.1.4.1018.240'
//valueset "Congenital hypothyroidism (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
//primary hypothyroidism
valueset "Thyroid stimulating hormone measurement (procedure)": '2.16.840.1.113762.1.4.1018.240'
valueset "Thyroid nodule (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
//thyroid carcinoma
valueset "Drug therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Hyperthyroidism (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Malignant neoplasm of thyroid gland": '2.16.840.1.113883.3.464.1003.108.12.1011'
valueset "Neoplasm of uncertain behavior of other and unspecified endocrine glands": '2.16.840.1.113883.3.3157.1404'
//Metabolic disorder
valueset "Malnutrition (calorie) (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hyperlipidemia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Anemia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Psychotic disorder (disorder)": '2.16.840.1.113883.3.2074.1.1.30'
//valueset "Acute non-psychotic brain syndrome (disorder)": '2.16.840.1.113883.3.117.1.7.1.299'
//non-psychotic disorder
//ophthalmologic disorders
valueset "Cardiac arrhythmia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Disorder of menstruation (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Poor skin condition (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Myalgia (SNOMED)": '2.16.840.1.113762.1.4.1146.688'
valueset "Disturbance of consciousness (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Malaise (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hypothermia (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Musculoskeletal system implantation (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Refer for thyroid test (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Malignant neoplasm of endocrine gland (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
