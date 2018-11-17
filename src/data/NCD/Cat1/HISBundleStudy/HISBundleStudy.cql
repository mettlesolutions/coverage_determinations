//HISBundleStudy

library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'

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
          ( exists (["Diagnosis": "Arrhythmia"])
          or ( exists (["Diagnosis": "Intermittent second degree atrioventricular block (disorder)"]) or ( exists (["Diagnosis": "Atrioventricular block, complete"]) ) and ( exists (["Procedure, Performed": "Implantation of cardiac pacemaker (procedure)"]) ) ) )
          or ( exists (["Diagnosis": "Intermittent second degree atrioventricular block (disorder)"]) and ( exists (["Diagnosis": "Myocardial infarction (disorder)"]) ) )
           
define "Start Date Of Cardiac Catheterization":
	["Procedure, Performed": "Cardiac catheterization (procedure)"]C
	  where C.relevantPeriod in "MeasurementPeriod"

define "Start Date Of HIS Bundle Study":
           ["Procedure, Performed": "Bundle of His recording (procedure)"]B
	  where B.relevantPeriod in "MeasurementPeriod"       
	   
define "Condition 2(Covered)":
           if "Start Date Of Cardiac Catheterization" = "Start Date Of HIS Bundle Study"
           then Count("Cardiac catheterization (procedure)") = 1
           else null

define "Condition for covered":
         ["Procedure, Performed": "Insertion of intravenous endocardial electrode (procedure)"]           

define "Condition 3(Covered)":
          if ( exists (["Procedure, Performed": "Bundle of His recording (procedure)"]) and ( exists (["Procedure, Performed": "Insertion of intravenous endocardial electrode (procedure)"]) ) )
          then "Condition for covered"
          else null
          
define "Coverage":
         "Condition 1(Covered)" or "Condition 2(Covered)" or "Condition 3(Covered)"
