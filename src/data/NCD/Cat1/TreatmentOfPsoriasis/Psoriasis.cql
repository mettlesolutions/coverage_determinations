//Psoriasis
library Psoriasis

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

valueset "Psoriasis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Phototherapy of skin (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Coal Tar": '2.16.840.1.113762.1.4.1010.7'
valueset "Modified Goeckerman regimen (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Ultraviolet light therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Photochemotherapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Corticosteroids": '2.16.840.1.113883.3.464.1003.196.12.1482'

context Patient

define "Conventional Treatment":
         (exists(["MedicationAdministration": "Corticosteroids"])
          or (exists(["Procedure": "Ultraviolet light therapy (procedure)"]) )
          or (exists(["Procedure": "Modified Goeckerman regimen (procedure)"]) )
          )
define "Covered":
          (exists(["Condition": "Psoriasis (disorder)"])) and "Conventional Treatment"
          or (exists(["Condition": "Psoriasis (disorder)"])) and not "Conventional Treatment" 
         and (exists(["Procedure": "Photochemotherapy (procedure)"]) )
          
define "Not Covered":
         (exists ["Procedure": "Photochemotherapy (procedure)"]P
            where duration in days of P.performed > 30)          
 
define "Coverage":
         "Covered" and not "Not Covered"     
          
