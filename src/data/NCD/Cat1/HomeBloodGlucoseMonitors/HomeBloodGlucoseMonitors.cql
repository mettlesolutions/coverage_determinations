//HomeBloodGlucoseMonitors

library ChlamydiaScreening_Common version '2'

using QDM version '5.3'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
codesystem "ICD10CM": '2.16.840.1.113883.6.90'
codesystem "RoleCode": '2.16.840.1.113883.5.111'

valueset "Blood glucose monitoring (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Finding of blood glucose level (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Diabetes": '2.16.840.1.113883.3.464.1003.103.11.1002'
valueset "Home care of patient (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Preparation of medical certificate (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Visual impairment (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "High": '2.16.840.1.113883.17.4077.2.1039'
valueset "Education about blood glucose monitor (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "self": '2.16.840.1.113883.1.11.19563'
valueset "Physician (occupation)": '2.16.840.1.113762.1.4.1096.129'
//Clinical use
//Lancets
//reagent strips
valueset "parent": '2.16.840.1.113883.1.11.19563'
valueset "Documentation procedure (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Provision for visual and hearing impairment (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "": ''

context Patient

            
define "Patient Experience":
             ( exists (["Patient Care Experience": "Blood glucose monitoring (regime/therapy)"]) 
                 or ( exists (["Encounter, Performed": "parent"]) and ( exists (["Procedure, Performed": "Blood glucose monitoring (regime/therapy)"]) ) ) )
                 
define "Home blood glucose monitors Conditions":
            ( exists (["Diagnosis": "Diabetes"])
            and ( exists (["Procedure, Performed": "Documentation procedure (procedure)"]) ) and "Patient Experience" 
            and ( exists (["Procedure, Performed": "Blood glucose monitoring (regime/therapy)"]) and ( exists (["Encounter, Performed": "Home care of patient (regime/therapy)"]) ) ) )
            
define "Covered 1":
            ( exists (["Diagnosis": "Visual impairment (disorder)"])
            and ( exists(["Procedure, Performed": "Blood glucose monitoring (regime/therapy)" includes ["Procedure, Performed": "Provision for visual and hearing impairment (procedure)"]]) ) )
            
define "Condition for special blood glucose monitoring system": 
             if ( exists (["Diagnosis": "Visual impairment (disorder)"]V
              where V.severity = "High") )
              then ( exists (["Procedure, Performed": "Blood glucose monitoring (regime/therapy)"]) and ( exists (["Provider Characteristic": "Physician (occupation)"]) ) )
             else false
              
define "special blood glucose monitoring system":
           "Home blood glucose monitors Conditions" and ( exists (["Procedure, Performed": "Preparation of medical certificate (procedure)"]) and "Condition for special blood glucose monitoring system" )
            
define "Covered":
          "Home blood glucose monitors Conditions" or "Covered 1"
         
define "Coverage":
          "Covered"         
          
