library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Ambulatory/ED Visit": '2.16.840.1.113883.3.464.1003.101.12.1061'
valueset "Blood Pressure Visit": '2.16.840.1.113883.3.464.1003.101.12.1056'

parameter "Measurement Period" Interval<DateTime>

context Patient

define "Target Encounters":
   ["Encounter, Performed": "Ambulatory/ED Visit"] union ["Encounter, Performed": "Blood Pressure Visit"]
   
define "ABPM":
  ["Procedure, Performed": "Blood Pressure Visit"]ProcedureAlias
     where ProcedureAlias.relevantPeriod > 24 hours
     
     
define "WhiteCoatHypertension":
  ["Procedure, Performed": "Blood Pressure Visit"]P
     and P.result > 140/90 'mm of Hg'
     
define "Relevant Encounters":
  exists (["Procedure, Performed": "Blood Pressure Visit"]C  where Interval[C."onsetDateTime" , C."abatementDateTime"] overlaps "Measurement Period")
   and C.facilityLocation >2
   and C.result <  140/90 'mm of Hg'
