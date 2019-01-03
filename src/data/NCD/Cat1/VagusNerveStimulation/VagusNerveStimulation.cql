//Vagus Nerve Stimulation (VNS)
library VagusNerveStimulation 

using FHIR
include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT": '2.16.840.1.113883.3.88.12.80.28'

valueset "Insertion of vagal nerve stimulator (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Partial seizure (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Surgery care (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Depressive disorder (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Failed moderate sedation during procedure, initial encounter": '2.16.840.1.113883.3.3157.1411'
valueset "Seizure disorder (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'

parameter MeasurementPeriod default @2007-05-04T00:00:00.0
parameter MeasurementPeriod1 default @1999-07-01T00:00:00.0

context Patient

define "Condition (Covered)":
           ( exists (["Condition": "Partial seizure (disorder)"]) and not (exists (["ProcedureRequest": "Surgery care (regime/therapy)"])) )
           or ( exists (["Condition": "Partial seizure (disorder)"]) and ( exists (["Procedure": "Failed moderate sedation during procedure, initial encounter"]P
           where P.performed during MeasurementPeriod) )
           )
           
define "Covered":
         "Condition (Covered)" and ( exists (["Procedure": "Insertion of vagal nerve stimulator (procedure)"]V
         where V.performed on or after MeasurementPeriod1) )   
         
define "Condition(Not Covered)":
        (exists ["Condition" :"Seizure disorder (disorder)"]
       	and  not (exists (["ProcedureRequest": "Surgery care (regime/therapy)"])) )
        or (exists ["Condition" :"Seizure disorder (disorder)"]
       and not ( exists (["Procedure": "Failed moderate sedation during procedure, initial encounter"]P
           where P.performed during MeasurementPeriod) )
           )
           
define "Not Covered":
	"Condition(Not Covered)"
        and (exists ["Condition": "Depressive disorder (disorder)"])
        and (exists ["Procedure": "Insertion of vagal nerve stimulator (procedure)"] V
        where V.performed on or after MeasurementPeriod)
         
define "Coverage":
         "Covered" and "Not Covered"
          
