//Prothrombin Time (PT)
library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.3.88.12.80.28'
valueset "Warfarin" : '2.16.840.1.113762.1.4.1010.7'
valueset "Prothrombin time (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "heparin" : '2.16.840.1.113762.1.4.1010.7'
valueset "Deep venous thrombosis (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Bruising symptom (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Disseminated intravascular coagulation (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hematoma (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Bleeding (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Petechiae (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Thrombocytopenic disorder (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Extrinsic coagulation pathway finding (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
//swollen extremity with or without prior trauma;

valueset "Dysfibrinogenemia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Afibrinogenemia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Chronic Liver Disease": '2.16.840.1.113883.3.464.1003.199.11.1065'
valueset "Wilson's disease (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hemochromatosis (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Acquired factor II deficiency (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Acquired factor V deficiency disease (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Acquired factor VII deficiency disease (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Acquired factor X deficiency disease (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Vitamin K deficiency (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Lupus erythematosus (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "History of hypercoagulable state (situation)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Malignant lymphoma(disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Monoclonal gammopathy (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Amyloidosis (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Chronic leukemia, disease (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Acute leukemia, disease (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Plasma cell neoplasm (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Primary malignant neoplasm (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Viral hemorrhagic fever (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Aspirin overdose (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Gastrointestinal fistula (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Malabsorption syndrome (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Ulcerative colitis (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Perinatal jaundice due to congenital obstruction of bile duct (disorder)" :'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Peripheral vascular disease (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Pulmonary embolism (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Chronic diarrhea (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Myocardial infarction (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Blood coagulation disorder (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Deficiency of naturally occurring coagulation factor inhibitor (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Transplantation of liver (procedure)" : '2.16.840.1.113883.3.88.12.80.28'

valueset "At risk of deep vein thrombosis (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "At risk of hemorrhage (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
//History of Bleeding
valueset "Thrombolytic therapy (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Warfarin dose changed (situation)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Warfarin dose unchanged (regime/therapy)":'2.16.840.1.113883.3.88.12.80.28'

valueset "End-stage renal disease (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Chronic kidney disease (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Warfarin therapy (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Summary report (record artifact)":'2.16.840.1.113762.1.4.1116.529'
//symptoms of thrombosis
valueset "Swelling of lower limb (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Muscle pain (finding" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hyperpigmentation of skin (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Normal (qualifier value)":'2.16.840.1.113762.1.4.1146.638'
valueset "Patient condition unchanged (finding)":'2.16.840.1.113762.1.4.1096.114'


context Patient

define "Indications 1":
		(exists (["Substance, Administered" : "Warfarin"]) 
		and not (exists (["Substance, Administered" : "heparin"]))
		and(exists (["Procedure, Performed" : "Prothrombin time (procedure)"]))
		)

define "Signs of Abnormal bleeding or thrombosis":
				(exists (["Symptom":"Bruising symptom (finding)"])
				and (exists (["Symptom":"Bleeding (finding)"]))
				and (exists (["Symptom":"Hematoma (disorder)"]))
				and (exists (["Symptom":"Petechiae (finding)"]))
				and (exists (["Symptom":"Thrombocytopenic disorder (disorder)"]))
				and (exists (["Symptom":"Extrinsic coagulation pathway finding (finding)"]))
				)

define "Abnormalities":
		(exists (["Diagnosis" : "Dysfibrinogenemia (disorder)"])
		or (exists (["Diagnosis" :"Afibrinogenemia (disorder)"]))
		or (exists (["Diagnosis" : "Chronic Liver Disease" ]))
		or (exists (["Diagnosis" : "Wilson's disease (disorder)"]))
		or (exists (["Diagnosis" : "Hemochromatosis (disorder)"]))
		or (exists (["Diagnosis" : "Disseminated intravascular coagulation (disorder)" ]))
		or (exists (["Diagnosis" : "Acquired factor II deficiency (disorder)"]))
		or (exists (["Diagnosis" : "Acquired factor V deficiency disease (disorder)"]))
		or (exists (["Diagnosis" : "Acquired factor VII deficiency disease (disorder)"]))
		or (exists (["Diagnosis" : "Acquired factor X deficiency disease (disorder)" ]))
		or (exists (["Diagnosis" : "Vitamin K deficiency (disorder)"]))
		or (exists (["Diagnosis" : "Lupus erythematosus (disorder)" ]))
		or (exists (["Diagnosis" : "History of hypercoagulable state (situation)" ]))
		or (exists (["Diagnosis" : "Malignant lymphoma(disorder)"]))
		or (exists (["Diagnosis" : "Monoclonal gammopathy (disorder)" ]))
		or (exists (["Diagnosis" : "Amyloidosis (disorder)" ]))
		or (exists (["Diagnosis" : "Chronic leukemia, disease (disorder)"]))
		or (exists (["Diagnosis" : "Acute leukemia, disease (disorder)"]))
		or (exists (["Diagnosis" : "Plasma cell neoplasm (disorder)"]))
		or (exists (["Diagnosis" : "Primary malignant neoplasm (disorder)" ]))
		or (exists (["Diagnosis" : "Viral hemorrhagic fever (disorder)" ]))
		or (exists (["Diagnosis" : "Aspirin overdose (disorder)"]))
		or (exists (["Diagnosis" : "Gastrointestinal fistula (disorder)"]))
		or (exists (["Diagnosis" : "Malabsorption syndrome (disorder)"]))
		or (exists (["Diagnosis" : "Ulcerative colitis (disorder)" ]))
		or (exists (["Diagnosis" : "Perinatal jaundice due to congenital obstruction of bile duct (disorder)"]))
		or (exists (["Diagnosis" : "Peripheral vascular disease (disorder)"]))
		or (exists (["Diagnosis" : "Pulmonary embolism (disorder)" ]))
		or (exists (["Diagnosis" :  "Chronic diarrhea (disorder)"]))
		or (exists (["Diagnosis" : "Myocardial infarction (disorder)"]))
		or (exists (["Diagnosis" : "Blood coagulation disorder (disorder)"]))
		or (exists (["Diagnosis" : "Deficiency of naturally occurring coagulation factor inhibitor (disorder)"]))
		or (exists (["Diagnosis" : "Transplantation of liver (procedure)"]))
		)

define "Indications 2":
		(exists (["Diagnosis" : "At risk of deep vein thrombosis (finding)"])
		or (exists (["Diagnosis" : "At risk of hemorrhage (finding)"]))
		or (exists (["Diagnosis" :"Bleeding (finding)"]))
		)
		

define "Limitation 1":
		(exists (["Diagnosis" : "End-stage renal disease (disorder)"])
		and (exists (["Laboratory Test, Performed" : "Prothrombin time (procedure)"] PT 
		where duration in weeks of PT.relevantPeriod >1 )) and not (exists (["Diagnosis" : "Chronic kidney disease (disorder)"]))
		and (exists (["Diagnostic Study, Performed":"Summary report (record artifact)"]))
		)
		
define "Limitation 2":
		(exists (["Procedure, Performed": "Warfarin dose unchanged (regime/therapy)"])
		and (exists (["Procedure, Performed":"Prothrombin time (procedure)"] P 
		where duration in weeks of P.relevantPeriod < 3 and P.result = "Normal (qualifier value)")) 
		and not (exists (["Patient Characteristic":"Patient condition unchanged (finding)"])
		))
		
define "Indications":
		"Indications 1" or "Signs of Abnormal bleeding or thrombosis" or "Abnormalities" or "Indications 2"
		and (exists (["Procedure, Performed" :  "Prothrombin time (procedure)"]))
		
define "Limitations":
		"Limitation 1" and "Limitation 2"
		
define "Coverage":
		"Indications" and "Limitations"
