//Treatment of Drug Abuse (Chemical Dependency)

library TreatmentofDrugAbuse

using FHIR version '1.8'
include FHIRHelpers version '1.8' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'
valueset "Drug abuse (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Detoxification therapy (regime/therapy)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Rehabilitation therapy (regime/therapy)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Hospital admission (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Hospital-based outpatient department (environment)" : '2.16.840.1.113883.3.3157.1002.14'
valueset "Inpatient stay (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
//OutPatient services
valueset "Activation of emergency medical services education (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Laboratory test result abnormal (situation)": '2.16.840.1.113883.3.88.12.3221.7.4'
//Radiology Services
valueset "Computerized axial tomography(procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Fluoroscopy of gastrointestinal tract (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Barium enema (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Magnetic resonance imaging (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Screening mammography (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Nuclear medicine imaging procedure (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Plain chest X-ray (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Positron emission tomography with computed tomography of whole body (procedure)" : '2.16.840.1.113883.3.88.12.80.28'

context Patient

define "OutPatient Services":
		(exists (["ProcedureRequest": "Activation of emergency medical services education (procedure)"])
		or (exists (["ProcedureRequest" :"Laboratory test result abnormal (situation)"]))
		or (exists (["DiagnosticReport": "Computerized axial tomography(procedure)"]))
		or (exists (["DiagnosticReport":"Fluoroscopy of gastrointestinal tract (procedure)"]))
		or (exists (["DiagnosticReport":"Barium enema (procedure)"]))
		or (exists (["DiagnosticReport":"Magnetic resonance imaging (procedure)"]))
		or (exists (["DiagnosticReport":"Screening mammography (procedure)"]))
		or (exists (["Observation" :"Nuclear medicine imaging procedure (procedure)"]))
		or (exists (["DiagnosticReport" :"Plain chest X-ray (procedure)"]))
		or (exists (["DiagnosticReport": "Positron emission tomography with computed tomography of whole body (procedure)"]))
		)

define "Covered":
		(exists (["Condition":"Drug abuse (disorder)"])
		and (exists (["Procedure":"Detoxification therapy (regime/therapy)"])
		or (exists (["Procedure":"Rehabilitation therapy (regime/therapy)"])))
		or (exists (["Condition":"Drug abuse (disorder)"]) and "OutPatient Services" and (exists (["Condition":"Inpatient stay (finding)"])))
		or (exists (["Procedure":"Detoxification therapy (regime/therapy)"])
		or (exists (["Procedure":"Rehabilitation therapy (regime/therapy)"])) 
		and not (exists (["Condition" : "Inpatient stay (finding)"])))
		)
		
define "Coverage":
		"Covered"
		
