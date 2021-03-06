//ultrasound diagnostic procedures
library ultrasounddiagnosticprocedures
using FHIR

include FHIRHelpers version '1.8' called FHIRHelpers
//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
valueset "Echoencephalography, A-mode (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Echoencephalography (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Echocardiography for determining pericardial effusion (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Echography, A-mode (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//Ocular and Orbital Sonography (B-Mode) 
valueset "Ocular ultrasound finding (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Cataract surgery (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Echocardiography, real-time with image documentation with M-mode recording, complete (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Diagnostic pericardiocentesis (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Ultrasonic guidance procedure (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Echocardiography (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//Cardiac Valve(s) (M-Mode)
valueset "Pleural effusion (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Thoracentesis (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Echography of abdomen, B-scan, limited (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Echography of abdomen, B-scan, complete (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Aspiration of cyst using ultrasonic guidance (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//Renal Biopsy, by Ultrasonic Guidance.
//Pancreas Sonography (B-Scan)
//Spleen Sonography (B-Scan)
//Abdominal Aorta Echography (A-Mode).
//Abdominal Aorta Sonography (B-Scan).
valueset "Retroperitoneal echography, B-scan, complete (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//Urinary Bladder Sonography (B-Scan).
//Urinary bladder Sonography does not include staging of bladder tumors.
//Pregnancy Diagnosis Sonography (B-Scan).
valueset "Echography, scan B-mode for fetal age determination (procedure)": '2.16.840.1.113762.1.4.1029.51'
valueset "Echography, scan B-mode for fetal growth rate (procedure)": '2.16.840.1.113762.1.4.1029.51'
valueset "CT Guidance for localization of placenta of Uterus": '1.3.6.1.4.1.12009.10.2.5'
//Pregnancy Sonography, Complete (B-Scan).
valueset "Molar pregnancy (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Ectopic pregnancy (disorder)": '2.16.840.1.113883.3.600.1622'
//Passive Testing (Antepartum Monitoring of Fetal Heart Rate In the Resting Fetus).
valueset "Intrauterine contraceptive device procedure (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Pelvic echography, B-scan, complete (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Ultrasonic guidance for amniocentesis (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Doppler ultrasonography of arterial inflow and venous outflow of abdominal, pelvic and retroperitoneal organs (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//Arterial Aneurysm, Peripheral (B-Scan).
//Radiation Therapy Planning Sonography (B-Scan).
valueset "Echography of thyroid, A-mode (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//Thyroid Sonography (B-Scan).
valueset "Echography of breast, A-mode (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Echography of breast, B-scan (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//Hepatic Sonography (B-Scan).
//Gallbladder Sonography.
//Renal Sonography.
//Two-Dimensional Echocardiography (B-Mode)
valueset "Monitoring of cardiac output using continuous esophageal doppler (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Atherosclerosis and Peripheral Arterial Disease" : '2.16.840.1.113762.1.4.1047.21'
valueset "Echography, B-scan (procedure)" : '2.16.840.1.113883.3.88.12.80.28'

parameter MeasurementPeriod default @2007-09-28T00:00:00.0

context Patient

define "Covered": 
	(exists (["DiagnosticReport": "Echoencephalography, A-mode (procedure)"])
		or  (exists (["DiagnosticReport": "Echoencephalography (procedure)"]))
                or  (exists (["DiagnosticReport": "Echocardiography for determining pericardial effusion (procedure)"]))
                or (exists (["DiagnosticReport": "Echography, A-mode (procedure)"]))
		or  (exists (["DiagnosticReport": "Echocardiography, real-time with image documentation with M-mode recording, complete (procedure)"]))
		or  (exists (["DiagnosticReport": "Diagnostic pericardiocentesis (procedure)"]))
		or  (exists (["Procedure": "Ultrasonic guidance procedure (procedure)"]))
		or  (exists (["DiagnosticReport": "Echocardiography (procedure)"]))
		or  (exists (["Condition": "Pleural effusion (disorder)"]))
		or  (exists (["DiagnosticReport": "Thoracentesis (procedure)"]))
		or  (exists (["DiagnosticReport": "Echography of abdomen, B-scan, limited (procedure)"]))
		or  (exists (["DiagnosticReport": "Echography of abdomen, B-scan, complete (procedure)"]))
		or  (exists (["Procedure": "Aspiration of cyst using ultrasonic guidance (procedure)"]))
		or  (exists (["DiagnosticReport": "Retroperitoneal echography, B-scan, complete (procedure)"]))
		or  (exists (["DiagnosticReport": "Echography, scan B-mode for fetal age determination (procedure)"]))
		or  (exists (["DiagnosticReport": "Echography, scan B-mode for fetal growth rate (procedure)"]))
		or  (exists (["Procedure": "CT Guidance for localization of placenta of Uterus"]))
		or  (exists (["Condition": "Molar pregnancy (disorder)"]))
		or  (exists (["Condition": "Ectopic pregnancy (disorder)"]))
		or  (exists (["Procedure": "Intrauterine contraceptive device procedure (procedure)"]))
		or  (exists (["DiagnosticReport": "Pelvic echography, B-scan, complete (procedure)"]))
		or  (exists (["Procedure": "Ultrasonic guidance for amniocentesis (procedure)"]))
		or  (exists (["Procedure": "Doppler ultrasonography of arterial inflow and venous outflow of abdominal, pelvic and retroperitoneal organs (procedure)"]))
		or  (exists (["DiagnosticReport": "Echography of thyroid, A-mode (procedure)"]))
		or  (exists (["DiagnosticReport": "Echography of breast, A-mode (procedure)"]))
		or  (exists (["DiagnosticReport": "Echography of breast, B-scan (procedure)"]))
		or  (exists (["Procedure": "Monitoring of cardiac output using continuous esophageal doppler (regime/therapy)"]))
		)
		
define "Cover":
		"Covered" C during MeasurementPeriod
		
define "Not Covered":
	(exists (["Condition" :'Atherosclerosis and Peripheral Arterial Disease']) and (exists (["Procedure": "Echography, B-scan (procedure)"])))
	
define "Coverage":
	"Covered" and  not "Not Covered"
