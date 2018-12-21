//Prothrombin Time (PT)
library ProthrombinTime

using FHIR
include FHIRHelpers version '1.8' called FHIRHelpers

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
valueset "Documentation procedure (procedure)" : '2.16.840.1.113883.3.88.12.80.28'

parameter MeasurementPeriod1 default @2003-01-01T00:00:00.0

context Patient

define "Indications 1":
		(exists (["MedicationAdministration" : "Warfarin"]) 
		and not (exists (["MedicationAdministration" : "heparin"]))
		and(exists (["Procedure" : "Prothrombin time (procedure)"]P
		where P.performed during MeasurementPeriod1))
		)

define "Signs of Abnormal bleeding or thrombosis":
				(exists (["Condition":"Bruising symptom (finding)"])
				and (exists (["Condition":"Bleeding (finding)"]))
				and (exists (["Condition":"Hematoma (disorder)"]))
				and (exists (["Condition":"Petechiae (finding)"]))
				and (exists (["Condition":"Thrombocytopenic disorder (disorder)"]))
				and (exists (["Condition":"Extrinsic coagulation pathway finding (finding)"]))
				)

define "Abnormalities":
		(exists (["Condition" : "Dysfibrinogenemia (disorder)"])
		or (exists (["Condition" :"Afibrinogenemia (disorder)"]))
		or (exists (["Condition" : "Chronic Liver Disease" ]))
		or (exists (["Condition" : "Wilson's disease (disorder)"]))
		or (exists (["Condition" : "Hemochromatosis (disorder)"]))
		or (exists (["Condition" : "Disseminated intravascular coagulation (disorder)" ]))
		or (exists (["Condition" : "Acquired factor II deficiency (disorder)"]))
		or (exists (["Condition" : "Acquired factor V deficiency disease (disorder)"]))
		or (exists (["Condition" : "Acquired factor VII deficiency disease (disorder)"]))
		or (exists (["Condition" : "Acquired factor X deficiency disease (disorder)" ]))
		or (exists (["Condition" : "Vitamin K deficiency (disorder)"]))
		or (exists (["Condition" : "Lupus erythematosus (disorder)" ]))
		or (exists (["Condition" : "History of hypercoagulable state (situation)" ]))
		or (exists (["Condition" : "Malignant lymphoma(disorder)"]))
		or (exists (["Condition" : "Monoclonal gammopathy (disorder)" ]))
		or (exists (["Condition" : "Amyloidosis (disorder)" ]))
		or (exists (["Condition" : "Chronic leukemia, disease (disorder)"]))
		or (exists (["Condition" : "Acute leukemia, disease (disorder)"]))
		or (exists (["Condition" : "Plasma cell neoplasm (disorder)"]))
		or (exists (["Condition" : "Primary malignant neoplasm (disorder)" ]))
		or (exists (["Condition" : "Viral hemorrhagic fever (disorder)" ]))
		or (exists (["Condition" : "Aspirin overdose (disorder)"]))
		or (exists (["Condition" : "Gastrointestinal fistula (disorder)"]))
		or (exists (["Condition" : "Malabsorption syndrome (disorder)"]))
		or (exists (["Condition" : "Ulcerative colitis (disorder)" ]))
		or (exists (["Condition" : "Perinatal jaundice due to congenital obstruction of bile duct (disorder)"]))
		or (exists (["Condition" : "Peripheral vascular disease (disorder)"]))
		or (exists (["Condition" : "Pulmonary embolism (disorder)" ]))
		or (exists (["Condition" :  "Chronic diarrhea (disorder)"]))
		or (exists (["Condition" : "Myocardial infarction (disorder)"]))
		or (exists (["Condition" : "Blood coagulation disorder (disorder)"]))
		or (exists (["Condition" : "Deficiency of naturally occurring coagulation factor inhibitor (disorder)"]))
		or (exists (["Condition" : "Transplantation of liver (procedure)"]))
		)

define "Indications 2":
		(exists (["Condition" : "At risk of deep vein thrombosis (finding)"])
		or (exists (["Condition" : "At risk of hemorrhage (finding)"]))
		or (exists (["Condition" :"Bleeding (finding)"]))
		)
		

define "Limitation 1":
		(exists (["Condition" : "End-stage renal disease (disorder)"])
		and (exists (["Observation" : "Prothrombin time (procedure)"] PT 
		where duration in weeks of (PT.effective) >1 )) and not (exists (["Condition" : "Chronic kidney disease (disorder)"]))
		and (exists (["Procedure":"Documentation procedure (procedure)"]))
		)
		
define "Limitation 2":
		(exists (["Procedure": "Warfarin dose unchanged (regime/therapy)"])
		and (exists (["Procedure":"Prothrombin time (procedure)"] P 
		where duration in weeks of (P.performed) < 3 and P.outcome = "Normal (qualifier value)")) 
		and not (exists (["Patient":"Patient condition unchanged (finding)"])
		))
		
define "Indications":
		"Indications 1" or "Signs of Abnormal bleeding or thrombosis" or "Abnormalities" or "Indications 2"
		and (exists (["Procedure" :  "Prothrombin time (procedure)"]))
		
define "Limitations":
		"Limitation 1" and "Limitation 2"
		
define "Coverage":
		"Indications" and "Limitations"
