//PosturalDrainageProceduresAndPulmonaryExercises
library PosturalDrainageProceduresAndPulmonaryExercises

using FHIR version '1.8'
include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)


codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
codesystem "CPT": '2.16.840.1.113883.6.12'
codesystem "NUCCPT": '2.16.840.1.113883.6.101'

valueset "Postural drainage therapy (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Pulmonary rehabilitation (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Respiratory therapist (occupation)": '2.16.840.1.113762.1.4.1096.129'
valueset "Physical Therapy": '2.16.840.1.113883.3.464.1003.118.12.1039'
valueset "Respiratory therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Inpatient care (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Outpatient care management (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Nursing Home or Extended Care Facility": '2.16.840.1.113883.3.666.5.2202'
valueset "Respiratory, Developmental, Rehabilitative and Restorative Service Providers": '2.16.840.1.114222.4.11.1066'
valueset "Physical Therapist": '2.16.840.1.114222.4.11.1066'
valueset "Home Healthcare Services": '2.16.840.1.113883.3.464.1003.101.11.1080'
valueset "Under care of clinical nurse specialist (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Severe chronic obstructive pulmonary disease (disorder)": '2.16.840.1.113883.3.464.1003.102.11.1019'
valueset "Referral by respiratory physician (procedure)": '2.16.840.1.113883.3.88.12.80.28'


context Patient

define "Postural drainage":
	( exists (["ProcedureRequest": "Postural drainage therapy (regime/therapy)"]) and ( exists (["Procedure": "Under care of clinical nurse specialist (finding)"]) )
        )
         
define "Severe pulmonary conditions":
	( exists (["Condition": "Severe chronic obstructive pulmonary disease (disorder)"]) and 
	( exists (["Procedure": "Postural drainage therapy (regime/therapy)"]PDT
	 where  PDT.performer = "Physical Therapist" ) ) or (exists (["Procedure":"Postural drainage therapy (regime/therapy)"])
	 and (exists ["Practitioner":"Respiratory therapist (occupation)"]))
	 )
	 
define "Condition for Services covered for physical therapy":
         ( exists (["Encounter": "Inpatient care (regime/therapy)"])
	    or ( exists (["Encounter": "Nursing Home or Extended Care Facility"]) )
	    or ( exists (["Encounter": "Home Healthcare Services"]) )
	    or ( exists (["Encounter": "Outpatient care management (procedure)"]) )
	 )   	 
	 
define "Services covered for physical therapy":
          ( exists (["Procedure": "Physical Therapy"]PT
          where PT.performer = "Physical Therapist") ) and "Condition for Services covered for physical therapy"
         
	 


define "Not Covered":
        ( exists (["Procedure": "Respiratory therapy (procedure)"]RT
          where RT.performer = "Respiratory therapist (occupation)") and ( exists (["Encounter": "Home Healthcare Services"]) )
        )  

define "Coverage":
	"Postural drainage" or "Severe pulmonary conditions" or "Services covered for physical therapy"
