//Treatment of Drug Abuse (Chemical Dependency)


library ChlamydiaScreening_Common version '2'

using QDM

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
		(exists (["Procedure, Recommended": "Activation of emergency medical services education (procedure)"])
		or (exists (["Procedure, Recommended" :"Laboratory test result abnormal (situation)"]))
		or (exists (["Diagnostic Study, Performed": "Computerized axial tomography(procedure)"]))
		or (exists (["Diagnostic Study, Performed":"Fluoroscopy of gastrointestinal tract (procedure)"]))
		or (exists (["Diagnostic Study, Performed":"Barium enema (procedure)"]))
		or (exists (["Diagnostic Study, Performed":"Magnetic resonance imaging (procedure)"]))
		or (exists (["Diagnostic Study, Performed":"Screening mammography (procedure)"]))
		or (exists (["Laboratory Test, Performed" :"Nuclear medicine imaging procedure (procedure)"]))
		or (exists (["Diagnostic Study, Performed" :"Plain chest X-ray (procedure)"]))
		or (exists (["Diagnostic Study, Performed": "Positron emission tomography with computed tomography of whole body (procedure)"]))
		)

define "Covered":
		(exists (["Diagnosis":"Drug abuse (disorder)"])
		and (exists (["Procedure, Performed":"Detoxification therapy (regime/therapy)"])
		or (exists (["Procedure, Performed":"Rehabilitation therapy (regime/therapy)"])))
		or (exists (["Diagnosis":"Drug abuse (disorder)"]) and "OutPatient Services" and (exists (["Diagnosis":"Inpatient stay (finding)"])))
		or (exists (["Procedure, Performed":"Detoxification therapy (regime/therapy)"])
		or (exists (["Procedure, Performed":"Rehabilitation therapy (regime/therapy)"])) 
		and not (exists (["Diagnosis" : "Inpatient stay (finding)"])))
		)
		
define "Coverage":
		"Covered"
		
