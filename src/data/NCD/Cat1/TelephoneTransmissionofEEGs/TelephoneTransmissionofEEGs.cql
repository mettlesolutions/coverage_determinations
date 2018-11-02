//TelephoneTransmissionofEEGs
library ChlamydiaScreening_Common version '2'

using QDM

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
valueset "Mood swings (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Depressive disorder (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Decrease in appetite (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Increased appetite (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Suicidal thoughts (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "On examination - angry (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Tends to be intolerant of frustration (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Forgetful (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'

//other forms of Epilepsy (disorder)
valueset "Atonic epilepsy (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Tonic-clonic epilepsy (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Atypical absence epilepsy (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'

valueset "Physician (occupation)" : '2.16.840.1.113762.1.4.1096.129'
valueset "Neurology service (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Electroencephalogram (procedure)" : '2.16.840.1.113883.3.88.12.80.28'

context Patient
define "Disstress symptoms":
                  (exists (["Symptom" :  "Mood swings (finding)"])
               		or (exists (["Symptom" : "Depressive disorder (disorder)"]))
 			or (exists (["Symptom" :"Decrease in appetite (finding)"]))
 			or (exists (["Symptom" :"Increased appetite (finding)"]))
			or (exists (["Symptom" : "Suicidal thoughts (finding)" ]))
			or (exists (["Symptom" : "On examination - angry (finding)" ]))
			or (exists (["Symptom" : "Tends to be intolerant of frustration (finding)" ]))
			or (exists (["Symptom" : "Forgetful (finding)" ]))
		)
define "Siezure disorders" :
			(exists(["Diagnosis" : "Atonic epilepsy (disorder)"])
			or (exists(["Diagnosis" :"Tonic-clonic epilepsy (disorder)"]))
			or (exists(["Diagnosis" : "Atypical absence epilepsy (disorder)"]))
			or (exists(["Diagnosis" : "Atypical absence epilepsy (disorder)" ]))
			)

define "Conditions for EEG":
			(exists (["Diagnosis" : "Stuporous depression (disorder)"])
				or (exists (["Diagnosis" : "On examination - comatose (disorder)"]))
				or (exists (["Diagnosis" : "Coma (disorder)"]))
				or (exists (["Diagnosis" :"Bizarre behavior (finding)"]))
				or (exists (["Diagnosis" : "Mental disorder (disorder)" ]))
				or (exists (["Diagnosis" : "Epilepsy (disorder)"]))
				or (exists (["Diagnosis" : "Intracranial tumor (disorder)"]))
				or (exists (["Diagnosis" : "Subdural intracranial hematoma (disorder)"]))
				or (exists (["Diagnosis" : "Migraine (disorder)"]))
				or "Disstress symptoms"
				or "Siezure disorders"
			)

define "Covered":
		"Conditions for EEG" and not (exists (["Diagnosis": "Disorder of brain stem (disorder)"])) and (exists (["Procedure, Performed" : "Electroencephalogram (procedure)"] E
			where E.authorDatetime ="Physician (occupation)") 
			
		)
	
define "Coverage":
		"Covered"

