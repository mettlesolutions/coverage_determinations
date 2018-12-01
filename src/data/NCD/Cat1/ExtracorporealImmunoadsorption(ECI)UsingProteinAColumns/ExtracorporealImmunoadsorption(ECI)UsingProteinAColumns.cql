//Extracorporeal Immunoadsorption (ECI) Using Protein A Columns


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

valueset "Idiopathic thrombocytopenic purpura (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Protein antigen (substance)": '2.16.840.1.113762.1.4.1010.2'
valueset "Rheumatoid Arthritis": '2.16.840.1.113883.3.464.1003.113.11.1080'
valueset "Active (qualifier value)": '2.16.840.1.113883.3.88.12.80.68'
valueset "High": '2.16.840.1.113883.17.4077.2.1039'
valueset "Joint swelling (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Tenderness of joint (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Morning stiffness - joint (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
//Disease Modifying Anti-Rheumatic Drugs
valueset "": ''

parameter MeasurementPeriod default Interval[
@2001-01-01T00:00:00.0,
null
 )


context Patient

define "Covered 1(Indications and Limitations)":
            ( exists (["Diagnosis": "Idiopathic thrombocytopenic purpura (disorder)"]) 
            and ( exists (["Procedure, Performed": "Protein antigen (substance)"]P
            where P.relevantPeriod during MeasurementPeriod) ) )
            
define "Conditions for treatment of rheumatoid arthritis":
         if ( Count(["Diagnosis": "Joint swelling (finding)"])> 5 and Count(["Diagnosis": "Tenderness of joint (finding)"])> 20 and exists(["Diagnosis": "Morning stiffness - joint (finding)"]M
             where M.prevalencePeriod = 60 'minutes') ) 
           then true 
         else false
            
define "Condition 1":
          ( exists (["Diagnosis": "Rheumatoid Arthritis"]R
          where R.severity = "High") and "Conditions for treatment of rheumatoid arthritis")
          
define "Covered 2(Indications and Limitations)":
           if "Condition 1"
             then ( exists (["Procedure, Performed": "Protein antigen (substance)"]PA
                 where PA.relevantPeriod during MeasurementPeriod) )
           else null
        
define "Indications and Limitations":
               "Covered 1(Indications and Limitations)" or "Covered 2(Indications and Limitations)"
                       
define "Coverage":
          "Indications and Limitations"
           
            
             

