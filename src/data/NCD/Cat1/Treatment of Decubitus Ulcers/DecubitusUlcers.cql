//Treatment of decubitus ulcer
library Treatmentofdecubitusulcer

using FHIR version '1.8'
include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
codesystem "RXNORM": '2.16.840.1.113883.6.88'

valueset "Pressure ulcer (disorder)": '2.16.840.1.113883.3.2066.2046'
valueset "Hydrotherapy (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Ultraviolet light therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Castor Oil / Peruvian balsam": '2.16.840.1.113762.1.4.1010.7'
valueset "Direct current therapy (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Hyperbaric oxygen therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'

context Patient

define "Covered":
         (exists (["Condition": "Pressure ulcer (disorder)"])
         and (exists ["Procedure": "Hydrotherapy (regime/therapy)"]) )

define "Not Covered":
      (exists(["Condition": "Pressure ulcer (disorder)"]) and (exists ["Procedure": "Ultraviolet light therapy (procedure)"])
        or ( exists(["Condition": "Pressure ulcer (disorder)"]) and (exists  ["Procedure": "Direct current therapy (regime/therapy)"]) )
        or ( exists(["Condition": "Pressure ulcer (disorder)"]) and (exists  ["Procedure": "Hyperbaric oxygen therapy (procedure)"]) )
        or ( exists(["Condition": "Pressure ulcer (disorder)"]) and (exists  ["MedicationAdministration": "Castor Oil / Peruvian balsam"]) )
      )  
       
define "Coverage":
        "Covered" and  "Not Covered"
