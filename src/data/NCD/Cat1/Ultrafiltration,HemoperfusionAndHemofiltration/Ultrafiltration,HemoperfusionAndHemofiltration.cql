//Ultrafiltration,HemoperfusionAndHemofiltration


library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
codesystem "ICD10CM": '2.16.840.1.113883.3.526.2.183'

valueset "Ultrafiltration (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//Predialysis ultrafiltration
valueset "Hemoperfusion (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Kidney Failure": '2.16.840.1.113883.3.464.1003.109.12.1026'
valueset "Hemodialysis": '2.16.840.1.113883.3.526.2.1151'
valueset "Deferoxamine": '2.16.840.1.113762.1.4.1010.7'
valueset "Iron overload (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
//aluminum toxicity
valueset "Hemofiltration (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Peritoneal Dialysis": '2.16.840.1.113883.3.526.3.1084'
valueset "End Stage Renal Disease": '2.16.840.1.113883.3.526.2.589'
valueset "Peripheral edema (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Drug overdose (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Physician (occupation)": '2.16.840.1.113762.1.4.1096.129'

context Patient

define "Covered 1(Ultrafiltration)":
           ( exists (["Diagnosis": "Peripheral edema (disorder)"])  and ( exists (["Procedure, Performed": "Ultrafiltration (procedure)"]) ) )
define "Condition for Covered 2(Hemoperfusion)":
          ( exists (["Diagnosis": "Drug overdose (disorder)"]) and ( exists (["Diagnosis": "Kidney Failure"]) ) )
          or ( exists (["Diagnosis": "Drug overdose (disorder)"]) and not ( exists (["Diagnosis": "Kidney Failure"]) ) )
          
define "Covered 2(Hemoperfusion)":
          "Condition for Covered 2(Hemoperfusion)" and ( exists (["Procedure, Performed": "Hemoperfusion (procedure)"]H
          where H.authorDatetime= "Physician (occupation)") )

define "Not Covered":
         ( exists (["Diagnosis": "Iron overload (disorder)"]) ) and ( exists (["Procedure, Performed": "Hemoperfusion (procedure)"]) and ( exists (["Medication, Administered": "Deferoxamine"]) ) )
 
define "Condition for Covered 3(Hemofiltration)":
         ( exists (["Diagnosis": "End Stage Renal Disease"]) ) and not ( exists (["Procedure, Performed": "Peritoneal Dialysis"]) and ( exists (["Procedure, Performed": "Hemodialysis"]) ) )       

define "Covered 3(Hemofiltration)":
          "Condition for Covered 3(Hemofiltration)" and ( exists (["Procedure, Performed": "Hemofiltration (procedure)"]) )
   
define "Coverage":
         "Covered 1(Ultrafiltration)" or "Covered 2(Hemoperfusion)" or "Covered 3(Hemofiltration)"
              
          
