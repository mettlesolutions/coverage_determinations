//Pediatric Liver Transplantation
library ChlamydiaScreening_Common version '2'

using QDM version '5.3'

codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
codesystem "ICD9CM": '2.16.840.1.113883.6.103'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Transplantation of liver (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Congenital biliary atresia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "End stage liver disease (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Viremia (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Pediatric emergency hospital admission (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Malignant tumor of extrahepatic bile duct (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Biliary atresia": '2.16.840.1.113883.6.103'

parameter "MeasurementPeriod" Interval<DateTime>

context Patient

define "In Demographic":
  	AgeInYearsAt(start of MeasurementPeriod) <= 18

define "Indications":
	"In Demographic" and 
	( exists (["Diagnosis": "Biliary atresia"])
        or ( exists (["Diagnosis": "Congenital biliary atresia (disorder)"]) )
        or ( exists (["Diagnosis": "End stage liver disease (disorder)"]) )
        or ( exists (["Procedure, Performed": "Transplantation of liver (procedure)"]) )
        )
          
define "Limitations":
	"In Demographic" and         
       ( exists (["Diagnosis": "Viremia (finding)"])
        or ( exists (["Diagnosis": "Malignant tumor of extrahepatic bile duct (disorder)"]) )
        )
                
define "Coverage":
         "Indications" and not "Limitations"
