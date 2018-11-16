//Intraoperative Ventricular Mapping

library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'
valueset "Wolff-Parkinson-White pattern (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Supraventricular tachycardia (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Ventricular tachycardia (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Bundle of His recording (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Open heart surgery (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Ventricular pre-excitation (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Congenital heart disease (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Bundle branch block (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Electrocardiographic monitoring (procedure)" : '2.16.840.1.113883.3.88.12.80.28'

context Patient
		
define "Process 1":
		(exists (["Diagnosis":"Bundle branch block (disorder)"])
		and (exists (["Diagnosis":"Congenital heart disease (disorder)"]))
		and  (exists ["Procedure, Performed":"Bundle of His recording (procedure)" included in ["Procedure, Performed":"Open heart surgery (procedure)"]])
		)
		
define "Coverage" :
		(exists (["Diagnosis" : "Wolff-Parkinson-White pattern (disorder)"])
		and (exists (["Diagnosis": "Ventricular pre-excitation (disorder)"]))
		and "Process 1" and (exists (["Diagnosis" : "Ventricular tachycardia (disorder)"]))
		and (exists (["Diagnosis":"Supraventricular tachycardia (disorder)"]))
		and (exists (["Laboratory Test, Performed" : "Electrocardiographic monitoring (procedure)"]))
		)
