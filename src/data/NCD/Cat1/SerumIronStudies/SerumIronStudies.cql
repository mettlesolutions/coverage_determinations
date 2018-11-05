//Serum Iron Studies
library ChlamydiaScreening_Common version '2'

using QDM version '5.3'

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
valueset "Mean corpuscular volume - low (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hemoglobin low (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Mean corpuscular volume - normal (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
//valueset "Red cell distribution width determination (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Pica (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
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
valueset "Nutritional deficiency (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Folic acid deficiency (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Pernicious anemia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Serum ferritin normal (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Chronic kidney disease (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Iron overload (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
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
valueset "": ''

define "Normal Serum Ferritin Level In Males":
            (exists (["Patient Characteristic Sex": "Male (finding)"]) 
             and (exists (["Laboratory Test, Performed": "Serum ferritin measurement (procedure)"] ST
          where ST.result = Interval[12,300]) ) )
          
define "Normal Serum Ferritin Level In Females":
            (exists (["Patient Characteristic Sex": "Female (finding)"]) 
             and (exists (["Laboratory Test, Performed": "Serum ferritin measurement (procedure)"] ST
          where ST.result = Interval[12,150]) ) )


define "Iron Deficiencies":
    ["Diagnosis": "Mean corpuscular volume - low (finding)"]
    or ["Diagnosis": "Mean corpuscular volume - low (finding)"] union ["Diagnosis": "Hemoglobin low (finding)"]
    or ["Diagnosis": "Mean corpuscular volume - normal (finding)"] union ["Diagnosis": "Hemoglobin low (finding)"]
    or ["Diagnosis": "Mean corpuscular volume - low (finding)"] union ["Diagnosis": "Increased size (finding)"] union ["Diagnosis": "Red cell distribution width determination (procedure)"]
    or ["Diagnosis": "Mean corpuscular volume - normal (finding)"] union ["Diagnosis": "Increased size (finding)"] union ["Diagnosis": "Red cell distribution width determination (procedure)"]
    or ["Diagnosis": "Pica (disorder)"]
    or ["Diagnosis": "Chronic gastrointestinal hemorrhage (disorder)"]
    or ["Diagnosis": "Hematuria, unspecified"]
    or ["Diagnosis": "Menorrhagia (finding)"]
    or ["Diagnosis": "Malabsorption - iron (disorder)"]
    or ["Procedure, Performed": "Posterior gastrojejunostomy (procedure)"]
    or ["Diagnosis": "Malnutrition (calorie) (disorder)"]
    or ["Diagnosis": "Malignant (primary) neoplasm, unspecified"]
    or ["Diagnosis": "Chronic inflammatory disorder (disorder)"]
    
define "Iron Overloads": 
          ["Diagnosis": "Chronic hepatitis (disorder)"]
          or ["Diagnosis": "Diabetes mellitus (disorder)"]
          or ["Diagnosis": "Hyperpigmentation of skin (disorder)"]
          or ["Diagnosis": "Arthropathy (disorder)"]
          or ["Diagnosis": "Cirrhosis"]
          or ["Diagnosis": "Hypogonadism (disorder)"]
          or ["Diagnosis": "Hypopituitarism (disorder)"]
          or ["Diagnosis": "Disorder of porphyrin metabolism (disorder)"]
          or ["Diagnosis": "Heart failure, unspecified"]
          or ["Diagnosis": "Sideroblastic anemia (disorder)"]
          or ["Diagnosis": "Thalassemia major (disorder)"]
          or ["Diagnosis": "Cardiomyopathy (disorder)"]
          or ["Diagnosis": "Other specified cardiac dysrhythmias"]
          or ["Diagnosis": "Conduction disorder of the heart (disorder)"]
 
define "Condition 1(Indication)":
           "Iron Deficiency" union ["Laboratory Test, Performed": "Serum ferritin/Total iron binding capacity measurement (procedure)"] or ["Laboratory Test, Performed": "Transferrin measurement (procedure)"]
           or "Iron Overload" union ["Laboratory Test, Performed": "Serum ferritin/Total iron binding capacity measurement (procedure)"] or ["Laboratory Test, Performed": "Transferrin measurement (procedure)"]          

define "Condition 2(Indication)":
              ["Laboratory Test, Performed": "Ascorbic acid measurement (procedure)"]
              or ["Laboratory Test, Performed": ""] 
              
define "Iron Studies":
          ["Laboratory Test, Performed": "Serum iron tests (procedure)"]
          union ["Laboratory Test, Performed": "Ferritin measurement (procedure)"]
          union ["Laboratory Test, Performed": "Transferrin measurement (procedure)"]
              
define "Condition 3(Indication)":
       "Iron Studies" starts after ["Procedure, Performed": "Admission for treatment (procedure)"] union ["Diagnosis": "Nutritional deficiency (finding)"]
                    
define "Condition 4(Indication)":
         ["Diagnosis": "Chronic kidney disease (disorder)"] union ["Procedure, Performed": "Dialysis procedure (procedure)"]
         or ["Diagnosis": "Chronic kidney disease (disorder)"] union not ["Procedure, Performed": "Dialysis procedure (procedure)"] 
         union ["Laboratory Test, Performed": "Serum ferritin measurement (procedure)"]
         
define "Condition 5(Indication)":
         ["Diagnosis": "Toxic effect of iron compound (disorder)"]
         or ["Diagnosis": "Toxic effect of nickel compound (disorder)"]
         or ["Diagnosis": "Toxic effect of organic lead compound (disorder)"]
         union ["Laboratory Test, Performed": "Serum iron tests (procedure)"]
         
define "Indications":
       "Condition 1(Indication)" union "Condition 2(Indication)" union "Condition 3(Indication)" union "Condition 4(Indication)" union "Condition 5(Indication)"
       
define "Limitations":
        ["Diagnosis": "Iron deficiency (disorder)"] or ["Diagnosis": "Iron overload (disorder)"]
        union "Iron Studies"
        
define "Condition 2(Limitations)":
         ( exists (["Diagnosis": "Insulin treated type 2 diabetes mellitus (disorder)"])
         and ( exists (["Laboratory Test, Performed": "Serum ferritin measurement (procedure)"]STM
          where STM.reason = "Hemochromatosis (disorder)") ) )
          
define "Condition 1 for Condition 4(Limitations)":
          ( exists (["Laboratory Test, Performed": "Transferrin measurement (procedure)"]) and not ( exists (["Laboratory Test, Performed": "Total iron binding capacity measurement (procedure)"]) ) )
          or ( exists (["Laboratory Test, Performed": "Total iron binding capacity measurement (procedure)"]) and not ( exists (["Laboratory Test, Performed": "Transferrin measurement (procedure)"]) ) )
define "Iron Disorders":
           ( exists (["Diagnosis": "Iron deficiency (disorder)"])
           or ( exists (["Diagnosis": "Iron overload (disorder)"]) ) )

define "Condition 2 for Condition 4(Limitations)":
            ["Laboratory Test, Order": "Transferrin measurement (procedure)"]TM
                 where TM.reason = "Malnutrition (calorie) (disorder)" and "Iron Disorders"
            
               
   
define "Condition 4(Limitations)":
         "Condition 1 for Condition 4(Limitations)" or "Condition 2 for Condition 4(Limitations)"
         
define "Condition 5(Limitations)":
          ( exists (["Assessment, Performed": "Initial patient assessment (procedure)"]) and ( exists (["Laboratory Test, Performed": "Transferrin measurement (procedure)"]) ) )
          or ( exists (["Assessment, Performed": "Initial patient assessment (procedure)"]) and ( exists (["Laboratory Test, Performed": "Ferritin measurement (procedure)"]) ) )
          
define "Condition 6(Limitations)":
        ( exists (["Diagnosis": "Anemia (disorder)"]) or ( exists (["Diagnosis": "collection and application of autologous blood concentrate product"]) ) 
        and ( exists (["Laboratory Test, Performed": "Ferritin measurement (procedure)"]) ) before ( exists (["Procedure, Performed": "Surgery care (regime/therapy)"]) ) )

       /* ["Diagnosis": "Anemia (disorder)"] or ["Diagnosis": "collection and application of autologous blood concentrate product"]
        union ["Laboratory Test, Performed": "Ferritin measurement (procedure)"] before ["Procedure, Performed": "Surgery care (regime/therapy)"] */

define "Not Covered": 
         "Normal Serum Ferritin Level In Females" or "Normal Serum Ferritin Level In Males"

/*Limitations:
1st point--> These tests are not to be used solely to assess acute phase reactants where disease management will be unchanged.For example, infections and malignancies are associated with elevations in acute phase reactants such as ferritin, and decreases in serum iron concentration, but iron studies would only be medically necessary if results of iron studies might alter the management of the primary diagnosis or might warrant direct treatment of an iron disorder or condition.

5th point--> If clinically indicated after evaluation of the initial iron studies, it may be appropriate to perform additional iron studies either on the initial specimen or on a subsequently obtained specimen.

*/

