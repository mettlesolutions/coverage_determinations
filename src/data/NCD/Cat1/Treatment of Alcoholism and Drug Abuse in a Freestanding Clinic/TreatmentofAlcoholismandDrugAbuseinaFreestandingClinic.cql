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

context Patient

define "Treatments Performed":
         ["Procedure, Performed": "Alcoholism counseling (procedure)"]
         or ["Procedure, Performed": "Drug abuse prevention management (procedure)"]
         or ["Procedure, Performed": "Drug therapy (procedure)"]
         or ["Procedure, Performed": "Psychotherapy (regime/therapy)"]
         or ["Communication: From Provider to Patient": "Patient education (procedure)"]
         
define "Condition 2(Indications and Limitations)":
             ["Encounter, Performed": "Discharge from Inpatient Facility"] union ["Procedure, Performed": "Alcoholism counseling (procedure)"]
             or ["Encounter, Performed": "Discharge from Inpatient Facility"] union ["Procedure, Performed": "Drug abuse prevention management (procedure)"]
             
define "Condition 3(Indications and Limitations)":
           ["Procedure, Performed": "Psychiatric commitment procedure (procedure)"] union not ["Encounter, Performed": "Hospital Inpatient Admission"]
           union ["Procedure, Performed": "Alcoholism counseling (procedure)"]
           or ["Procedure, Performed": "Psychiatric commitment procedure (procedure)"] union not ["Encounter, Performed": "Hospital Inpatient Admission"]
           union ["Procedure, Performed": "Drug abuse prevention management (procedure)"]
            
define "Coverage": 
       "Treatments Performed" CO
          where CO. author = "Physician service (procedure)" 
        union "Condition 2(Indications and Limitations)" union "Condition 3(Indications and Limitations)"
         
         

