//Ambulatory Blood Pressure Monitoring
library AmbulatoryBloodPressureMonitoring
using FHIR
include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.3.88.12.80.28'
codesystem "ICD10CM": '2.16.840.1.113883.6.90'

valueset "24 hr blood pressure monitoring (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Labile hypertension due to being in a clinical environment (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hypertensive disorder, systemic arterial (disorder)": '2.16.840.1.113762.1.4.1018.240'
valueset "Cardiovascular system problem (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hypercalcemia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Renal failure syndrome (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Anemia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Disorder of bone, unspecified": '2.16.840.1.113762.1.4.1116.462'
valueset "Normal pressure hydrocephalus (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Antihypertensive therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Physician (occupation)": '2.16.840.1.113762.1.4.1096.129'
parameter MeasurementPeriod default @2003-07-01T00:00:00.0
context Patient

define "End Organ Damage":
        ( exists (["Condition": "Hypercalcemia (disorder)"])
        or ( exists (["Condition": "Renal failure syndrome (disorder)"]) )
        or ( exists (["Condition": "Anemia (disorder)"]) )  
        or ( exists (["Condition": "Disorder of bone, unspecified"]) )
        )
        
define "Condition 1": 
	( exists ["Observation" : "24 hr blood pressure monitoring (regime/therapy)"] 
	and (exists ["Condition": "Labile hypertension due to being in a clinical environment (disorder)"]) )

define "Condition for cardiovascular risk similar as Normotensive":
       ( exists (["Observation": "24 hr blood pressure monitoring (regime/therapy)"] BP
          where (BP.value) < 135/85 and not "End Organ Damage")
        )
define "Cardiovascular risk similar as Normotensive":
       "Condition for cardiovascular risk similar as Normotensive"  and ( exists (["Condition": "Normal pressure hydrocephalus (disorder)"]) )
       
      
define "Condition for increased Cardiovascular risk":
       ( exists (["Observation": "24 hr blood pressure monitoring (regime/therapy)"] BP1
          where (BP1.value) > 135/85) )
          
define "Condition 3":
           "Condition for increased Cardiovascular risk" and ( exists (["Procedure": "Antihypertensive therapy (procedure)"] AT
           where AT.performer = "Physician (occupation)") )
         
define "Coverage":

     "Condition 1" or "Cardiovascular risk similar as Normotensive" or "Condition 3"


