//InvasiveIntracranialPressureMonitoring

library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'
codesystem "ICD10CM": '2.16.840.1.113883.6.90'

valueset "Intracranial pressure monitoring regime (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Unspecified injury of head, initial encounter": '2.16.840.1.113883.17.4077.2.1017'
valueset "Traumatic intracranial subarachnoid hemorrhage (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Nontraumatic intracerebral hemorrhage": '2.16.840.1.113762.1.4.1179.5'
valueset "Reye's syndrome (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Metabolic encephalopathy (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Postnatal hypoxic encephalopathy (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
//viral encephalopathy
valueset "Intensive care unit (environment)": '2.16.840.1.113762.1.4.1116.226'
valueset "Intensive care neurological disorder (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
//neurosurgical patient
valueset "": ''

context Patient

define "Covered":
           ( exists (["Diagnosis": "Unspecified injury of head, initial encounter"])
           or ( exists (["Diagnosis": "Traumatic intracranial subarachnoid hemorrhage (disorder)"]) )
           or ( exists (["Diagnosis": "Nontraumatic intracerebral hemorrhage"]) )
           or ( exists (["Symptom": "Reye's syndrome (disorder)"]) ) 
           or ( exists (["Diagnosis": "Metabolic encephalopathy (disorder)"]) ) 
           or ( exists (["Diagnosis": "Intensive care neurological disorder (disorder)"]) ) )
           and ( exists (["Procedure, Performed": "Intracranial pressure monitoring regime (regime/therapy)"]) )
           
define "Coverage":
          "Covered"


