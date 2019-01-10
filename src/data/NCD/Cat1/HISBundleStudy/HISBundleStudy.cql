library HISBundleStudy

using FHIR

include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": 'http://snomed.info/sct'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "ICD9CM": 'https://www.cdc.gov/nchs/icd/icd9.htm'
codesystem "RXNORM": 'https://www.nlm.nih.gov/research/umls/rxnorm/'
codesystem "ICD10CM": '2.16.840.1.113883.6.90'
codesystem "NUCCPT":''


valueset "Arrhythmia": '2.16.840.1.113883.3.526.2.181'
valueset "Bundle of His recording (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Implantation of cardiac pacemaker (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Atrioventricular block, second degree": '2.16.840.1.113883.3.526.2.264'
valueset "Cardiac catheterization (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Insertion of intravenous endocardial electrode (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Intermittent second degree atrioventricular block (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Atrioventricular block, complete": '2.16.840.1.113883.3.526.2.264'
valueset "Myocardial infarction (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'

parameter "MeasurementPeriod" Interval<DateTime>

context Patient

define "Condition 1(Covered)":
          ( exists ([Condition: "Arrhythmia"])
          or ( exists ([Condition: "Intermittent second degree atrioventricular block (disorder)"]) or ( exists ([Condition: "Atrioventricular block, complete"]) ) and ( exists ([Procedure: "Implantation of cardiac pacemaker (procedure)"]) ) ) )
          or ( exists ([Condition: "Intermittent second degree atrioventricular block (disorder)"]) and ( exists ([Condition: "Myocardial infarction (disorder)"]) ) )
           
define "Start Date Of Cardiac Catheterization":
	[Procedure: "Cardiac catheterization (procedure)"]C
	  where C.performed in "MeasurementPeriod"

define "Start Date Of HIS Bundle Study":
           [Procedure: "Bundle of His recording (procedure)"]B
	  where B.performed in "MeasurementPeriod"

define "Condition 2(Covered)":
           if "Start Date Of Cardiac Catheterization" = "Start Date Of HIS Bundle Study"
           then Count("Cardiac catheterization (procedure)") = 1
           else null

define "Condition for covered":
         exists([Procedure: "Insertion of intravenous endocardial electrode (procedure)"])

define "Condition 3(Covered)":
          if ( exists ([Procedure: "Bundle of His recording (procedure)"]) and ( exists ([Procedure: "Insertion of intravenous endocardial electrode (procedure)"]) ) )
          then "Condition for covered"
          else false
          
define "Coverage":
         "Condition 1(Covered)" or "Condition 2(Covered)" or "Condition 3(Covered)"
