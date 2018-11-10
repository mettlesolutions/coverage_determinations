//SerologicTestingForAcquiredImmunodeficiencySyndrome(AIDS)

library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
codesystem "ICD10CM": '2.16.840.1.113883.3.526.2.183'
codesystem "CPT": '2.16.840.1.113883.6.12'

valueset "Abnormal weight loss associated with acquired immunodeficiency syndrome (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Relapsing fever (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Night sweats (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Tiredness symptom (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Pneumonia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Transient memory loss (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Neck swelling (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Serologic test (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Antibody; HTLV or HIV antibody, confirmatory test (eg, Western Blot)": '2.16.840.1.113762.1.4.1142.60'
valueset "Anticomplement immunofluorescence test (procedure)": '2.16.840.1.113883.3.88.12.80.28'



context Patient

define "Symptoms Of AIDS":
           ( exists (["Symptom": "Abnormal weight loss associated with acquired immunodeficiency syndrome (finding)"])
           or ( exists (["Symptom": "Relapsing fever (disorder)"]) )
           or ( exists (["Symptom": "Night sweats (finding)"]) ) 
           or ( exists (["Symptom": "Tiredness symptom (finding)"]) ) 
           or ( exists (["Symptom": "Pneumonia (disorder)"]) ) 
           or ( exists (["Symptom": "Transient memory loss (finding)"]) ) 
           or ( exists (["Symptom": "Neck swelling (finding)"]) ) 
           )
           
define "Tests for Acquired Immunodeficiency Syndrome":
         ( exists (["Laboratory Test, Performed": "Serologic test (procedure)"])
         or ( exists (["Laboratory Test, Performed": "Antibody; HTLV or HIV antibody, confirmatory test (eg, Western Blot)"]) )
         or ( exists (["Laboratory Test, Performed": "Anticomplement immunofluorescence test (procedure)"]) ) )
           
define "Covered":
          "Symptoms Of AIDS" and "Tests for Acquired Immunodeficiency Syndrome"
          
define "Not Covered": 
         "Tests for Acquired Immunodeficiency Syndrome" and not "Symptoms Of AIDS"
