library ChlamydiaScreening_Common version '2'

using QDM version '5.3'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "NUCCPT": '2.16.840.1.113883.6.101'
valueset "Transportation Services; Ambulance": '2.16.840.1.114222.4.11.1066'
valueset "Ambulatory Health Care Facilities; Clinic/Center, "Rehabilitation, Comprehensive Outpatient Rehabilitation Facility (CORF)"": '2.16.840.1.114222.4.11.1066'
valueset "Ambulatory Health Care Facilities; Clinic/Center, Critical Access Hospital": '2.16.840.1.114222.4.11.1066'
valueset "Ambulatory Health Care Facilities; Clinic/Center, Federally Qualified Health Center (FQHC)": '2.16.840.1.114222.4.11.1066'
valueset "Eye and Vision Services Providers; Optometrist": '2.16.840.1.114222.4.11.1066'
valueset "Podiatric Medicine & Surgery Service Providers; Podiatrist": '2.16.840.1.114222.4.11.1066'
valueset "": ''

codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
valueset "Ambulatory surgery center (environment)": '2.16.840.1.113883.3.666.5.687'
valueset "Tumor-associated antigen (substance)": '2.16.840.1.113762.1.4.1010.2'
valueset "Hemophilia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Blood clotting factor adverse reaction (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Certified registered nurse anesthetist (occupation)": '2.16.840.1.113762.1.4.1099.14'
valueset "Chiropractor (occupation)": '2.16.840.1.113762.1.4.1099.14'
valueset "Referral to clinical nurse specialist (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Referral to clinical social worker (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Dentist (occupation)": '2.16.840.1.113762.1.4.1099.14'
valueset "Outpatient procedure (procedure)": '2.16.840.1.113883.3.3157.1002.14'
valueset "Miscellaneous diagnostic tests (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Plain radiography (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Durable medical equipment surveillance (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Erythropoietin therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Cataract surgery (procedure)": '2.16.840.1.113883.3.526.3.1411'
valueset "Hepatitis B Vaccine Administered": '2.16.840.1.113883.3.464.1003.110.11.1112'
valueset "Referral to home health care service (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Hospice care (regime/therapy)": '2.16.840.1.113883.3.3157.1004.23'
valueset "Immunosuppressant drug therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Influenza vaccination (procedure)": '2.16.840.1.113883.3.666.5.498'
valueset "Referral to orthotics service (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Referral to nurse practitioner (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Orthotic procedure (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Prosthetic surgical material (substance)": '2.16.840.1.113762.1.4.1010.2'
valueset "Osteoporosis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Physician assistant (occupation)": '2.16.840.1.113762.1.4.1096.129'
valueset "Physician service (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Radium therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Radioactive isotope (substance)": '2.16.840.1.113762.1.4.1010.2'
valueset "": ''

codesystem "HCPCS": '2.16.840.1.113883.6.285'
valueset "Dialysis Services": '2.16.840.1.113883.3.464.1003.109.11.1027'
valueset "Kidney Transplant": '2.16.840.1.113883.3.464.1003.109.11.1052'
valueset "": ''

//Artificial Legs, Arms, and Eyes
//Audiology services
//Bone Mass Measurement
//valueset "Referral to nurse midwife (procedure)": '2.16.840.1.113883.11.20.9.56'
valueset "Other Service Providers; Midwife": '2.16.840.1.114222.4.11.1066'
//Colorectal Cancer screening test
//Diabetes Outpatient Self-Management Training
//codesystem "HCPCS": '2.16.840.1.113883.6.285'
//valueset "Diabetes outpatient self-management training services, individual, per 30 minutes	": '2.16.840.1.113762.1.4.1095.80'
//Diagnostic Laboratory Tests
//Drugs and Biologicals
//Extended Care Services
valueset "": ''
//Home Dialysis Supplies and Equipment
//Incident to a physician's professional Service
//Inpatient Hospital Services
//Inpatient Psychiatric Hospital Services
//Medical Nutrition Therapy Services
//Oral anticancer drug
//Oral Antiemetic Drugs
//Outpatient Hospital Services Incident to a Physician's Service
//Outpatient Occupational Therapy Services
//Outpatient Physical Therapy Services
//Outpatient Speech Language Pathology Services
codesystem "CVX": '2.16.840.1.113883.12.292'
valueset "Pneumococcal Vaccine": '2.16.840.1.113883.3.464.1003.110.11.1095'

codesystem "ICD9CM": '2.16.840.1.113883.6.103'
valueset "Encounter for change or removal of surgical wound dressing": '2.16.840.1.113883.3.666.5.2194'
valueset "": ''
