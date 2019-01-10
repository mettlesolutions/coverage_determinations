library PediatricLiverTransplantation

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
	( exists ([Condition: "Biliary atresia"])
        or ( exists ([Condition: "Congenital biliary atresia (disorder)"]) )
        or ( exists ([Condition: "End stage liver disease (disorder)"]) )
        or ( exists ([Procedure: "Transplantation of liver (procedure)"]) )
        )
          
define "Limitations":
	"In Demographic" and         
       ( exists ([Condition: "Viremia (finding)"])
        or ( exists ([Condition: "Malignant tumor of extrahepatic bile duct (disorder)"]) )
        )
                
define "Coverage":
         "Indications" and not "Limitations"
