//Ambulatory Blood Pressure Monitoring
library ChlamydiaScreening_Common version '2'

using QDM version '5.3'

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

context Patient

define "End Organ Damage":
        ( exists (["Diagnosis": "Hypercalcemia (disorder)"])
        or ( exists (["Diagnosis": "Renal failure syndrome (disorder)"]) )
        or ( exists (["Diagnosis": "Anemia (disorder)"]) )  
        or ( exists (["Diagnosis": "Disorder of bone, unspecified"]) )
        )
        
define "Condition 1": 
	( exists (["Assessment, Performed" : "24 hr blood pressure monitoring (regime/therapy)"] 
	union ["Diagnosis": "Labile hypertension due to being in a clinical environment (disorder)"]) )

define "Condition for cardiovascular risk similar as Normotensive":
       ( exists (["Assessment, Performed": "24 hr blood pressure monitoring (regime/therapy)"] BP
          where BP.result < 135/85 and not "End Organ Damage")
        )
define "Cardiovascular risk similar as Normotensive":
       "Condition for cardiovascular risk similar as Normotensive"  and ( exists (["Diagnosis": "Normal pressure hydrocephalus (disorder)"]) )
       
      
define "Condition for increased Cardiovascular risk":
       ( exists (["Assessment, Performed": "24 hr blood pressure monitoring (regime/therapy)"] BP1
          where BP1.result > 135/85) )
          
define "Condition 3":
           "Condition for increased Cardiovascular risk" and ( exists (["Procedure, Performed": "Antihypertensive therapy (procedure)"] AT
           where AT.authorDatetime = "Physician (occupation)") )
         
define "Coverage":

     "Condition 1" or "Cardiovascular risk similar as Normotensive" or "Condition 3"


