//HepatitisPanel-AcuteHepatitisPanel

library HepatitisPanelAcuteHepatitisPanel

using FHIR
include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'

valueset "Viral hepatitis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Liver function tests abnormal (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
//Signs and symptoms of Hepatitis
valueset "Transplantation of liver (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Hepatitis panel measurement (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Hepatitis A antibody test (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Hepatitis B core antibody measurement, immunoglobulin M type (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Hepatitis B surface antigen measurement (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Hepatitis C antibody measurement (procedure)": '2.16.840.1.113883.3.88.12.80.28'

parameter MeasurementPeriod default @2003-01-01T00:00:00.0
parameter "Total" Integer

context Patient


define "Condition 1(Indications)":
           (exists (["Condition": "Liver function tests abnormal (finding)"])
           and (exists (["Procedure": "Hepatitis panel measurement (procedure)"]H
           where H.outcome = "Viral hepatitis (disorder)" and H.performed during MeasurementPeriod) ) )
           
define "Condition 2(Indications)": 
          if  ( exists (["Procedure": "Hepatitis panel measurement (procedure)"]P
          where P.performed during MeasurementPeriod ) )
           then ( exists (["Procedure": "Transplantation of liver (procedure)"]) )
          else null
          
define "Condition 3(Indications)":
                if  ( exists (["Procedure": "Transplantation of liver (procedure)"] ) )
                       then ( exists (["Procedure": "Hepatitis panel measurement (procedure)"]P
                       where P.performed during MeasurementPeriod) )
                      else null
                      
define "Indications":
         "Condition 1(Indications)" or "Condition 2(Indications)" or "Condition 3(Indications)"
        
define "Hepatitis A antibody Test":
            if ( exists (["Condition": "Viral hepatitis (disorder)"]) )
               then ( exists (["Procedure": "Hepatitis A antibody test (procedure)"]) )
               
             else null

define "Hepatitis B core antibody Test":
          if ( exists (["Condition": "Viral hepatitis (disorder)"]) )
               then ( exists (["Procedure": "Hepatitis B core antibody measurement, immunoglobulin M type (procedure)"]) )
          else null
          
          
define "Hepatitis B surface antigen Test":
            if ( exists (["Condition": "Viral hepatitis (disorder)"]) )
               then ( exists (["Procedure": "Hepatitis B surface antigen measurement (procedure)"]) )
            else null

              

define "Hepatitis C antibody":
            if ( exists (["Condition": "Viral hepatitis (disorder)"]) )
               then ( exists (["Procedure": "Hepatitis C antibody measurement (procedure)"]) )
            else null
          
           
define "Limitations":
            "Hepatitis A antibody Test" or "Hepatitis B core antibody Test" or "Hepatitis B surface antigen Test" or "Hepatitis C antibody"
            
define "Indications and Limitations":
             "Indications" and "Limitations"  

define "Coverage":
           "Indications and Limitations"         
