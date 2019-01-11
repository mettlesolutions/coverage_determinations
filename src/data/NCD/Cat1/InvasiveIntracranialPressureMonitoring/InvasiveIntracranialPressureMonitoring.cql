//InvasiveIntracranialPressureMonitoring

library InvasiveIntracranialPressureMonitoring
using FHIR
include FHIRHelpers version '1.8' called FHIRHelpers

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
valueset "Viral encephalitis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Intensive care unit (environment)": '2.16.840.1.113762.1.4.1116.226'
valueset "Intensive care neurological disorder (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
//neurosurgical patient
valueset "Encephalopathy, unspecified": '2.16.840.1.113883.3.666.5.1591'
valueset "Viral disease (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'

context Patient

define "Covered":
           ( exists (["Condition": "Unspecified injury of head, initial encounter"])
           or ( exists (["Condition": "Traumatic intracranial subarachnoid hemorrhage (disorder)"]) )
           or ( exists (["Condition": "Nontraumatic intracerebral hemorrhage"]) )
           or ( exists (["Condition": "Reye's syndrome (disorder)"]) ) 
           or ( exists (["Condition": "Metabolic encephalopathy (disorder)"]) ) 
           or ( exists (["Condition": "Intensive care neurological disorder (disorder)"]) ) 
           or ( exists (["Condition": "Encephalopathy, unspecified"]) and ( exists (["Condition": "Viral disease (disorder)"]) ) ) )
           and ( exists (["Procedure": "Intracranial pressure monitoring regime (regime/therapy)"]) )
           
define "Coverage":
          "Covered"
