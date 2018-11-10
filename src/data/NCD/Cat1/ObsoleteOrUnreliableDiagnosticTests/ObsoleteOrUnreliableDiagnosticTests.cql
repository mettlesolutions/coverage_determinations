//ObsoleteOrUnreliableDiagnosticTests
library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)
codesystem "SNOMEDCT": '2.16.840.1.113883.3.88.12.80.28'
codesystem "ICD10CM": '2.16.840.1.113883.6.90'

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
         ( exists (["Substance, Administered": "Amylase isoenzyme (substance)"])
         or ( exists (["Substance, Administered": "Zinc sulfate (substance)"]) )
         or ( exists (["Procedure, Performed": "Serum chromium level (procedure)"]) )
         or ( exists (["Diagnosis": "Cat-scratch disease"]) )
         or ( exists (["Diagnosis": "Lymphogranuloma venereum (disorder)"]) )
         or ( exists (["Procedure, Performed": "Circulation time, one test (procedure)"]) )
         or ( exists (["Laboratory Test, Performed": "Congo red test (procedure)"]) )
         or ( exists (["Laboratory Test, Performed": "Adrenocorticotropic hormone measurement (procedure)"]) )
         or ( exists (["Diagnosis": "Actinomycosis, unspecified"]) )
         or ( exists (["Procedure, Performed": "Brucellosis skin test (procedure)"]) )
         or ( exists (["Procedure, Performed": "Psittacosis antibody level (procedure)"]) )
         or ( exists (["Procedure, Performed": "Pepsins measurement (procedure)"]) )
         or ( exists (["Procedure, Performed": "Capillary fragility test (procedure)"]) )
         or ( exists (["Procedure, Performed": "Colloidal gold test (procedure)"]) )
         )
         
define "Diagnostic Test": 
         ["Procedure, Performed": "Services For Diagnostic Test"]S
         where S.authorDatetime = "Physician (occupation)"


define "Phonocardiographic Diagnostic Test":
          ( exists (["Diagnostic Study, Performed": "Phonocardiogram with electrocardiogram lead (procedure)"])
          or ( exists (["Diagnostic Study, Performed": "Phonocardiogram with artery and/or vein tracing (procedure)"]) )
          or ( exists (["Diagnostic Study, Performed": "Phonocardiogram with apex cardiogram (procedure)"]) ) 
          or ( exists (["Diagnostic Study, Performed": "Intracardiac phonocardiogram (procedure)"]) ) )
          
define "Vectorcardiogram Diagnostic Test":
         ( exists (["Diagnostic Study, Performed": "Electrocardiogram with vectorcardiogram (procedure)"]) 
         or ( exists (["Diagnostic Study, Performed": "Vectorcardiogram (procedure)"]) ) )

define "Not Covered":
          "Phonocardiographic Diagnostic Test" or "Vectorcardiogram Diagnostic Test"
          
define "Coverage":
          "Diagnostic Test"
