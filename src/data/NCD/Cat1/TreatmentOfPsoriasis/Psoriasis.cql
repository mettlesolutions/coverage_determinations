//Psoriasis
library ChlamydiaScreening_Common version '2'

using QDM

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
          ["Medication, Administered": "Corticosteroids"]
          or ["Procedure, Performed": "Ultraviolet light therapy (procedure)"]
          or ["Procedure, Performed": "Modified Goeckerman regimen (procedure)"]

define "Covered":
          ["Diagnosis": "Psoriasis (disorder)"] union "Conventional Treatment"
          or ["Diagnosis": "Psoriasis (disorder)"] union not "Conventional Treatment"
          union ["Procedure, Performed": "Photochemotherapy (procedure)"]
          
define "Not Covered":
         ["Procedure, Performed": "Photochemotherapy (procedure)"]P
            where P.relevantPeriod > 30 'Days'          
 
define "Coverage":
         "Covered" union not "Not Covered"         
          
