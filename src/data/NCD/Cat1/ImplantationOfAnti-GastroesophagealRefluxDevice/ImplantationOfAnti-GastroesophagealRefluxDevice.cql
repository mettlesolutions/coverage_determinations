//ImplantationOfAnti-GastroesophagealRefluxDevice

library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'
codesystem "ICD10CM": '2.16.840.1.113883.6.90'

valueset "Gastroesophageal reflux disease (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Gastroesophageal reflux study (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Valvuloplasty of aortic valve (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Treatment Summary Report": '2.16.840.1.113762.1.4.1116.529'
valueset "Systemic sclerosis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4' 
valueset "Disorder of esophagus (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Barrett's esophagus (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Percutaneous valvuloplasty (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Other mechanical complication of esophageal anti-reflux device, initial encounter": '2.16.840.1.113883.3.3157.1843'
valueset "Contraindicated (qualifier value)": '2.16.840.1.113883.3.117.1.7.1.473'
valueset "Treatment Failure": '2.16.840.1.113762.1.4.1111.93'
valueset "Risk identification (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Low Risk" : '2.16.840.1.113883.3.117.1.7.1.400'

context Patient

define "Condition 1(Indications and Limitations)":
         if  ( exists (["Procedure, Performed": "Percutaneous valvuloplasty (procedure)"]P
         where P.result = "Contraindicated (qualifier value)") )
          then ( exists (["Device, Applied": "Other mechanical complication of esophageal anti-reflux device, initial encounter"] ) )
         else null
         
define "Poor Surgical Risk":
           ( exists (["Procedure, Performed": "Risk identification (procedure)"]R
           where R.result = "Low Risk") )
         
define "Condition for Condition 2(Indications and Limitations)":
          ( exists (["Diagnosis": "Systemic sclerosis (disorder)"])
          or ( exists (["Diagnosis": "Disorder of esophagus (disorder)"]) )
          or ("Poor Surgical Risk" and  (exists (["Procedure, Performed": "Percutaneous valvuloplasty (procedure)"]) ) )
          or ( exists (["Procedure, Performed": "Percutaneous valvuloplasty (procedure)"]V
          where V.result="Treatment Failure") ) )

define "Condition 2(Indications and Limitations)":
           if  ( exists (["Diagnosis": "Gastroesophageal reflux disease (disorder)"])
             and "Condition for Condition 2(Indications and Limitations)" )
             then ( exists (["Device, Applied": "Other mechanical complication of esophageal anti-reflux device, initial encounter"] ) )
         else null
        
define "Coverage":
             "Condition 1(Indications and Limitations)" or "Condition 2(Indications and Limitations)"         
