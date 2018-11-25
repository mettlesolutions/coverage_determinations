//IntraocularLenses(IOLs)
library ChlamydiaScreening_Common version '2'

using QDM version '5.3'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'

valueset "Cataract extraction and insertion of intraocular lens (procedure)": '2.16.840.1.113883.3.526.2.1527'
valueset "Surgery care (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Medical service (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Referral to surgical service (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Procedure on lens (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Ophthalmic echography, A-mode (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "": ''

context Patient

define "Implantation Services":
            ( exists (["Procedure, Performed": "Referral to surgical service (procedure)"])
            or ( exists (["Procedure, Performed": "Medical service (procedure)"]) )
            or ( exists(["Procedure, Performed": "Medical service (procedure)"]) ) )
            and ( exists (["Diagnostic Study, Performed": "Ophthalmic echography, A-mode (procedure)"]) )
            
define "Covered":
           ( exists (["Procedure, Performed": "Cataract extraction and insertion of intraocular lens (procedure)"])
           or ( exists (["Procedure, Performed": "Procedure on lens (procedure)"]) ) 
           or "Implantation Services")
           
define "Coverage":
          "Covered"
