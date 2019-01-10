//SeatLift

library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'

valueset "Sitting a patient up in a chair (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Physician (occupation)": '2.16.840.1.113762.1.4.1096.129'
valueset "Bilateral arthritis of hip (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Arthritis of knee (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Muscular dystrophy (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Neuromuscular junction disorder (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "": ''

context Patient

define "Condition 1(Covered)":
         ( exists (["Diagnosis": "Arthritis of knee (disorder)"])
         or ( exists (["Diagnosis": "Bilateral arthritis of hip (disorder)"]) )
         or ( exists (["Diagnosis": "Muscular dystrophy (disorder)"] ) )
         or ( exists (["Diagnosis": "Neuromuscular junction disorder (disorder)"]) ) )
         
define "Covered": 
         "Condition 1(Covered)" and ( exists (["Procedure, Performed": "Sitting a patient up in a chair (procedure)"]SL
            where SL.authorDatetime = "Physician (occupation)") )
            
define "Coverage": 
          "Covered"
