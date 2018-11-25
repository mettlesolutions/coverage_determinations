//SleepTestingForObstructiveSleepApnea(OSA)

library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT": '2.16.840.1.113883.3.88.12.80.28'

valueset "Obstructive sleep apnea syndrome (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Sleep apnea assessment (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Physician (occupation)": '2.16.840.1.113762.1.4.1096.129'
valueset "Sleep electroencephalogram, all night (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Electroencephalogram (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Electro-oculogram examination (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Electromyography (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Electrocardiographic procedure (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Oxygen saturation measurement, arterial (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Sleep studies (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Determination of resistance to airflow (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Oximetry (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//peripheral arterial tone
//actigraphy
valueset "": ''

parameter "MeasurementPeriod" Interval<DateTime>
parameter "Channels" Integer

context Patient

define "Electroencephalogram":
           if exists (["Procedure, Performed": "Electroencephalogram (procedure)"])
            then Channels=Channels +1
           else null
           
define "Electro-oculogram examination":  
          if ( exists (["Procedure, Performed": "Electro-oculogram examination (procedure)"]) )
            then Channels = Channels+1
          else null
          
define "Electromyography":
          if ( exists (["Procedure, Performed": "Electromyography (procedure)"]) )
             then Channels = Channels+1
          else null
          
define "Electrocardiography":
           if ( exists (["Procedure, Performed": "Electrocardiographic procedure (procedure)"]) )
               then Channels = Channels+1
           else null
           
define "Oxygen saturation measurement, arterial":
             if ( exists (["Procedure, Performed": "Oxygen saturation measurement, arterial (procedure)"]) )
                 then Channels = Channels+1
             else null
                 
define "Type I(PSG)(Covered)":
        ( exists (["Diagnosis": "Obstructive sleep apnea syndrome (disorder)"]) 
          and ( exists (["Procedure, Performed": "Sleep studies (procedure)"]) ) )
          
define "Type II(PSG)(Covered)":
             ( exists (["Diagnosis": "Obstructive sleep apnea syndrome (disorder)"]) 
             and ( exists (["Procedure, Performed": "Sleep studies (procedure)"]) ) )
             or ( exists (["Diagnosis": "Obstructive sleep apnea syndrome (disorder)"]) 
             and not( exists (["Procedure, Performed": "Sleep studies (procedure)"]) ) )
             
define "Type IV Sleeping Test": 
           if (Channels >=3 and "Type II(PSG)(Covered)")
              then true
           else null
           
define "Condition 4(Covered)":
           "Type IV Sleeping Test" and ( exists (["Procedure, Performed": "Oximetry (procedure)"]) )
           
define "Covered":
          "Type I(PSG)(Covered)" or "Type II(PSG)(Covered)" or "Type IV Sleeping Test" or "Condition 4(Covered)"
          
define "Coverage":
           "Covered"
