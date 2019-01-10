//ExternalCounterpulsation(ECP)TherapyForSevereAngina

library ExternalCounterpulsationTherapyForSevereAngina
using FHIR version '1.8'
include FHIRHelpers version '1.8' called FHIRHelpers


//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'

valueset "Angina, class III (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Angina, class IV (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Referral by cardiologist (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Referral by cardiothoracic surgeon (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Enhanced external counterpulsation (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Coronary artery bypass grafting (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Percutaneous transluminal coronary angioplasty (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Exercise tolerance test (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Physician (occupation)": '2.16.840.1.113762.1.4.1096.129'
valueset "Treatment Failure": '2.16.840.1.113762.1.4.1111.93'

parameter MeasurementPeriod default @1999-11-01T00:00:00.0

context Patient

define "Enhanced external counterpulsation Referred":
          ( exists (["Procedure": "Enhanced external counterpulsation (procedure)"]P
            where P.performer = "Physician (occupation)" and P.performed during MeasurementPeriod ) 
            and (exists (["Encounter": "Referral by cardiologist (procedure)"])
            or ( exists (["Encounter": "Referral by cardiothoracic surgeon (procedure)"])))
	)
	
define "Procedures Failed":
          ( exists (["Procedure": "Percutaneous transluminal coronary angioplasty (procedure)"]P
          where P.outcome = "Treatment Failure") 
          or ( exists (["Procedure": "Coronary artery bypass grafting (procedure)"]C
          where C.outcome = "Treatment Failure") ) )

define "Condition 1":
          ( exists (["Condition": "Angina, class III (disorder)"])
          or ( exists (["Condition": "Angina, class IV (disorder)"]) ) )
          and "Procedures Failed"
          and "Enhanced external counterpulsation Referred"
          
define "Full Course Of Therapy":
          if (Count (["Procedure": "Enhanced external counterpulsation (procedure)"]E
              where (Count(["Procedure": "Enhanced external counterpulsation (procedure)"]) = 1 
              or  Count(["Procedure": "Enhanced external counterpulsation (procedure)"]) = 2) and E.performer= "Physician (occupation)" and duration in hours of E.performed =1) = 35 )
           then true
          else false
          
define "Covered":
          "Condition 1" or "Full Course Of Therapy"
          
define "Not Covered":
           not "Covered"  
           
define "Coverage":
           "Covered"      
           
