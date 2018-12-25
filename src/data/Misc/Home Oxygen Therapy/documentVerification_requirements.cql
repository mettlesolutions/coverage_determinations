library HomeOxygenTherapy version '1'

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
codesystem "EntityNamePartQualifier": '2.16.840.1.113883.11.20.9.26'
codesystem "LOINC": '2.16.840.1.113762.1.4.1099.13'
codesystem "NUCCPT":'2.16.840.1.114222.4.11.1066'

valueset "Home oxygen therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Blood gas analysis (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Hospitalization": '2.16.840.1.113762.1.4.1164.40'
valueset "Inpatient stay (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Discharge from Inpatient Facility": '2.16.840.1.113762.1.4.1138.721'
valueset "Encounter Hospital Outpatient": '2.16.840.1.113883.3.3157.1002.1'
valueset "Oxygen saturation measurement, arterial (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Oxygen measurement, partial pressure, arterial (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Long-term oxygen therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Clinical trial (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Encounter Inpatient": '2.16.840.1.113883.3.666.5.307'
valueset "Patient's condition stable (finding)": '2.16.840.1.113762.1.4.1096.114'
valueset "Practitioner certification status (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Treatment stopped - alternative therapy undertaken (situation)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Oxygen therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//Accessories, maintenance, and repairs of patient-owned oxygen
valueset "Liquid oxygen (substance)": '2.16.840.1.113762.1.4.1010.2'
//doctor of osteopathy
//podiatric surgeon
valueset "Oxygen (substance)": '2.16.840.1.113762.1.4.1010.2'
valueset "Device (physical object)": '2.16.840.1.113762.1.4.1181.3'
valueset "Mobile in home (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Does not move (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Gaseous substance (substance)": '2.16.840.1.113762.1.4.1010.2'
valueset "Arterial oxygen concentration measurement (procedure)": '2.16.840.1.113883.3.88.12.80.28'

valueset "Laboratory reporting, electronic (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Verifying presence of prosthetics (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Seen by orthotics service (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Patient condition assessed (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Home oxygen therapy management (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//Date Of Service
//Duration of condition
valueset "Illness (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Clinical examination education (procedure)": '2.16.840.1.113883.11.20.9.34'
valueset "Patient's condition worsened (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Patient's condition improved (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Conditional prognosis (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
//Results of the blood gas study,(Need to find)--> either printed data from the test or written in the notes
valueset "Home Care": '2.16.840.1.113883.1.11.20275'
//Nature and extent of functional limitations
valueset "Therapeutic regimen (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Gathering of past medical history (procedure)": '2.16.840.1.113762.1.4.1096.118'
//Other pertinent information
//Photocopy
//standard Medicare Detailed Written Order
// knowledge and documentation of the face-to-face examination
valueset "Provision of talking monitored dosage system (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Route of Administration": '2.16.840.1.113762.1.4.1018.98'
//Frequency of use
valueset "Infusion (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//valueset "Quantity finding (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'(Quantity to be dispensed)
//Number of refills
//physician review, sign, and date it
//National Provider Identifier
//Signature Date
//Is permitted to perform services in accordance with State law
valueset "Documentation of personal medication record (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Administration of prescribed medications based on arterial blood gas results (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Advance Care Plan": '2.16.840.1.113762.1.4.1116.468'
valueset "Assessment for home oxygen therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Physician (occupation)": '2.16.840.1.113762.1.4.1096.129'
valueset "Medical doctor (occupation)": '2.16.840.1.113762.1.4.1166.24'
valueset "Nurse practitioner (occupation)": '2.16.840.1.113762.1.4.1096.129'
valueset "Physician assistant (occupation)": '2.16.840.1.113762.1.4.1096.129'
valueset "Face to Face Encounter": '2.16.840.1.113762.1.4.1047.428'
valueset "In-person encounter (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Renewal of prescription (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Referral to clinical nurse specialist (procedure)": '2.16.840.1.113883.3.464.1003.101.12.1046'
valueset "Nursing evaluation of patient and report (procedure)": '2.16.840.1.113883.3.464.1003.101.12.1061'
valueset "Seen by clinical nurse specialist (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Prescription by nurse practitioner (situation)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Seen by nurse practitioner (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Seen by physician (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Referred by physician assistant (finding)": '2.16.840.1.113762.1.4.1096.216'
valueset "Encounter Face to Face": '2.16.840.1.113762.1.4.1111.78'
valueset "Prescription (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Change of prescription (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Evaluation AND/OR management - new patient (procedure)": '2.16.840.1.113883.3.2286'
valueset "Medicare (Non-managed Care)": '2.16.840.1.114222.4.11.3591'
valueset "National provider ID": '2.16.840.1.113762.1.4.1099.13'
valueset "Patient registration (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "replaces": '2.16.840.1.113883.11.20.9.62'
valueset "Suppliers; Durable Medical Equipment & Medical Supplies, Oxygen Equipment & Supplies": '2.16.840.1.114222.4.11.1066'
valueset "Change recommended (qualifier value)": '2.16.840.1.113762.1.4.1096.204'
valueset "Domestic responsibility rehabilitation (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Preparation of medical certificate (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Medical service (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Documentation procedure (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Previous treatment repeat (situation)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Treatment completed (situation)": '2.16.840.1.113762.1.4.1047.220'
valueset "Replacement of device (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Revision of internal fixation device, broken or displaced (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Respiratory flow rate measured (situation)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "EntityPersonNamePartQualifier": '2.16.840.1.113883.11.20.9.26'
valueset "APTA Registry Data Elements":'2.16.840.1.113762.1.4.1099.13'
valueset "initial": '2.16.840.1.113883.11.20.9.26'
valueset "title": '2.16.840.1.113883.11.20.9.26'
valueset "Attending physician (occupation)":'2.16.840.1.113762.1.4.1099.14'
valueset "Checking patient identity (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Confirming patient identity prior to procedure (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Date of onset - Reported":'2.16.840.1.113883.6.1'
valueset "Patient identifier":'2.16.840.1.113883.6.1'
valueset "Durable medical equipment surveillance (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
//valueset "Suppliers; Durable Medical Equipment & Medical Supplies, Oxygen Equipment & Supplies": '2.16.840.1.114222.4.11.1066'
valueset "Durable medical equipment education, guidance, and counseling (procedure)": '2.16.840.1.113762.1.4.1099.13'
valueset "Durable medical equipment case management (procedure)": '2.16.840.1.113762.1.4.1099.13'
valueset "Medical equipment or device education (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Provision of medical equipment (procedure)": '2.16.840.1.113762.1.4.1099.13'
valueset "Medical equipment assessment (procedure)": '2.16.840.1.113762.1.4.1099.13'
valueset "Ensuring home equipment available prior to hospital discharge (procedure)": '2.16.840.1.113762.1.4.1099.13'
valueset "Prescribed medication education (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Medication commenced (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Procedure aiding diagnosis (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Primary diagnosis":'2.16.840.1.113762.1.4.1099.13'
valueset "Secondary diagnosis":'2.16.840.1.113762.1.4.1099.13'
valueset "Functional movement disorder (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Evaluating interventions (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Past history of procedure (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Equipment in use (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Equipment requirement (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Equipment related features (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'

code "Equipment related features (finding) code": '405655001' from "SNOMEDCT" display 'Equipment related features (finding)'
code "Equipment requirement (finding) code": '698532002' from "SNOMEDCT" display 'Equipment requirement (finding)'
code "Equipment in use (finding) code": '397917005' from "SNOMEDCT" display 'Equipment in use (finding)'
code "Durable medical equipment education, guidance, and counseling (procedure) code": '410286008' from "SNOMEDCT" display 'Durable medical equipment education, guidance, and counseling (procedure)'
code "Past history of procedure (situation) code": '416940007' from "SNOMEDCT" display 'Past history of procedure (situation)'
code "Functional movement disorder (disorder) code": '718362003' from "SNOMEDCT" display 'Functional movement disorder (disorder)'
code "Secondary diagnosis code": '81885-6' from "LOINC" display 'Secondary diagnosis'
code "Primary diagnosis code": '18630-4' from "LOINC" display 'Primary diagnosis'
code "Procedure aiding diagnosis (procedure) code": '165167006' from "SNOMEDCT" display 'Procedure aiding diagnosis (procedure)'
code "Blood gas analysis (procedure) code": '278297009' from "SNOMEDCT" display 'Blood gas analysis (procedure)'
code "Encounter Face to Face code": '20160302' from "SNOMEDCT" display 'Encounter Face to Face'
code "Seen by physician (finding) code": '305660003' from "SNOMEDCT" display 'Seen by physician (finding)'
code "Seen by clinical nurse specialist (finding) code": '305733002' from "SNOMEDCT" display 'Seen by clinical nurse specialist (finding)'
code "Seen by nurse practitioner (finding) code": '305757002' from "SNOMEDCT" display 'Seen by nurse practitioner (finding)'
code "Referred by physician assistant (finding) code": '2051000124106' from "SNOMEDCT" display 'Referred by physician assistant (finding)'
code "Home oxygen therapy (procedure) code": '426990007' from "SNOMEDCT" display 'Home oxygen therapy (procedure)'
code "Encounter Inpatient code": '20170504' from "SNOMEDCT" display 'Encounter Inpatient'
code "Encounter Hospital Outpatient code": '20151013' from "SNOMEDCT" display 'Encounter Hospital Outpatient'
code "initial code": 'IN' from "EntityNamePartQualifier" display 'initial'
code "title code": 'TITLE' from "EntityNamePartQualifier" display 'title'
code "Checking patient identity (procedure) code": '710958003' from "SNOMEDCT" display 'Checking patient identity (procedure)'
code "Confirming patient identity prior to procedure (procedure) code": '372040007' from "SNOMEDCT" display 'Confirming patient identity prior to procedure (procedure)'
code "Attending physician (occupation) code": '405279007' from "SNOMEDCT" display 'Attending physician (occupation)'
code "National provider ID code": '45952-9' from "LOINC" display 'National provider ID'
code "Illness (finding) code": '39104002' from "SNOMEDCT" display 'Illness (finding)'
code "Patient's condition worsened (finding) code": '271299001' from "SNOMEDCT" display "Patient's condition worsened (finding)"
code "Patient's condition improved (finding) code": '268910001' from "SNOMEDCT" display "Patient's condition improved (finding)"
code "Conditional prognosis (finding) code": '60484009' from "SNOMEDCT" display 'Conditional prognosis (finding)'
code "Mobile in home (finding) code": '302000008' from "SNOMEDCT" display 'Mobile in home (finding)'
code "Gathering of past medical history (procedure) code": '451571000124102' from "SNOMEDCT" display 'Gathering of past medical history (procedure)'
code "Therapeutic regimen (regime/therapy) code": '133877004' from "SNOMEDCT" display 'Therapeutic regimen (regime/therapy)'
code "Administration of prescribed medications based on arterial blood gas results (procedure) code": '370774005' from "SNOMEDCT" display 'Administration of prescribed medications based on arterial blood gas results (procedure)'
code "Ambulatory Health Care Facilities; Clinic/Center, Federally Qualified Health Center (FQHC) code": '261QF0400X' from "NUCCPT" display 'Ambulatory Health Care Facilities; Clinic/Center, Federally Qualified Health Center (FQHC)'
code "Evaluating interventions (procedure) code": '225303001' from "SNOMEDCT" display 'Evaluating interventions (procedure)'

concept "Equipment related features (finding)": {"Equipment related features (finding) code"} display 'Equipment related features (finding)'
concept "Equipment requirement (finding)": {"Equipment requirement (finding) code"} display 'Equipment requirement (finding)'
concept "Equipment in use (finding)": {"Equipment in use (finding) code"} display 'Equipment in use (finding)'
concept "Durable medical equipment education, guidance, and counseling (procedure)": {"Durable medical equipment education, guidance, and counseling (procedure) code"} display 'Durable medical equipment education, guidance, and counseling (procedure)'
concept "Past history of procedure (situation)": {"Past history of procedure (situation) code"} display 'Past history of procedure (situation)'
concept "Evaluating interventions (procedure)": {"Evaluating interventions (procedure) code"} display 'Evaluating interventions (procedure)'
concept "Functional movement disorder (disorder)": {"Functional movement disorder (disorder) code"} display 'Functional movement disorder (disorder)'
concept "Ambulatory Health Care Facilities; Clinic/Center, Federally Qualified Health Center (FQHC)": {"Ambulatory Health Care Facilities; Clinic/Center, Federally Qualified Health Center (FQHC) code"}display 'Ambulatory Health Care Facilities; Clinic/Center, Federally Qualified Health Center (FQHC)'
concept "Secondary diagnosis": {"Secondary diagnosis code"} display 'Secondary diagnosis'
concept "Primary diagnosis": {"Primary diagnosis code"} display 'Primary diagnosis'
concept "Procedure aiding diagnosis (procedure)": {"Procedure aiding diagnosis (procedure) code"} display 'Procedure aiding diagnosis (procedure)'
concept "Blood gas analysis (procedure)": {"Blood gas analysis (procedure) code"} display 'Blood gas analysis (procedure)'
concept "Encounter Face to Face": {"Encounter Face to Face code"} display 'Encounter Face to Face'
concept "Seen by physician (finding)": {"Seen by physician (finding) code"} display 'Seen by physician (finding)'
concept "Seen by clinical nurse specialist (finding)": {"Seen by clinical nurse specialist (finding) code"} display 'Seen by clinical nurse specialist (finding)'
concept "Seen by nurse practitioner (finding)": {"Seen by nurse practitioner (finding) code"} display 'Seen by nurse practitioner (finding)'
concept "Referred by physician assistant (finding)": {"Referred by physician assistant (finding) code"} display 'Referred by physician assistant (finding)'
concept "Home oxygen therapy (procedure)": {"Home oxygen therapy (procedure) code"} display 'Home oxygen therapy (procedure)'
concept "Encounter Inpatient": {"Encounter Inpatient code"} display 'Encounter Inpatient'
concept "Encounter Hospital Outpatient": {"Encounter Hospital Outpatient code"} display 'Encounter Hospital Outpatient'
concept "initial": {"initial code"} display 'initial'
concept "title": {"title code"} display 'title'
concept "Checking patient identity (procedure)": {"Checking patient identity (procedure) code"} display 'Checking patient identity (procedure)'
concept "Confirming patient identity prior to procedure (procedure)": {"Confirming patient identity prior to procedure (procedure) code"} display 'Confirming patient identity prior to procedure (procedure)'
concept "Attending physician (occupation)": {"Attending physician (occupation) code"} display 'Attending physician (occupation)'
concept "National provider ID": {"National provider ID code"} display 'National provider ID'
concept "Illness (finding)": {"Illness (finding) code"} display 'Illness (finding)'
concept "Patient's condition worsened (finding)": {"Patient's condition worsened (finding) code"} display "Patient's condition worsened (finding)"
concept "Patient's condition improved (finding)": {"Patient's condition improved (finding) code"} display "Patient's condition improved (finding)"
concept "Conditional prognosis (finding)": {"Conditional prognosis (finding) code"} display 'Conditional prognosis (finding)'
concept "Mobile in home (finding)": {"Mobile in home (finding) code"} display 'Mobile in home (finding)'
concept "Gathering of past medical history (procedure)": {"Gathering of past medical history (procedure) code"} display 'Gathering of past medical history (procedure)'
concept "Therapeutic regimen (regime/therapy)": {"Therapeutic regimen (regime/therapy) code"} display 'Therapeutic regimen (regime/therapy)'
concept "Administration of prescribed medications based on arterial blood gas results (procedure)": {"Administration of prescribed medications based on arterial blood gas results (procedure) code"} display 'Administration of prescribed medications based on arterial blood gas results (procedure)'

context Patient

define "Physician":
	[Practitioner: "Attending physician (occupation)"]Py
	where Py.identifier.id = "National provider ID"
	return Py.qualification.code

define "Encounter Conduct":
	{"Encounter": "Encounter Face to Face",
	"Encounter": "Seen by physician (finding)",
	"Encounter": "Seen by clinical nurse specialist (finding)",
	"Encounter": "Seen by nurse practitioner (finding)",
	"Encounter": "Referred by physician assistant (finding)"}

define "Medical Record":
	{"DiagnosticReport":"Primary diagnosis",
	"Condition":"Illness (finding)",
	"Observation": "Patient's condition worsened (finding)",
	"Observation": "Patient's condition improved (finding)",
	"Observation": "Mobile in home (finding)",
	"ClinicalImpression":"Conditional prognosis (finding)",
	"Procedure": "Blood gas analysis (procedure)",
	"MedicationAdministration":"Administration of prescribed medications based on arterial blood gas results (procedure)",
	"Condition": "Functional movement disorder (disorder)",
	"Procedure": "Evaluating interventions (procedure)",
	"Observation": "Past history of procedure (situation)",
	"Procedure": "Gathering of past medical history (procedure)"
	}

define "Practitioner Signature":
	'e-prescription containing digital Signature of the Pratitioner and date'

define "WOPD Details Required":
	{"Patient":Patient.name.given + ' ' + Patient.name.family,
	"Practitioner":"Physician",
	"DeviceRequest":"Equipment requirement (finding)",
	"DeviceUseStatement":"Equipment in use (finding)",
	"Observation": "Equipment related features (finding)",
	"Procedure": "Home oxygen therapy (procedure)",
	"Organization":"National provider ID",
	"Procedure": "Durable medical equipment education, guidance, and counseling (procedure)"
	}

define "Face-to-Face Encounter":
	"Encounter Conduct"
	union "WOPD Details Required"
	union "Practitioner Signature"

define "Documentations Required":
	"Face-to-Face Encounter"
	union "Medical Record"