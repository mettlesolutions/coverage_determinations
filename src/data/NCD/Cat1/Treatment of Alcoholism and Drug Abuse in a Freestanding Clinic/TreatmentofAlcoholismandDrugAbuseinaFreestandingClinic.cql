//Treatment of Alcoholism and Drug Abuse in a Freestanding Clinic
library ChlamydiaScreening_Common version '2'
 using QDM version '5.3'
 //include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
 codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
valueset "Alcoholism counseling (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Drug abuse prevention management (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Drug therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Psychotherapy (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Patient education (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Physician service (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Drug abuse (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Discharge from Inpatient Facility": '2.16.840.1.113762.1.4.1138.721'
valueset "Psychiatric commitment procedure (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Hospital Inpatient Admission": '2.16.840.1.113762.1.4.1111.70'
valueset "Acute alcoholic intoxication in alcoholism (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Physician (occupation)": '2.16.840.1.113762.1.4.1096.129'

context Patient

define "Treatments Performed":
        ( exists(["Procedure, Performed": "Alcoholism counseling (procedure)"] )
         or ( exists(["Procedure, Performed": "Drug abuse prevention management (procedure)"]) )
         or ( exists(["Procedure, Performed": "Drug therapy (procedure)"]) )
         or ( exists(["Procedure, Performed": "Psychotherapy (regime/therapy)"]) )
        // or ( exists(["Communication: From Provider to Patient": "Patient education (procedure)"]) )
        ) 
         
define "Condition 2(Indications and Limitations)":
           ( exists(["Encounter, Performed": "Discharge from Inpatient Facility"]) and "Treatments Performed"
            or not ( exists(["Diagnosis": "Acute alcoholic intoxication in alcoholism (disorder)"]) and "Treatments Performed" )
           )
             
             
define "Condition 3(Indications and Limitations)":
        "Treatments Performed"  and not ( exists(["Encounter, Performed": "Hospital Inpatient Admission"] ) )
        
            
define "Coverage": 
      ( exists (["Procedure, Performed": "Treatments Performed"]CO
          where CO. authorDatetime = "Physician (occupation)") 
        and "Condition 2(Indications and Limitations)" and "Condition 3(Indications and Limitations)"
         )
         

