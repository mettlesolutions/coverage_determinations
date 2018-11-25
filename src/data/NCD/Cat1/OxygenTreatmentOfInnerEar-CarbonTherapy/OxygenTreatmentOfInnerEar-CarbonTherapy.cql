//OxygenTreatmentOfInnerEar-CarbonTherapy

library ChlamydiaScreening_Common version '2'

using QDM version '5.3'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "RXNORM": '2.16.840.1.113762.1.4.1010.2'

valueset "Oxygen 95 %": '2.16.840.1.113762.1.4.1010.2'
valueset "Carbon Dioxide 5 %": '2.16.840.1.113762.1.4.1010.2'
valueset "Endolymphatic hydrops (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hearing loss (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "": ''


context Patient

define "Not Covered":
          if ( exists (["Diagnosis": "Endolymphatic hydrops (disorder)"]) and ( exists (["Diagnosis": "Hearing loss (disorder)"]) ) )
           then ( exists (["Substance, Administered": "Oxygen 95 %"]) and ( exists (["Substance, Administered": "Carbon Dioxide 5 %"]) ) )
          else null  
          
define "Coverage":
              not "Not Covered"   
             
