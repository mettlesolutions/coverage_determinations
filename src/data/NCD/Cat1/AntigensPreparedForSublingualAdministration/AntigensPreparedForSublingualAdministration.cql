//AntigensPreparedForSublingualAdministration

library AntigensPreparedForSublingualAdministration
using FHIR
include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
codesystem "ICD10CM": '2.16.840.1.113883.6.90'

valueset "Administration of substance via sublingual route (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Antigen (substance)": '2.16.840.1.113762.1.4.1010.2'
valueset "Injection (procedure)": '2.16.840.1.113883.3.88.12.80.28'


parameter MeasurementPeriod default Interval[
@1996-11-17T00:00:00.0,
null
 )

context Patient

define "Covered":
           ( exists (["MedicationAdministration": "Antigen (substance)"]) 
           and ( exists (["Procedure": "Injection (procedure)"]I
            where I.performed during MeasurementPeriod) ) )
           
define "Not Covered":
             ( exists (["MedicationAdministration": "Antigen (substance)"]) 
             and ( exists (["Procedure": "Administration of substance via sublingual route (procedure)"]A
              where A.performed during MeasurementPeriod) ) )
              
define "Coverage":
          "Covered" and not "Not Covered"
         

