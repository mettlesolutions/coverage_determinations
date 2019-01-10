//Lipid Testing
library LipidTesting

using FHIR version '1.8'
include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "LOINC" : '2.16.840.1.113883.6.1'
codesystem "RXNORM" : '	2.16.840.1.113883.6.88'
codesystem "RXNORM, SNOMEDCT" :'2.16.840.1.113883.6.96'

valueset "Lipid panel (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Coronary arteriosclerosis (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Dyslipidemia (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Nephrotic syndrome (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Pancreatitis (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Disorder of liver (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hypoglycemia (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hyperthyroidism (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Diabetes mellitus (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Intestinal malabsorption (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Chronic kidney disease (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Skin lesion (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "High density lipoprotein/total cholesterol ratio measurement (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Borderline high measurement finding (finding)" :'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Screening procedure (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "At risk of coronary heart disease (finding)	" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Drug therapy (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Total Cholesterol" :'2.16.840.1.113883.3.600.879'
valueset "High Density Lipoprotein (HDL)" : '2.16.840.1.113883.3.600.875'
valueset "Low density lipoprotein cholesterol (substance)" :'2.16.840.1.113762.1.4.1010.2'
valueset "Low density lipoprotein cholesterol measurement (procedure)" : '2.16.840.1.113883.3.600.871'
valueset "High density lipoprotein cholesterol measurement (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Total cholesterol measurement (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Triglycerides" : '2.16.840.1.113883.3.600.883'
valueset "Lipid fractionation measurement (procedure)" :'2.16.840.1.113883.3.88.12.80.28'
valueset "Thiazide diuretic (substance)	" :'2.16.840.1.113762.1.4.1186.2'
valueset "Estrogens" :' 2.16.840.1.113762.1.4.1010.7'
valueset "Glucocorticoid (substance)" : '2.16.840.1.113762.1.4.1010.2'
valueset "Tamoxifen" : '2.16.840.1.113762.1.4.1010.7'
valueset "Serum total cholesterol measurement (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Hypertriglyceridemia (disorder)" :'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Dietary regime (regime/therapy)" :'2.16.840.1.113883.3.88.12.80.28'
valueset "Lipoprotein electrophoresis (procedure)" :'2.16.840.1.113883.3.88.12.80.28'
valueset "Disorder of lipid metabolism (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "High (qualifier value)" : '2.16.840.1.113883.17.4077.3.1023'
valueset "Heart disease (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Increased lipoprotein (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Liver function tests - general (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Psoriasis (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Severe (severity modifier) (qualifier value)" : '2.16.840.1.113762.1.4.1124.19'
valueset "Etretinate (substance)":'2.16.840.1.113762.1.4.1010.2'
valueset "Retinoid (substance)" : '2.16.840.1.113762.1.4.1010.2'
valueset "Hyperlipidemia (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Psoriatic arthritis (disorder)" :'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Generalized pustular psoriasis (disorder)" :'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Fasting lipid profile (procedure)" :'2.16.840.1.113883.3.88.12.80.28'
valueset "Asymptomatic (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Tobacco user (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Family history of disorder (situation)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Deficiency of alkaline phosphatase (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'

parameter Range default Interval[240,null)
parameter Range1 default Interval[35, null)
parameter Range3 default Interval[200,240]
context Patient

define "Condition":
		(exists (["Condition" : "Coronary arteriosclerosis (disorder)"])
		and (exists (["Procedure" : "Lipid panel (procedure)"]))
		)
define "Condition 1":
		(exists (["Condition" :"Coronary arteriosclerosis (disorder)"])
		or (exists (["Condition" :"Dyslipidemia (disorder)"]))
		or (exists (["Condition" : "Nephrotic syndrome (disorder)"]))
		or (exists (["Condition" :"Pancreatitis (disorder)"]))
		or (exists (["Condition" : "Disorder of liver (disorder)"]))
		or (exists (["Condition" : "Hypoglycemia (disorder)"]))
		or (exists (["Condition" :"Hyperthyroidism (disorder)"]))
		or (exists (["Condition" :"Diabetes mellitus (disorder)"]))
		or (exists (["Condition" : "Intestinal malabsorption (disorder)"]))
		or (exists (["Condition" : "Chronic kidney disease (disorder)"]))
		or (exists (["Condition" : "Skin lesion (disorder)"]))
		)
define "Condition 2":
		(exists (["Condition":"Heart disease (disorder)"])
		and (exists (["Procedure" : "Screening procedure (procedure)"]))
		and (exists (["Procedure" : "High density lipoprotein/total cholesterol ratio measurement (procedure)"]T
		where T.outcome = "High (qualifier value)" or T.outcome = Range in'mg/dL' ))
		or  (exists (["Procedure" : "Borderline high measurement finding (finding)"] B
		where B.outcome = "High (qualifier value)" or B.outcome =  Range3 in 'mg/dL'  ))
		or (exists (["Condition" :"At risk of coronary heart disease (finding)	"]))
		or  (exists (["Procedure" : "High density lipoprotein cholesterol measurement (procedure)"] H
		where H.outcome = Range1 in'mg/dL'))
		)
		
define "Condition 3.1":
		(exists (["Condition" : "Increased lipoprotein (finding)"])
		and (exists (["Procedure" : "Dietary regime (regime/therapy)"]))
		or (exists (["Procedure" :"Drug therapy (procedure)"]))
		or (exists (["MedicationAdministration" : "Total Cholesterol"]))
		or (exists (["MedicationAdministration" : "High Density Lipoprotein (HDL)"]))
		or (exists (["MedicationAdministration" : "Low density lipoprotein cholesterol (substance)"]))
		)
define "Condition 3.2":
		(exists (["MedicationAdministration" : "Triglycerides"])
		or (exists (["MedicationAdministration" :"Thiazide diuretic (substance)	"]))
		or (exists (["MedicationAdministration" : "Estrogens"]))
		or (exists (["MedicationAdministration":"Glucocorticoid (substance)"]))
		or (exists (["MedicationAdministration":"Tamoxifen"]))
		)
define "Condition 3":
		"Condition 3.1" and "Condition 3.2"

define "Condition 4.1":
		(exists (["Procedure" : "Dietary regime (regime/therapy)"])
		or (exists (["Procedure" :"Drug therapy (procedure)"]))
		and (exists (["Procedure" : "Borderline high measurement finding (finding)"]))
		or (exists (["Procedure":"Low density lipoprotein cholesterol measurement (procedure)"]))
		and (exists (["Procedure": "Lipid panel (procedure)"] L
		where duration in years of L.performed = 1))
		)
define "Condition 4.2":
		(exists (["Procedure": "Lipid panel (procedure)"] P
		where duration in years of P.performed = 1)
		and (exists (["Procedure" : "Serum total cholesterol measurement (procedure)"]))
		or (exists (["Procedure" : "Low density lipoprotein cholesterol measurement (procedure)"]))
		and not (exists (["Condition": "Hypertriglyceridemia (disorder)"]))
		)
define "Condition 4":
		"Condition 4.1" and "Condition 4.2"

define "Condition 5.1":
		(exists (["Procedure" :"Low density lipoprotein cholesterol measurement (procedure)"]L
		where duration in years of L.performed = 1 and Count(["Procedure" :"Low density lipoprotein cholesterol measurement (procedure)"]) = 6)
		and (exists (["Procedure" : "Dietary regime (regime/therapy)"]))
		or (exists (["Procedure" :"Drug therapy (procedure)"]))
		)
define "Condition 5.2":
		(exists (["Procedure" : "Total cholesterol measurement (procedure)"])
		or (exists (["Procedure" : "High density lipoprotein cholesterol measurement (procedure)"]))
		or (exists (["Procedure" : "Low density lipoprotein cholesterol measurement (procedure)"]))
		or (exists (["MedicationAdministration" : "Triglycerides"]))
		and  (exists (["Procedure" : "Dietary regime (regime/therapy)"]))
		or (exists (["Procedure" :"Drug therapy (procedure)"]))
		)

define "Covered":
		"Condition" and "Condition 1" or "Condition 2" or "Condition 3" or "Condition 4" or "Condition 5.1" or "Condition 5.2"
		
define "Condition 5.3":
		if(Covered)
		then
			(exists (["Procedure" : "Total cholesterol measurement (procedure)"]C
			where duration in years of C.performed = 1 and Count(["Procedure" : "Total cholesterol measurement (procedure)"]) = 3))
			or (exists (["Procedure" : "Low density lipoprotein cholesterol measurement (procedure)"]D
			where duration in years of D.performed = 1 and Count(["Procedure" : "Low density lipoprotein cholesterol measurement (procedure)"]) = 3))
		else 
			null
		

define "Condition 6":
		(exists (["Condition": "Disorder of lipid metabolism (disorder)"])
		and (exists (["Procedure":"Lipoprotein electrophoresis (procedure)"]))
		)

define "Indications":
		"Condition 5.3" and "Condition 6"
		
define "Limitation 1":
		(exists (["Condition":"Psoriasis (disorder)"]P
		where P.severity = "Severe (severity modifier) (qualifier value)")
		and (exists (["MedicationAdministration":"Etretinate (substance)"]))
		and (exists (["MedicationAdministration":"Retinoid (substance)"]))
		and (exists (["Condition" : "Hyperlipidemia (disorder)" ]))
		and (exists (["Condition" : "Psoriatic arthritis (disorder)"]))
		and (exists (["Condition" : "Generalized pustular psoriasis (disorder)"]))
		and (exists (["Procedure" :"Lipid panel (procedure)"]))
		and (exists (["Procedure":"Liver function tests - general (procedure)"]))
		)
define "Limitation 2":
		(exists (["Procedure":"Fasting lipid profile (procedure)"]))

define "Limitation 3":
		(exists (["Condition" : "Asymptomatic (finding)"])
		and (exists (["FamilyMemberHistory" : "Family history of disorder (situation)"]))
		and (exists (["Condition" :"Tobacco user (finding)"]))
		and (exists (["Procedure":"Fasting lipid profile (procedure)"]))
		)
		
define "Limitation 4":
	   	not (exists (["ProcedureRequest" : "Dietary regime (regime/therapy)"])
		or not (exists (["ProcedureRequest" :"Drug therapy (procedure)"]))
		and (exists (["Procedure" : "Lipid panel (procedure)"]))
		)
define "Limitation 5":
		(exists (["Condition" :"Deficiency of alkaline phosphatase (disorder)"])
		and (exists (["Procedure" : "Lipid panel (procedure)"]P
		where duration in years of P.performed = 1 and Count(["Procedure" : "Lipid panel (procedure)"]) =2))
		)
		
define "Limitations":
		"Limitation 1" or "Limitation 2" or "Limitation 3" or "Limitation 4" or "Limitation 5"
		
define "Coverage":
		"Indications" and "Limitations"
