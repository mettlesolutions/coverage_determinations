//Lipid Testing
library ChlamydiaScreening_Common version '2'

using QDM

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


context Patient

define "Condition":
		(exists (["Diagnosis" : "Coronary arteriosclerosis (disorder)"])
		and (exists (["Procedure, Performed" : "Lipid panel (procedure)"]))
		)
define "Condition 1":
		(exists (["Diagnosis" :"Coronary arteriosclerosis (disorder)"])
		or (exists (["Diagnosis" :"Dyslipidemia (disorder)"]))
		or (exists (["Diagnosis" : "Nephrotic syndrome (disorder)"]))
		or (exists (["Diagnosis" :"Pancreatitis (disorder)"]))
		or (exists (["Diagnosis" : "Disorder of liver (disorder)"]))
		or (exists (["Diagnosis" : "Hypoglycemia (disorder)"]))
		or (exists (["Diagnosis" :"Hyperthyroidism (disorder)"]))
		or (exists (["Diagnosis" :"Diabetes mellitus (disorder)"]))
		or (exists (["Diagnosis" : "Intestinal malabsorption (disorder)"]))
		or (exists (["Diagnosis" : "Chronic kidney disease (disorder)"]))
		or (exists (["Diagnosis" : "Skin lesion (disorder)"]))
		)
define "Condition 2":
		(exists (["Diagnosis":"Heart disease (disorder)"])
		and (exists (["Procedure, Performed" : "Screening procedure (procedure)"]))
		and (exists (["Procedure, Performed" : "High density lipoprotein/total cholesterol ratio measurement (procedure)"]T
		where T.result = "High (qualifier value)" or T.result > 240 'mg/dL' ))
		or  (exists (["Procedure, Performed" : "Borderline high measurement finding (finding)"] B
		where B.result = "High (qualifier value)" or B.result between 200 and 240  ))
		or (exists (["Diagnosis" :"At risk of coronary heart disease (finding)	"]))
		or  (exists (["Procedure, Performed" : "High density lipoprotein cholesterol measurement (procedure)"] H
		where H.result < 35 'mg/dL'))
		)
define "Condition 3.1":
		(exists (["Diagnosis" : "Increased lipoprotein (finding)"])
		and (exists (["Procedure, Performed" : "Dietary regime (regime/therapy)"]))
		or (exists (["Procedure, Performed" :"Drug therapy (procedure)"]))
		or (exists (["Substance, Administered" : "Total Cholesterol"]))
		or (exists (["Substance, Administered" : "High Density Lipoprotein (HDL)"]))
		or (exists (["Substance, Administered" : "Low density lipoprotein cholesterol (substance)"]))
		)
define "Condition 3.2":
		(exists (["Substance, Administered" : "Triglycerides"])
		or (exists (["Medication, Administered" :"Thiazide diuretic (substance)	"]))
		or (exists (["Medication, Administered" : "Estrogens"]))
		or (exists (["Medication, Administered":"Glucocorticoid (substance)"]))
		or (exists (["Medication, Administered":"Tamoxifen"]))
		)
define "Condition 3":
		"Condition 3.1" and "Condition 3.2"

define "Condition 4.1":
		(exists (["Procedure, Performed" : "Dietary regime (regime/therapy)"])
		or (exists (["Procedure, Performed" :"Drug therapy (procedure)"]))
		and (exists (["Procedure, Performed" : "Borderline high measurement finding (finding)"]))
		or (exists (["Procedure, Performed":"Low density lipoprotein cholesterol measurement (procedure)"]))
		and (exists (["Procedure, Performed": "Lipid panel (procedure)"] L
		where duration in years of L.relevantPeriod = 1))
		)
define "Condition 4.2":
		(exists (["Procedure, Performed": "Lipid panel (procedure)"] P
		where duration in years of P.relevantPeriod = 1)
		and (exists (["Procedure, Performed" : "Serum total cholesterol measurement (procedure)"]))
		or (exists (["Procedure, Performed" : "Low density lipoprotein cholesterol measurement (procedure)"]))
		and not (exists (["Diagnosis": "Hypertriglyceridemia (disorder)"]))
		)
define "Condition 4":
		"Condition 4.1" and "Condition 4.2"

define "Condition 5.1":
		(exists (["Procedure, Performed" :"Low density lipoprotein cholesterol measurement (procedure)"]L
		where duration in years of L.relevantPeriod = 1 and L.components = 6)
		and (exists (["Procedure, Performed" : "Dietary regime (regime/therapy)"]))
		or (exists (["Procedure, Performed" :"Drug therapy (procedure)"]))
		)
define "Condition 5.2":
		(exists (["Procedure, Performed" : "Total cholesterol measurement (procedure)"])
		or (exists (["Procedure, Performed" : "High density lipoprotein cholesterol measurement (procedure)"]))
		or (exists (["Procedure, Performed" : "Low density lipoprotein cholesterol measurement (procedure)"]))
		or (exists (["Substance, Administered" : "Triglycerides"]))
		and  (exists (["Procedure, Performed" : "Dietary regime (regime/therapy)"]))
		or (exists (["Procedure, Performed" :"Drug therapy (procedure)"]))
		)

define "Covered":
		"Condition" and "Condition 1" or "Condition 2" or "Condition 3" or "Condition 4" or "Condition 5.1" or "Condition 5.2"
		
define "Condition 5.3":
		if(Covered)
		then
			(exists (["Procedure, Performed" : "Total cholesterol measurement (procedure)"]C
			where duration in years of C.relevantPeriod = 1 and C.components = 3))
			or (exists (["Procedure, Performed" : "Low density lipoprotein cholesterol measurement (procedure)"]D
			where duration in years of D.relevantPeriod = 1 and D.components = 3))
		else 
			null
		

define "Condition 6":
		(exists (["Diagnosis": "Disorder of lipid metabolism (disorder)"])
		and (exists (["Procedure, Performed":"Lipoprotein electrophoresis (procedure)"]))
		)

define "Indications":
		"Condition 5.3" and "Condition 6"
		
define "Limitation 1":
		(exists (["Diagnosis":"Psoriasis (disorder)"]P
		where P.severity = "Severe (severity modifier) (qualifier value)")
		and (exists (["Substance, Administered":"Etretinate (substance)"]))
		and (exists (["Substance, Administered":"Retinoid (substance)"]))
		and (exists (["Diagnosis" : "Hyperlipidemia (disorder)" ]))
		and (exists (["Diagnosis" : "Psoriatic arthritis (disorder)"]))
		and (exists (["Diagnosis" : "Generalized pustular psoriasis (disorder)"]))
		and (exists (["Procedure, Performed" :"Lipid panel (procedure)"]))
		and (exists (["Procedure, Performed":"Liver function tests - general (procedure)"]))
		)
define "Limitation 2":
		(exists (["Procedure, Performed":"Fasting lipid profile (procedure)"]))

define "Limitation 3":
		(exists (["Diagnosis" : "Asymptomatic (finding)"])
		and (exists (["Family History" : "Family history of disorder (situation)"]))
		and (exists (["Diagnosis" :"Tobacco user (finding)"]))
		and (exists (["Procedure, Performed":"Fasting lipid profile (procedure)"]))
		)
		
define "Limitation 4":
	   	not (exists (["Procedure, Recommended" : "Dietary regime (regime/therapy)"])
		or not (exists (["Procedure, Recommended" :"Drug therapy (procedure)"]))
		and (exists (["Procedure, Performed" : "Lipid panel (procedure)"]))
		)
define "Limitation 5":
		(exists (["Diagnosis" :"Deficiency of alkaline phosphatase (disorder)"])
		and (exists (["Procedure, Performed" : "Lipid panel (procedure)"]P
		where duration in years of P.relevantPeriod = 1 and P.components =2))
		)
		
define "Limitations":
		"Limitation 1" or "Limitation 2" or "Limitation 3" or "Limitation 4" or "Limitation 5"
		
define "Coverage":
		"Indications" and "Limitations"
