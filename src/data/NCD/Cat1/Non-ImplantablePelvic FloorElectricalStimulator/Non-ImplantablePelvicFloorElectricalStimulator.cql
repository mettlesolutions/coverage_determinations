//Non-Implantable Pelvic Floor Electrical Stimulator
library NonImplantablePelvicFloorElectricalStimulator

using FHIR
include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT": '2.16.840.1.113883.3.88.12.80.28'
codesystem "ICD10CM": '2.16.840.1.113883.6.90'

valueset "Pelvic floor exercises (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
//non-implantable stimulator
valueset "Acute stress disorder (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Urge incontinence of urine (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Electromyography of pelvic floor (procedure)": '2.16.840.1.113883.3.88.12.80.28'

context Patient

define "Procedure for Pelvic Floor Exercise":
         ["Procedure": "Pelvic floor exercises (regime/therapy)"]

define "Indications and Limitations":
      not  ( exists (["Procedure": "Pelvic floor exercises (regime/therapy)"]) )
         and ( exists (["Condition": "Acute stress disorder (disorder)"]) and ( exists (["Condition": "Urge incontinence of urine (finding)"]) ) )
         "Procedure for Pelvic Floor Exercise"
         
define "Coverage":
        "Indications and Limitations"
