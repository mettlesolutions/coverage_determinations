//Portable Hand-Held X-Ray Instrument 
library PortableHandHeldXRayInstrument 

using FHIR version '1.8'
include FHIRHelpers version '1.8' called FHIRHelpers


//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
valueset "Portable X-ray (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Physician (occupation)": '2.16.840.1.113762.1.4.1096.129'
parameter MeasurementPeriod default @1986-11-06T00:00:00.0
define "Coverage":
       ( exists (["Procedure": "Portable X-ray (procedure)"] PX
          where PX.performer= "Physician (occupation)"and PX.performed during MeasurementPeriod) )
