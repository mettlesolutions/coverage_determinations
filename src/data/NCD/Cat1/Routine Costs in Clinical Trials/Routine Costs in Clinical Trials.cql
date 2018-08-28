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
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
valueset "Ambulatory surgery center (environment)": '2.16.840.1.113883.3.666.5.687'
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
codesystem "RXNORM": '2.16.840.1.113883.6.96'
valueset "Tumor-associated antigen (substance)": '2.16.840.1.113762.1.4.1010.2'
//Artificial Legs, Arms, and Eyes
//Audiology services
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
valueset "Hemophilia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Blood clotting factor adverse reaction (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
//Bone Mass Measurement
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
//valueset "Referral to nurse midwife (procedure)": '2.16.840.1.113883.11.20.9.56'
valueset "Other Service Providers; Midwife": '2.16.840.1.114222.4.11.1066'
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
valueset "Certified registered nurse anesthetist (occupation)": '2.16.840.1.113762.1.4.1099.14'
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
valueset "Chiropractor (occupation)": '2.16.840.1.113762.1.4.1099.14'
valueset "Referral to clinical nurse specialist (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Referral to clinical social worker (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//Colorectal Cancer screening test
codesystem "NUCCPT": '2.16.840.1.113883.6.101'
valueset "Ambulatory Health Care Facilities; Clinic/Center, "Rehabilitation, Comprehensive Outpatient Rehabilitation Facility (CORF)"": '2.16.840.1.114222.4.11.1066'
valueset "Ambulatory Health Care Facilities; Clinic/Center, Critical Access Hospital": '2.16.840.1.114222.4.11.1066'
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
valueset "Dentist (occupation)": '2.16.840.1.113762.1.4.1099.14'
//Diabetes Outpatient Self-Management Training
//codesystem "HCPCS": '2.16.840.1.113883.6.285'
//valueset "Diabetes outpatient self-management training services, individual, per 30 minutes	": '2.16.840.1.113762.1.4.1095.80'
//Diagnostic Laboratory Tests
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
valueset "Outpatient procedure (procedure)": '2.16.840.1.113883.3.3157.1002.14'
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
valueset "Miscellaneous diagnostic tests (procedure)": '2.16.840.1.113883.3.88.12.80.28'
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
valueset "Plain radiography (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//Drugs and Biologicals
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
valueset "Durable medical equipment surveillance (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
valueset "Erythropoietin therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//Extended Care Services
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
codesystem "CPT": '2.16.840.1.113883.6.96'
valueset "": ''
valueset "Cataract surgery (procedure)": '2.16.840.1.113883.3.526.3.1411'
codesystem "NUCCPT": '2.16.840.1.113883.6.101'
valueset "Ambulatory Health Care Facilities; Clinic/Center, Federally Qualified Health Center (FQHC)": '2.16.840.1.114222.4.11.1066'
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
codesystem "CPT": '2.16.840.1.113883.6.96'
valueset "Hepatitis B Vaccine Administered": '2.16.840.1.113883.3.464.1003.110.12.1042'
//Home Dialysis Supplies and Equipment
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
valueset "Referral to home health care service (procedure)": '2.16.840.1.113883.3.88.12.80.28'
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
codesystem "CPT": '2.16.840.1.113883.6.96'
valueset "Hospice care (regime/therapy)": '2.16.840.1.113883.3.3157.1004.23'
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
valueset "Immunosuppressant drug therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//Incident to a physician's professional Service
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
valueset "Influenza vaccination (procedure)": '2.16.840.1.113883.3.666.5.498'
//Inpatient Hospital Services
//Inpatient Psychiatric Hospital Services
codesystem "HCPCS": '2.16.840.1.113883.6.285'
valueset "Dialysis Services": '2.16.840.1.113883.3.464.1003.109.11.1027'
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
valueset "Referral to orthotics service (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//Medical Nutrition Therapy Services
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
valueset "Referral to nurse practitioner (procedure)": '2.16.840.1.113883.3.88.12.80.28'
codesystem "NUCCPT": '2.16.840.1.113883.6.101'
valueset "Eye and Vision Services Providers; Optometrist": '2.16.840.1.114222.4.11.1066'
//Oral anticancer drug
//Oral Antiemetic Drugs
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
valueset "Orthotic procedure (procedure)": '2.16.840.1.113883.3.88.12.80.28'
codesystem "RXNORM": '2.16.840.1.113883.6.96'
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
valueset "Prosthetic surgical material (substance)": '2.16.840.1.113762.1.4.1010.2'
codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
valueset "Osteoporosis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
//Outpatient Hospital Services Incident to a Physician's Service

