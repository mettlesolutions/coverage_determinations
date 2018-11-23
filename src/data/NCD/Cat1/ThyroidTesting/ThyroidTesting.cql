//Thyroid Testing
library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
valueset "Thyroid function tests normal (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Thyroid function tests abnormal (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Euthyroid (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
//Hypofunction
valueset "Hypothyroidism (disorder)": '2.16.840.1.113762.1.4.1018.240'
valueset "Secondary hypothyroidism (disorder)": '2.16.840.1.113762.1.4.1018.24'
valueset "Goiter due to thyroiditis (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
//primary hypothyroidism
valueset "Iodine hypothyroidism (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Thyroid stimulating hormone measurement (procedure)": '2.16.840.1.113762.1.4.1018.240'
valueset "Thyroid nodule (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
//thyroid carcinoma
valueset "Drug therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Hyperthyroidism (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Malignant neoplasm of thyroid gland": '2.16.840.1.113883.3.464.1003.108.12.1011'
valueset "Neoplasm of uncertain behavior of other and unspecified endocrine glands": '2.16.840.1.113883.3.3157.1404'
//Metabolic disorder
valueset "Metabolic disease (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Malnutrition (calorie) (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hyperlipidemia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Anemia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Psychotic disorder (disorder)": '2.16.840.1.113883.3.2074.1.1.30'
//non-psychotic disorder
//ophthalmologic disorders
valueset "Depressive disorder, not elsewhere classified" : '2.16.840.1.113883.3.600.145'
valueset "Cardiac arrhythmia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Disorder of menstruation (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Poor skin condition (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Myalgia (SNOMED)": '2.16.840.1.113762.1.4.1146.688'
valueset "Disturbance of consciousness (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Malaise (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hypothermia (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Nervous system symptoms (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Skin symptom (finding)" :'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Psychosomatic musculoskeletal symptoms (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
//integumentary system
//nutrition and metabolism
valueset "Cardiovascular symptoms (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Gastrointestinal symptom (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Personal history finding (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
//longterm thyriod drug threapy
valueset "Refer for thyroid test (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Malignant neoplasm of endocrine gland (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Disease (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Procedure on integumentary system (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Cardiovascular system problem (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "History of malignant neoplasm of endocrine gland (situation)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Depressive disorder (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Iron deficiency anemia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Megaloblastic anemia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Aplastic anemia due to chronic disease (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hemolytic anemia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Goiter (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Patient's condition stable (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'



define "Thyroid Function Tests":
           (exists (["Diagnosis": "Euthyroid (finding)"])
           or(exists (["Diagnosis": "Hypothyroidism (disorder)"]))
           or (exists (["Diagnosis":"Goiter due to thyroiditis (disorder)"]))
           or (exists (["Diagnosis" :"Thyroid nodule (disorder)"]))
           or (exists (["Diagnosis": "Secondary hypothyroidism (disorder)"]))
           or (exists (["Diagnosis": "Goiter due to thyroiditis (disorder)"]))
           or (exists (["Diagnosis": "Thyroid nodule (disorder)"]))
           or (exists (["Diagnosis":  "Iodine hypothyroidism (disorder)"] union ["Procedure, Performed": "Drug therapy (procedure)"]))
           or (exists (["Diagnosis": "Hyperthyroidism (disorder)"]))
           )
           
define "Condition 1(Indications)":
          (exists (["Diagnosis": "Disease (disorder)"])
          or (exists (["Diagnosis": "Malignant neoplasm of thyroid gland"] union ["Diagnosis": "Neoplasm of uncertain behavior of other and unspecified endocrine glands"]))
 	  and (exists (["Procedure, Performed" :  "Thyroid function tests normal (finding)"]))
 	  )
 	  
define "Condition 2(Indications)":
            (exists (["Diagnosis": "Metabolic disease (disorder)"])
            or (exists (["Diagnosis": "Malnutrition (calorie) (disorder)"]))
            or (exists (["Diagnosis": "Hyperlipidemia (disorder)"]))
            or (exists (["Diagnosis" :"Anemia (disorder)"]))
            or (exists (["Diagnosis": "Psychotic disorder (disorder)"]))
            or (exists (["Diagnosis": "Depressive disorder, not elsewhere classified"]))
            or (exists (["Diagnosis": "Cardiac arrhythmia (disorder)"]))
            or (exists (["Diagnosis": "Disorder of menstruation (disorder)"]))
            or (exists (["Diagnosis": "Poor skin condition (finding)"]))
            or (exists (["Diagnosis": "Myalgia (SNOMED)"]))
            or (exists (["Diagnosis": "Disturbance of consciousness (finding)"]))
            or (exists (["Diagnosis": "Malaise (finding)"]))
            or (exists (["Diagnosis": "Hypothermia (finding)"]))
            or (exists (["Symptom" : "Nervous system symptoms (finding)"]))
            or (exists (["Symptom" :"Skin symptom (finding)"]))
            or (exists (["Symptom" : "Psychosomatic musculoskeletal symptoms (finding)" ]))
            or (exists (["Symptom" :  "Cardiovascular symptoms (finding)"])) 
            or (exists (["Symptom" :  "Gastrointestinal symptom (finding)"]))
            or (exists (["Diagnosis": "History of malignant neoplasm of endocrine gland (situation)"]))
            and (exists (["Procedure, Performed" :  "Thyroid function tests normal (finding)"]))
            )
            
            
define "Indications": 
           "Thyroid Function Tests" or "Condition 1(Indications)" or "Condition 2(Indications)"
           
define "Limitation 1": 
           (exists (["Diagnosis": "Patient's condition stable (finding)"])
           and (exists (["Procedure, Performed": "Thyroid stimulating hormone measurement (procedure)"] T
           where T.components = 2))  
           )
                
define "Coverage":
		"Indications" and "Limitation 1"
