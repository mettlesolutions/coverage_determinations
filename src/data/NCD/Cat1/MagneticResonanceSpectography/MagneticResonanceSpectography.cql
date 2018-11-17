//MagneticResonanceSpectography

library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'

valueset "Magnetic resonance spectroscopy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Brain Tumor": '2.16.840.1.113883.17.4077.2.1026'
valueset "Lesion of brain (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Biopsy of brain tissue (procedure)": '2.16.840.1.113883.3.88.12.80.28'

context Patient

define "Condition 1(Not Covered)":
         ( exists (["Diagnosis": "Lesion of brain (finding)"]) 
         and ( exists (["Diagnostic Study, Performed": "Magnetic resonance spectroscopy (procedure)"]) ) )
         
define "Condition 2(Not Covered)": 
          ( exists (["Diagnosis": "Brain Tumor"])
          and ["Diagnostic Study, Performed": "Magnetic resonance spectroscopy (procedure)"] in ["Procedure, Performed": "Biopsy of brain tissue (procedure)"])
          
define "Not Covered":
          "Condition 1(Not Covered)" or "Condition 2(Not Covered)"
          
define "Coverage":
          not "Not Covered"
