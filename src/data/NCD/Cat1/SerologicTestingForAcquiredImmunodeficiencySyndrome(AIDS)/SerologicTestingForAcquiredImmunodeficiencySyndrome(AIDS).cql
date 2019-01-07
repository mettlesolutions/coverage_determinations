library SerologicTestingForAcquiredImmunodeficiencySyndrome

using FHIR

include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": 'http://snomed.info/sct'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "ICD9CM": 'https://www.cdc.gov/nchs/icd/icd9.htm'
codesystem "RXNORM": 'https://www.nlm.nih.gov/research/umls/rxnorm/'

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
           ( exists ([Condition: "Abnormal weight loss associated with acquired immunodeficiency syndrome (finding)"])
           or ( exists ([Condition: "Relapsing fever (disorder)"]) )
           or ( exists ([Condition: "Night sweats (finding)"]) )
           or ( exists ([Condition: "Tiredness symptom (finding)"]) )
           or ( exists ([Condition: "Pneumonia (disorder)"]) )
           or ( exists ([Condition: "Transient memory loss (finding)"]) )
           or ( exists ([Condition: "Neck swelling (finding)"]) )
           )
           
define "Tests for Acquired Immunodeficiency Syndrome":
         ( exists ([Observation: "Serologic test (procedure)"])
         or ( exists ([Observation: "Antibody; HTLV or HIV antibody, confirmatory test (eg, Western Blot)"]) )
         or ( exists ([Observation: "Anticomplement immunofluorescence test (procedure)"]) ) )
           
define "Covered":
          "Symptoms Of AIDS" and "Tests for Acquired Immunodeficiency Syndrome"
          
define "Not Covered": 
         "Tests for Acquired Immunodeficiency Syndrome" and not "Symptoms Of AIDS"
