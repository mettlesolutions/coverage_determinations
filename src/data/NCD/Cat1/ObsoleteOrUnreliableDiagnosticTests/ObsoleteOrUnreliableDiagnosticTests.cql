library ObsoleteOrUnreliableDiagnosticTests

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
codesystem "ICD10CM": '2.16.840.1.113883.6.90'
codesystem "NUCCPT":''

valueset "Amylase isoenzyme (substance)": '2.16.840.1.113762.1.4.1010.9'
//electrophoretic
valueset "Serum chromium level (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//Guanase
valueset "Zinc sulfate (substance)": '2.16.840.1.113762.1.4.1010.2'
valueset "Cat-scratch disease": '2.16.840.1.113883.3.666.5.696'
valueset "Lymphogranuloma venereum (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Circulation time, one test (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//Cephalin flocculation
valueset "Congo red test (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Adrenocorticotropic hormone measurement (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//Hormones, adrenocorticotropin quantitative bioassay
//Thymol turbidity, blood,
valueset "Actinomycosis, unspecified": '2.16.840.1.113883.3.666.5.903'
valueset "Brucellosis skin test (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Psittacosis antibody level (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Trichinellosis (Disorders) (SNOMED)": '2.16.840.1.113762.1.4.1146.202'
//Calcium, feces, 24-hour quantitative,
valueset "CHYMOTRYPSIN": '2.16.840.1.113762.1.4.1010.1'
valueset "Pepsins measurement (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Capillary fragility test (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Colloidal gold test (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//Bendien's test for cancer and tuberculosis
//Bolen's test for cancer
//Rehfuss test for gastric acidity
//Serum seromucoid assay for cancer
valueset "Phonocardiographic AND/OR vectorcardiographic procedure (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Phonocardiogram with electrocardiogram lead (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Phonocardiogram with electrocardiogram lead, interpretation and report (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Phonocardiogram with artery and/or vein tracing (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Intracardiac phonocardiogram (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Electrocardiogram with vectorcardiogram (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Vectorcardiogram (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Physician (occupation)": '2.16.840.1.113762.1.4.1096.129'
valueset "Phonocardiogram (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//Phonocardiogram; interpretation and report only
//Phonocardiogram; without interpretation and report,
//Phonocardiogram; interpretation and report,
//Phonocardiogram; tracing only, without interpretation and report
valueset "Phonocardiogram with apex cardiogram (procedure)": '2.16.840.1.113883.3.88.12.80.28'

context Patient


define "Services For Diagnostic Test":
         ( exists ([MedicationAdministration: "Amylase isoenzyme (substance)"])
         or ( exists ([MedicationAdministration: "Zinc sulfate (substance)"]) )
         or ( exists ([Procedure: "Serum chromium level (procedure)"]) )
         or ( exists ([Condition: "Cat-scratch disease"]) )
         or ( exists ([Condition: "Lymphogranuloma venereum (disorder)"]) )
         or ( exists ([Procedure: "Circulation time, one test (procedure)"]) )
         or ( exists ([Observation: "Congo red test (procedure)"]) )
         or ( exists ([Observation: "Adrenocorticotropic hormone measurement (procedure)"]) )
         or ( exists ([Condition: "Actinomycosis, unspecified"]) )
         or ( exists ([Procedure: "Brucellosis skin test (procedure)"]) )
         or ( exists ([Procedure: "Psittacosis antibody level (procedure)"]) )
         or ( exists ([Procedure: "Pepsins measurement (procedure)"]) )
         or ( exists ([Procedure: "Capillary fragility test (procedure)"]) )
         or ( exists ([Procedure: "Colloidal gold test (procedure)"]) )
         )

define "Diagnostic Test":
         exists([Procedure: "Services For Diagnostic Test"])
         and exists([Practitioner: "Physician (occupation)"])


define "Phonocardiographic Diagnostic Test":
          ( exists ([DiagnosticReport: "Phonocardiogram with electrocardiogram lead (procedure)"])
          or ( exists ([DiagnosticReport: "Phonocardiogram with artery and/or vein tracing (procedure)"]) )
          or ( exists ([DiagnosticReport: "Phonocardiogram with apex cardiogram (procedure)"]) )
          or ( exists ([DiagnosticReport: "Intracardiac phonocardiogram (procedure)"]) ) )
          
define "Vectorcardiogram Diagnostic Test":
         ( exists ([DiagnosticReport: "Electrocardiogram with vectorcardiogram (procedure)"])
         or ( exists ([DiagnosticReport: "Vectorcardiogram (procedure)"]) ) )

define "Not Covered":
          "Phonocardiographic Diagnostic Test" or "Vectorcardiogram Diagnostic Test"
          
define "Coverage":
          "Diagnostic Test"
