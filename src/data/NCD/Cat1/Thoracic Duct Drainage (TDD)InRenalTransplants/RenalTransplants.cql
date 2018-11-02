//Thoracic Duct Drainage (TDD) in Renal Transplants
library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT": '2.16.840.1.113883.3.88.12.80.28'
codesystem "ICD10CM": '2.16.840.1.113762.1.4.1138.488'


valueset "Procedure on thoracic duct (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Inpatient stay (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Kidney Transplant": '2.16.840.1.113883.3.464.1003.109.11.1052'
valueset "Kidney Transplant Recipient": '2.16.840.1.113762.1.4.1138.488'
valueset "Awaiting transplantation of kidney (situation)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Renal transplant planned (situation)": '2.16.840.1.113883.3.88.12.3221.7.4'

context Patient

define "InPatient is Covered":
        ( exists (["Procedure, Performed": "Awaiting transplantation of kidney (situation)"])
        or ( exists (["Procedure, Performed": "Renal transplant planned (situation)"]) )
        )
        
define "Covered":
         ( exists (["Diagnosis": "Kidney Transplant Recipient"]) and ( exists (["Procedure, Performed": "Procedure on thoracic duct (procedure)"]) ) )
          
         



