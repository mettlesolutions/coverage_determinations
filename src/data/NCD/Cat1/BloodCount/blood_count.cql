library ChlamydiaScreening_Common version '2'

using QDM version '5.3'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "ICD10CM": '2.16.840.1.113883.6.90'
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
codesystem "LOINC": '2.16.840.1.113883.6.1'
valueset "Bleeding (finding)":'2.16.840.1.113883.6.96'
valueset "Red blood cell count low (finding)": '2.16.840.1.113883.6.96'
valueset "Red blood cell disorder (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Adverse Clinical Reaction": '2.16.840.1.113883.3.2074.1.1.30'
valueset "Angina (disorder)":'2.16.840.1.113883.6.96'
valueset "Syncope (disorder)": '2.16.840.1.113883.6.96'
valueset "Lymphadenopathy (disorder)":'2.16.840.1.113883.6.96'
valueset "Tachycardia (finding)": '2.16.840.1.113883.6.96'
valueset "Dizziness (finding)": '2.16.840.1.113883.6.96'
valueset "Upper abdominal pain (finding)": '2.16.840.1.113883.6.96'
valueset "Jaundice":'2.16.840.1.113883.3.3157.1022'
valueset "Hematologic neoplasm (disorder)":'2.16.840.1.113883.6.96'
valueset "SNOMED CT CORE Problem List": '2.16.840.1.113762.1.4.1018.240'
valueset "Splenomegaly [Unspecified Cause] (SNOMED)": '	2.16.840.1.113762.1.4.1146.917'
valueset "Hepatomegaly [Unspecified Cause] (SNOMED)": '2.16.840.1.113762.1.4.1146.913'
valueset "Feces: fresh blood present (finding)": '2.16.840.1.113883.6.96'
valueset "Myelodysplastic syndrome, unspecified" : '2.16.840.1.113883.3.666.5.789'
valueset "Hematemesis (disorder)":'2.16.840.1.113883.17.4077.2.2066'
valueset "Headache (finding)" :'2.16.840.1.113883.3.2074.1.1.30'
valueset "Dyspnea (finding)":'2.16.840.1.113883.3.2074.1.1.30'
valueset "Fever (finding)" :'2.16.840.1.113883.3.2074.1.1.30'
valueset "Sweating symptom (finding)" : '2.16.840.1.113883.3.2074.1.1.30'
valueset "Myocardial infarction (disorder)": '2.16.840.1.113883.3.2074.1.1.30'
valueset "Arthralgia (SNOMED)": '2.16.840.1.113762.1.4.1146.672'
valueset "Tachypnea (finding)" : '2.16.840.1.113883.3.2074.1.1.30'
valueset "Coronary artery thrombosis (disorder)": '2.16.840.1.113883.3.526.3.369'
valueset "Deep venous thrombosis (disorder)": '2.16.840.1.113883.3.117.1.7.1.279'
valueset "Wheezing": '2.16.840.1.113762.1.4.1182.55'
valueset "Leukemia": '2.16.840.1.113762.1.4.1116.242'
valueset "Neoplasms": '2.16.840.1.113883.3.3157.1408'
valueset "Thromboembolism of vein (disorder)": '2.16.840.1.113883.3.117.1.7.1.279'
valueset "Cyanosis of skin (finding)":'2.16.840.1.113762.1.4.1181.17'
valueset "Sleep Apnea": '2.16.840.1.113762.1.4.1130.11'
valueset "Any infection": '2.16.840.1.113883.3.666.5.696'
valueset "Hospital Measures-Myelodysplasia": '2.16.840.1.113883.3.666.5.792'
valueset "Thalassemia-hemoglobin C disease (disorder)" : '2.16.840.1.113762.1.4.1029.35'
valueset "Hemoglobinopathy (disorder)": '2.16.840.1.113883.3.3157.1004.22'
valueset "Poisoning caused by anti-infective compound of lead (disorder)": '2.16.840.1.113762.1.4.1146.291'
valueset "Poisoning caused by arsenic or its compounds of undetermined intent (disorder)": '2.16.840.1.113883.17.4077.3.2055'
valueset "Spherocytosis (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Leukocytosis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Petechiae (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Purpura (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Pre-eclampsia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Recurrent gastrointestinal bleeding (disorder)": '2.16.840.1.113883.17.4077.2.2066'
valueset "Thrombosis (disorder)": '2.16.840.1.113883.3.2074.1.1.30'
valueset "Ecchymosis (finding)": '2.16.840.1.113883.3.2074.1.1.30'
valueset "Hypersplenism (disorder)": '2.16.840.1.113762.1.4.1018.240'
valueset "Myeloproliferative disorder (disorder)" :'2.16.840.1.113762.1.4.1018.240'
valueset "Myelodysplastic/myeloproliferative disease (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Lymphoproliferative disorder (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Toxicological Emergency" : '2.16.840.1.113883.17.4077.2.2078'
valueset "Alcohol intake above recommended sensible limits (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Inflammatory and autoimmune disorders": '2.16.840.1.113883.3.3157.1834'
valueset "Pregnancy": '2.16.840.1.113883.3.526.2.532'
valueset "Hemoglobin lab test" : '2.16.840.1.113762.1.4.1045.131'
valueset "Hematocrit lab test": '2.16.840.1.113762.1.4.1045.114'
valueset "End Stage Renal Disease": '2.16.840.1.113883.3.526.3.353'
valueset "Complete blood count (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "White blood cell disorder (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Neoplasm of bone marrow (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Bone marrow disorder (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Myelodysplastic syndrome (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Anemia (disorder)": '2.16.840.1.113762.1.4.1018.240'
valueset "Fatigue - symptom (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Weight loss (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Anemia due to blood loss (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hematuria": '2.16.840.1.113883.3.3157.1020'
valueset "hematochezia": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hematochezia (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Fecal Occult Blood Test (FOBT)": '2.16.840.1.113883.3.464.1003.198.12.1011'
valueset "Malnutrition (calorie) (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Vitamin deficiency (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Malabsorption syndrome (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Neuropathy (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Acquired coagulation disorder (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Postural dizziness (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Abdominal pain (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Heart murmur (finding)": '2.16.840.1.113762.1.4.1018.240'
valueset "Congestive heart failure (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Nailbed deformity (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Growth retardation (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Ulcer of lower extremity (disorder)": '2.16.840.1.113762.1.4.1018.240'
valueset "Cough (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "On examination - hands - finger clubbing (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Orthopnea (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Itching (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Excessive sweating (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Gastrointestinal hemorrhage (disorder)": '2.16.840.1.113883.17.4077.2.2066'
valueset "Paresthesia (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Epigastric pain (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Arterial thrombosis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Ischemic stroke (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Transient ischemic attack (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Congenital heart disease (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Chronic Obstructive Pulmonary Disease": '2.16.840.1.113883.3.464.1003.102.11.1019'
valueset "Renal failure syndrome (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Diastolic hypertension (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "White blood cell finding (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Malaise (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Shock (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Dysuria (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Swelling of skin (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Respiratory failure (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Diarrhea (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Vomiting (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Finding of platelet count (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Genitourinary tract hemorrhage (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Cardiopulmonary bypass operation (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Hemolytic uremic syndrome (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Thalassemia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Mucopolysaccharidosis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "May Hegglin syndrome (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Wiskott-Aldrich syndrome (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
define "Indications for CBC":
        ["Diagnosis": "Red blood cell disorder (disorder)"]
        and ["Diagnosis": "White blood cell disorder (disorder)"]
        and ["Diagnosis": "Neoplasm of bone marrow (disorder)"]
        and ["Diagnosis": "Prescription of therapeutic agent (procedure)"]
        and ["Diagnosis": "Pregnancy"]
        and ["Diagnosis": "Bone marrow disorder (disorder)"]
        //Bone marrow infiltration
        and ["Diagnosis": "Myeloproliferative disorder (disorder)"]
        and ["Diagnosis": "Myelodysplastic syndrome (disorder)"]
        and ["Diagnosis": "Lymphoproliferative disorder (disorder)"]
        //Immune Disorder
        and ["Assessment,Recommended": "Complete blood count (procedure)"]
        
define "Symptoms":
        ["Symptom": "Fatigue - symptom (finding)"]
        or ["Symptom": "Weight loss (finding)"]
        or ["Symptom": "Bleeding (finding)"]
        //acute injury associated with blood loss
        or ["Symptom": "Anemia due to blood loss (disorder)"]
        //Abnormal menstrual bleeding
        or ["Symptom": "Hematuria"]
        or ["Symptom": "Hematemesis (disorder)"]
        or ["Symptom": "Hematochezia (finding)"]
        or ["Symptom": "Fecal Occult Blood Test (FOBT)"]
        //or ["Symptom": "Malnutrition (calorie) (disorder)"]
        or ["Symptom": "Vitamin deficiency (disorder)"]
        or ["Symptom": "Malabsorption syndrome (disorder)"]
        or ["Symptom": "Neuropathy (disorder)"]
        or ["Symptom": "Acquired coagulation disorder (disorder)"]
        or ["Symptom": "Postural dizziness (finding)"]
        or ["Symptom": "Syncope (disorder)"]
        or ["Symptom": "Abdominal pain (finding)"]
        //Bowel Habits
        //chronic marrow hypoplasia
        or ["Symptom": "Tachycardia (finding)"]
        or ["Symptom": "Heart murmur (finding)"]
        or ["Symptom": "Congestive heart failure (disorder)"]
        or ["Symptom": "Dyspnea (finding)"]
        or ["Symptom": "Angina (disorder)"]
        or ["Symptom": "Nailbed deformity (disorder)"]
        or ["Symptom": "Growth retardation (disorder)"]
        or ["Symptom": "Jaundice"]
        or ["Symptom": "Hepatomegaly [Unspecified Cause] (SNOMED)"]
        or ["Symptom": "Splenomegaly [Unspecified Cause] (SNOMED)"]
        or ["Symptom": "Lymphadenopathy (disorder)"]
        or ["Symptom": "Ulcer of lower extremity (disorder)"]
        or ["Symptom": "Fever (finding)"]
        or ["Symptom": "Fever with chills (finding)"]
        //Ruddy skin
        or ["Smptom": "Cough (finding)"]
        or ["Symptom":"Wheezing"]
        or ["Symptom": "Cyanosis (finding)"]
        or ["Symptom": "On examination - hands - finger clubbing (disorder)"]
        or ["Symptom": "Orthopnea (finding)"]
        or ["Symptom": "Itching (finding)"]
        or ["Symptom": "Headache (finding)"]
        or ["Symptom": "Sleep Apnea"]
        or ["Symptom": "Dizziness (finding)"]
        or ["Symptom": "Excessive sweating (finding)"]
        or ["Symptom": "Visual symptoms (finding)"]
       // or ["Symptom": "Morbid Obesity"]
       or ["Symptom": "Gastrointestinal hemorrhage (disorder)"]
       or ["Symptom": "Paresthesia (finding)"]
       or ["Symptom": "Dyspnea (finding)"]
       or ["Symptom": "Epigastric pain (finding)"]
       or ["Symptom": "Arterial thrombosis (disorder)"]
       or ["Symptom": "Myocardial infarction (disorder)"]
       or ["Symptom": "Ischemic stroke (disorder)"]
       or ["Symptom": "Transient ischemic attack (disorder)"]
       or ["Symptom": "Congenital heart disease (disorder)"]
       or ["Symptom": "Chronic Obstructive Pulmonary Disease"]
       or ["Symptom": "Renal failure syndrome (disorder)"]
       or ["Symptom": "Diastolic hypertension (disorder)"]
       or ["Symptom": "Shock (disorder)"]
       or ["Symptom": "Malaise (finding)"]
       or ["Symptom": "Dysuria (finding)"]
       or ["Symptom": "Swelling of skin (finding)"]
       or ["Symptom": "Respiratory failure (disorder)"]
       or ["Symptom": "Diarrhea (finding)"]
       or ["Symptom": "Vomiting (disorder)"]
       or ["Symptom": "Genitourinary tract hemorrhage (disorder)"]
       //epistaxis
       or ["Symptom": "Thrombosis (disorder)"]
       or ["Symptom": "Ecchymosis (finding)"]
       or ["Symptom": "Purpura (finding)"]
       or ["Symptom": "Petechiae (finding)"]
       or ["Symptom": "Pre-eclampsia (disorder)"]
       or ["Symptom": "Platelet transfusion (procedure)"]
       or ["Symptom": "Cardiopulmonary bypass operation (procedure)"]
       or ["Symptom": "Hemolytic uremic syndrome (disorder)"]
       or ["Symptom": "Lymphoproliferative disorder (disorder)"]
       or ["Symptom": "Thalassemia (disorder)"]
       or ["Symptom": "Hemoglobinopathy (disorder)"]
       or ["Symptom": "Spherocytosis (finding)"]
       or ["Symptom": "Mucopolysaccharidosis (disorder)"]
       or ["Symptom": "Leukocytosis (disorder)"]
       or ["Symptom": "May Hegglin syndrome (disorder)"]
       or ["Symptom": "Wiskott-Aldrich syndrome (disorder)"]
define "CBC with anemia":
        ["Diagnosis": "Anemia (disorder)"]
        or ["Diagnosis": "Red blood cell disorder (disorder)"]
        or "Symptoms"
        
define "CBC with polycythemia":
        //polycythemia
        ["Diagnosis": "Red blood cell disorder (disorder)"]   
        or "Symptoms"
define "CBC related to WBC with leukemia":
        ["Diagnosis": "White blood cell finding (finding)"]
        and ["Diagnosis": "Leukemia"]
        or "Symptoms"
define "CBC related to platelet":
        ["Diagnosis":"	Finding of platelet count (finding)"]  
        or "Symptoms"      
                     
define "Limitations":
	["Laboratory Test, Ordered": "Hemoglobin lab test"] 
	or ["Laboratory Test, Ordered": "Hematocrit lab test"]
	or ["Procedure, Performed": "Complete blood count (procedure)"] union ["Diagnosis": "End Stage Renal Disease"]
	or ["Procedure, Performed": "Complete blood count (procedure)"]P
		where P.Reference Range = 'High' or P.Reference Range = 'Low'
		and P.Timing >1
	or not "Indications for CBC"
	or not "CBC with anemia"
	or not "CBC with polycythemia"
	or not "CBC related to WBC with leukemia"
	or not "CBC related to platelet"
	or not "Symptoms" 
define "Coverage":
       "Indications for CBC" and "CBC with anemia" and "CBC with polycythemia" and "CBC related to WBC with leukemia" and "CBC related to platelet" and not "Limitations"                
        
