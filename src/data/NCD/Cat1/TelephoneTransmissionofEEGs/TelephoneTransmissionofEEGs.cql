//TelephoneTransmissionofEEGs
library TelephoneTransmissionofEEGs

using FHIR

include FHIRHelpers version '1.8' called FHIRHelpers
//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'
valueset "Stuporous depression (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "On examination - comatose (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Coma (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Bizarre behavior (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Mental disorder (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Epilepsy (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Intracranial tumor (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Subdural intracranial hematoma (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Migraine (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Disorder of brain stem (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
//disstress symptoms


valueset "Physician (occupation)" : '2.16.840.1.113762.1.4.1096.129'
valueset "Neurology service (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Electroencephalogram (procedure)" : '2.16.840.1.113883.3.88.12.80.28'

valueset "Seizure disorder (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'

context Patient
		
define "Conditions for EEG":
			(exists (["Condition" : "Stuporous depression (disorder)"])
				or (exists (["Condition" : "On examination - comatose (disorder)"]))
				or (exists (["Condition" : "Coma (disorder)"]))
				or (exists (["Condition" :"Bizarre behavior (finding)"]))
				or (exists (["Condition" : "Mental disorder (disorder)" ]))
				or (exists (["Condition" : "Epilepsy (disorder)"]))
				or (exists (["Condition" : "Intracranial tumor (disorder)"]))
				or (exists (["Condition" : "Subdural intracranial hematoma (disorder)"]))
				or (exists (["Condition" : "Migraine (disorder)"]))
				or (exists (["Condition" : "Seizure disorder (disorder)"]))
			)

define "Covered":
		"Conditions for EEG" and not (exists (["Condition": "Disorder of brain stem (disorder)"])) and (exists (["Procedure" : "Electroencephalogram (procedure)"] E
			where E.performer ="Physician (occupation)") 
			
		)
	
define "Coverage":
		"Covered"

