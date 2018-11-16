//ThermalIntradiscalProcedures (TIPs)

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

valueset "Percutaneous intradiscal electrothermal annuloplasty using fluoroscopic guidance (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Low Back Pain": '2.16.840.1.113883.3.3157.1905'
valueset "Destruction of lesion or structure by radiofrequency (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//Heat therapy (procedure)

context Patient

define "Procedures":
         ( exists (["Procedure, Performed": "Destruction of lesion or structure by radiofrequency (procedure)"])
         and ( exists (["Procedure, Performed": "Percutaneous intradiscal electrothermal annuloplasty using fluoroscopic guidance (procedure)"]) ) )

define "Not Covered":
          ( exists (["Diagnosis": "Low Back Pain"])
          and "Procedures" )

