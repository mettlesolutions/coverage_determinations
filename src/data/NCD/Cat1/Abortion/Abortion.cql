//Abortion
library Abortion

using FHIR

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
valueset "Pregnancy": '2.16.840.1.113883.3.526.3.378'
valueset "Victim of rape (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Simulation of physical illness (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Physician (occupation)": '2.16.840.1.113762.1.4.1096.129'
valueset "Miscarriage (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Physical health problems (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Physical injury due to physical abuse (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Finding related to risk factor in pregnancy (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Incestuous concubinage with girls (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'


context Patient

define "Conditions Covered":
    ( exists["Condition": "Pregnancy"] and (exists["Condition": "Victim of rape (finding)"])
    or ( exists["Condition": "Pregnancy"] and (exists ["Condition": "Incestuous concubinage with girls (finding)"]) )
   or ( exists["Condition": "Pregnancy"] and (exists ["Condition": "Physical health problems (finding)"]) )
   or ( exists["Condition": "Pregnancy"] and (exists ["Condition": "Physical injury due to physical abuse (disorder)"]) )
   or ( exists["Condition": "Finding related to risk factor in pregnancy (finding)"]) 
    )
   
define "Covered":

 "Conditions Covered" and ( exists (["Procedure": "Miscarriage (disorder)"]) )
 
define "Coverage":
      "Conditions Covered" and "Covered" 
