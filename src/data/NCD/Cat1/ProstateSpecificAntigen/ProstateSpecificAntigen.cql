//ProstateSpecificAntigen
library ChlamydiaScreening_Common version '2'

using QDM version '5.3'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
codesystem "ICD10CM": '2.16.840.1.113883.6.90'

valueset "Prostate Specific Antigen Test": '2.16.840.1.113883.3.526.2.215'
valueset "Adenocarcinoma of prostate (disorder)": '2.16.840.1.113883.3.526.2.92'
valueset "Residual tumor stage finding (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Carcinoma of prostate (disorder)": '2.16.840.1.113883.3.526.3.319'
valueset "Radical prostatectomy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//antiandrogen therapy
//Digital Rectal Examination
//valueset "Rectal examination (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Procedure aiding diagnosis (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//Metastatic diesease
valueset "Persistent infection (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Lower urinary tract infectious disease (disorder)": '2.16.840.1.113883.3.464.1003.112.11.1016'
valueset "Urine stream interrupted (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Nocturia (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'	
valueset "Incontinence (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
//valueset "Metastatic disseminated retinitis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hematuria, unspecified": '2.16.840.1.113883.3.3157.1020'
valueset "Slowing of urinary stream (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Urinary hesitancy (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Urinary urgency (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Benign prostatic hyperplasia (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Carcinoma in situ (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Metastatic Cancer": '2.16.840.1.113762.1.4.1116.351'

//hesitancy
//urgency
//insitu carcinoma

parameter "MeasurementPeriod" Interval<DateTime>

context Patient

define "Symptoms":
	(exists (["Symptom": "Nocturia (finding)"])
	or exists (["Symptom": "Incontinence (finding)"])
	or exists (["Symptom": "Hematuria, unspecified"])
	or exists (["Symptom": "Slowing of urinary stream (finding)"])
	or exists (["Symptom" : "Urinary urgency (finding)"])
	or exists (["Symptom": "Urinary hesitancy (finding)"]))
	
define "Indications":
	(exists (["Physical Exam, Performed": "Benign prostatic hyperplasia (disorder)"]) 
	or exists (["Diagnosis": "Carcinoma of prostate (disorder)"])
	or exists (["Diagnosis": "Adenocarcinoma of prostate (disorder)"])
	)
	
define "Limitation1":
	(exists (["Diagnosis": "Carcinoma in situ (disorder)"]) and  (exists (["Diagnostic Study, Performed": "Prostate Specific Antigen Test"]P
		where P.result = 'abnormal' )))
define "Limit":
	["Diagnostic Study, Performed": "Prostate Specific Antigen Test"]D 
	where D.relevantPeriod in "MeasurementPeriod"
	and "Symptoms"
	
define "Limitation2":
	Count("Limit") during 1 year = 1
	
define "Coverage":
	"Indications" and "Limitation1" and "Limitation2"
