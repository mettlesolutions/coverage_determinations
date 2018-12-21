//Serum Iron Studies
library SerumIronStudies
using FHIR
include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.3.88.12.3221.7.4'
codesystem "CDT": '2.16.840.1.113762.1.4.1182.80'
valueset "Serum ferritin/Total iron binding capacity measurement (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Transferrin measurement (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Iron deficiency (disorder)": '2.16.840.1.113762.1.4.1018.240'
valueset "Anemia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Iron overload (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'

valueset "Mean corpuscular volume - low (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hemoglobin low (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Mean corpuscular volume - normal (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Red cell distribution width determination (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Pica (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Acute gastrointestinal hemorrhage (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Chronic gastrointestinal hemorrhage (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hematuria, unspecified": '2.16.840.1.113883.3.3157.1008'
valueset "Menorrhagia (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Malabsorption - iron (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
//Post-gastrectomy
valueset "Posterior gastrojejunostomy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Malnutrition (calorie) (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Malignant (primary) neoplasm, unspecified": '1.3.6.1.4.1.6997.4.1.2.234.999.4.9'
//preoperative autologous blood collection
valueset "Chronic inflammatory disorder (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'

valueset "Cirrhosis": '2.16.840.1.113762.1.4.1032.14'
valueset "Iron deficiency anemia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Chronic hepatitis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Diabetes mellitus (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hyperpigmentation of skin (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Arthropathy (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hypogonadism (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hypopituitarism (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Disorder of porphyrin metabolism (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Heart failure, unspecified": '2.16.840.1.113762.1.4.1182.92'
valueset "Sideroblastic anemia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Thalassemia major (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Cardiomyopathy (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Other specified cardiac dysrhythmias": '2.16.840.1.113883.3.526.2.176'
valueset "Conduction disorder of the heart (disorder)": '2.16.840.1.113883.3.526.3.366'
valueset "Ascorbic acid measurement (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//Oral or parenteral iron
valueset "Erythropoietin therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Combined B12 and folate deficiency anemia (disorder)" ; '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Nutritional deficiency (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Folic acid deficiency (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Pernicious anemia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Serum ferritin normal (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Chronic kidney disease (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Acute phase reactant (substance)": '2.16.840.1.113762.1.4.1010.2'

valueset "Serum ferritin level low (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hemochromatosis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "End stage renal disease": '2.16.840.1.113883.3.526.2.589'
valueset "Chronic renal failure syndrome (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Increased size (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
//multiple transfusions
valueset "Serum iron tests (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Ferritin measurement (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Admission for treatment (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Serum ferritin measurement (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Dialysis procedure (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Toxic effect of iron compound (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Toxic effect of nickel compound (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Toxic effect of organic lead compound (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "collection and application of autologous blood concentrate product": '2.16.840.1.113762.1.4.1182.80'
valueset "Surgery care (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Initial patient assessment (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Total iron binding capacity measurement (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Nutritional assessment (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Serum ferritin high (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Serum iron low (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Male (finding)": '2.16.840.1.113883.3.2074.1.1.14'
valueset "Female (finding)": '2.16.840.1.113883.3.2074.1.1.14'
valueset "Insulin treated type 2 diabetes mellitus (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Normal (qualifier value)": '2.16.840.1.113762.1.4.1185.7'
valueset "Documentation procedure (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
parameter MeasurementPeriod1 default @2003-01-01T00:00:00.0

context Patient

define "Normal Serum Ferritin Level In Males":
            (exists (["Patient": "Male (finding)"]) 
             and (exists (["Observation": "Serum ferritin measurement (procedure)"] ST
          where  (ST.effective) during MeasurementPeriod1 and (ST.value) = Interval[12,300]) ) )
          
define "Normal Serum Ferritin Level In Females":
            (exists (["Patient": "Female (finding)"]) 
             and (exists (["Observation": "Serum ferritin measurement (procedure)"] ST
          where  (ST.effective) during MeasurementPeriod1 and (ST.value) = Interval[12,150]) ) )


define "Iron Deficiencies":
    (exists (["Condition": "Mean corpuscular volume - low (finding)"])
    or (exists (["Condition": "Mean corpuscular volume - low (finding)"] union ["Condition": "Hemoglobin low (finding)"]))
    or (exists (["Condition": "Mean corpuscular volume - normal (finding)"] union ["Condition": "Hemoglobin low (finding)"]))
    or (exists (["Condition": "Mean corpuscular volume - low (finding)"] union ["Condition": "Increased size (finding)"] union ["Condition": "Red cell distribution width determination (procedure)"]))
    or (exists (["Condition": "Mean corpuscular volume - normal (finding)"] union ["Condition": "Increased size (finding)"] union ["Condition": "Red cell distribution width determination (procedure)"]))
    or (exists (["Condition": "Pica (disorder)"]))
    or (exists (["Condition": "Chronic gastrointestinal hemorrhage (disorder)"]))
    or (exists (["Condition": "Acute gastrointestinal hemorrhage (disorder)"]))
    or (exists (["Condition": "Hematuria, unspecified"]))
    or (exists (["Condition": "Menorrhagia (finding)"]))
    or (exists (["Condition": "Malabsorption - iron (disorder)"]))
    or (exists (["Procedure": "Posterior gastrojejunostomy (procedure)"]))
    or (exists (["Condition": "Malnutrition (calorie) (disorder)"]))
    or (exists (["Condition": "Malignant (primary) neoplasm, unspecified"]))
    or (exists (["Condition": "Chronic inflammatory disorder (disorder)"]))
    )
    
define "Iron Overloads": 
         (exists (["Condition": "Chronic hepatitis (disorder)"])
          or (exists (["Condition": "Diabetes mellitus (disorder)"]))
          or (exists (["Condition": "Hyperpigmentation of skin (disorder)"]))
          or (exists (["Condition": "Arthropathy (disorder)"]))
          or (exists (["Condition": "Cirrhosis"]))
          or (exists (["Condition": "Hypogonadism (disorder)"]))
          or (exists (["Condition": "Hypopituitarism (disorder)"]))
          or (exists (["Condition": "Disorder of porphyrin metabolism (disorder)"]))
          or (exists (["Condition": "Heart failure, unspecified"]))
          or (exists (["Condition": "Sideroblastic anemia (disorder)"]))
          or (exists (["Condition": "Thalassemia major (disorder)"]))
          or (exists (["Condition": "Cardiomyopathy (disorder)"]))
          or (exists (["Condition": "Other specified cardiac dysrhythmias"]))
          or (exists (["Condition": "Conduction disorder of the heart (disorder)"]))
          )
 
define "Condition 1(Indication)":
           "Iron Deficiencies" union  (exists ["Observation": "Serum ferritin/Total iron binding capacity measurement (procedure)"]) or (exists ["Observation": "Transferrin measurement (procedure)"])
           or "Iron Overloads" union (exists ["Observation": "Serum ferritin/Total iron binding capacity measurement (procedure)"]) or (exists ["Observation": "Transferrin measurement (procedure)"])         

define "Condition 2(Indication)":
		(exists (["Observation": "Serum ferritin/Total iron binding capacity measurement (procedure)"]) or (exists (["Observation": "Transferrin measurement (procedure)"]))
              and (exists (["Observation": "Ascorbic acid measurement (procedure)"]))
              and (exists (["Observation": "Erythropoietin therapy (procedure)"]))
              )
              
define "Iron Studies":
          (exists (["Observation": "Serum iron tests (procedure)"]I
          where (I.effective) during MeasurementPeriod1)
          and (exists (["Observation": "Ferritin measurement (procedure)"]))
          and (exists (["Observation": "Transferrin measurement (procedure)"]))
          )
              
define "Condition 3(Indication)":
       if("Iron Studies")
       then
        	(exists (["Procedure": "Admission for treatment (procedure)"])
       		and (exists (["Condition": "Combined B12 and folate deficiency anemia (disorder)"]))
       		and (exists (["Condition": "Nutritional deficiency (finding)"]))
       		)
       else
       		null
                    
define "Condition 4(Indication)":
         (exists (["Condition": "Chronic kidney disease (disorder)"]) and (exists (["Procedure": "Dialysis procedure (procedure)"]))
         or (exists (["Condition": "Chronic kidney disease (disorder)"])) and not (exists (["Procedure": "Dialysis procedure (procedure)"]))
         and (exists (["Observation": "Serum ferritin measurement (procedure)"]F
         where (F.effective) during MeasurementPeriod1))
         )
         
define "Condition 5(Indication)":
         (exists (["Condition": "Toxic effect of iron compound (disorder)"])
         or (exists (["Condition": "Toxic effect of nickel compound (disorder)"]))
         or (exists (["Condition": "Toxic effect of organic lead compound (disorder)"]))
         and (exists (["Observation": "Serum iron tests (procedure)"]S
         where (S.effective) during MeasurementPeriod1))
         )
         
define "Indications":
       "Condition 1(Indication)" or "Condition 2(Indication)" or "Condition 3(Indication)" or "Condition 4(Indication)" or "Condition 5(Indication)"
       
define "Limitation 1":
       (exists(["Condition": "Iron deficiency (disorder)"])) or (exists (["Condition": "Iron overload (disorder)"]))
        and "Iron Studies"
        
define "Condition 2(Limitations)":
         if(exists (["Condition": "Insulin treated type 2 diabetes mellitus (disorder)"])
         	and ( exists (["Observation": "Serum ferritin measurement (procedure)"]STM
         	 where (STM.value) ="Normal (qualifier value)"))
         	 and (exists (["Condition":"Hemochromatosis (disorder)"])))
          then 
          	(exists (["Procedure" :"Documentation procedure (procedure)"]))
          else
          	(exists (["Condition": "Insulin treated type 2 diabetes mellitus (disorder)"])
         		and (exists (["Observation": "Serum ferritin measurement (procedure)"]))
         		  and (exists ["Condition" :"Hemochromatosis (disorder)"]))
         	
define "Limitation 3":
			(exists (["Condition" : "End stage renal disease"])
			and ( exists (["Observation": "Serum ferritin measurement (procedure)"]))
			)
          	
          
define "Condition 1 for Condition 4(Limitations)":
          (exists (["Observation": "Transferrin measurement (procedure)"]) and not ( exists (["Observation": "Total iron binding capacity measurement (procedure)"])))
          or (exists (["Observation": "Total iron binding capacity measurement (procedure)"]) and not (exists (["Observation": "Transferrin measurement (procedure)"])))

define "Iron Disorders":
           (exists (["Condition": "Iron deficiency (disorder)"])
           or (exists (["Condition": "Iron overload (disorder)"]) ) )

define "Condition 2 for Condition 4(Limitations)":
            (exists (["ProcedureRequest": "Transferrin measurement (procedure)"])
                 and (exists (["Condition": "Malnutrition (calorie) (disorder)"])) and not "Iron Disorders")
            
define "Condition 4(Limitations)":
         "Condition 1 for Condition 4(Limitations)" or "Condition 2 for Condition 4(Limitations)"
         
define "Condition for 5(Limitation)":
          (exists (["Observation": "Initial patient assessment (procedure)"]) and (exists (["Observation": "Transferrin measurement (procedure)"])))
          or ( exists (["Observation": "Initial patient assessment (procedure)"]) and (exists (["Observation": "Ferritin measurement (procedure)"])))
          
define "Condition for 5.1(Limitation)":
			if("Iron Overloads" or "Iron Deficiencies")
			   then 
				(exists (["Observation": "Transferrin measurement (procedure)"]))
			else
				null
				
define "Condition for 5.2(Limitation)":
			if("Iron Overloads" or "Iron Deficiencies")
			   then 
				(exists (["Observation": "Ferritin measurement (procedure)"]))
			else
				null
define "Condition 5(Limitation)":
			"Condition for 5(Limitation)" or "Condition for 5.1(Limitation)" or "Condition for 5.2(Limitation)"			
			  
define "Condition 6(Limitations)":
        if(exists (["Condition": "Anemia (disorder)"]) or (exists(["Condition": "collection and application of autologous blood concentrate product"])) 
        	and (exists (["Observation": "Ferritin measurement (procedure)"])))
        then
         (exists(["Procedure": "Surgery care (regime/therapy)"])) 
    	else
    		null
         	
define "Limitations":
		"Limitation 1" or "Condition 2(Limitations)" or "Limitation 3" or "Condition 4(Limitations)" or "Condition 5(Limitation)" or "Condition 6(Limitations)"
      
   
define "Coverage":
		"Indications" and "Limitations"

define "Not Covered": 
         "Normal Serum Ferritin Level In Females" or "Normal Serum Ferritin Level In Males"


