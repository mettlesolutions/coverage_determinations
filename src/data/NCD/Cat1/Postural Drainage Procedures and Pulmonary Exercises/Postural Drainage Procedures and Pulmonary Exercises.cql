library ChlamydiaScreening_Common version '2'

using QDM version '5.3'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)


codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
valueset "Postural drainage therapy (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Pulmonary rehabilitation (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Respiratory therapist (occupation)": '2.16.840.1.113762.1.4.1096.129'
valueset "Physical Therapy": '2.16.840.1.113883.3.464.1003.118.12.1039'
valueset "Respiratory therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Inpatient care (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Outpatient care management (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Nursing Home or Extended Care Facility": '2.16.840.1.113883.3.666.5.2202'
valueset "Postural drainage therapy (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
//Nursing management
//extended care service
codesystem "NUCCPT": '2.16.840.1.113883.6.101'
valueset ""Respiratory, Developmental, Rehabilitative and Restorative Service Providers"; Physical Therapist": '2.16.840.1.114222.4.11.1066'
codesystem "CPT": '2.16.840.1.113883.6.12'
valueset "Home Healthcare Services": '2.16.840.1.113883.3.464.1003.101.11.1080'
//outpatient physical therapy service
