library CarcinoembryonicAntigen version '1'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Carcinoembryonic antigen monitoring (regime/therapy)":'2.16.840.1.113883.6.96'
valueset "Carcinoma of colon (disorder)":'2.16.840.1.113883.6.96'
valueset "Response to treatment (situation)":'2.16.840.1.113883.6.96'
valueset "Monitoring following treatment for cancer (regime/therapy)":'2.16.840.1.113883.6.96'
valueset "Monitoring response to treatment (regime/therapy)":'2.16.840.1.113883.6.96'
valueset "Using decision making strategies (finding)":'2.16.840.1.113883.6.96'
valueset "Discussion about treatment (procedure)":'2.16.840.1.113883.6.96'
valueset "Developing a treatment plan (procedure)":'2.16.840.1.113883.6.96'
valueset "Evaluating response to treatment (procedure)":'2.16.840.1.113883.6.96'
valueset "Consultation for treatment (procedure)":'2.16.840.1.113883.6.96'
valueset "Tumor site not specified (finding)":'2.16.840.1.113883.6.96'
valueset "Extent of tumor involvement not specified (finding)":'2.16.840.1.113883.6.96'
valueset "Preoperative procedure (procedure)":'2.16.840.1.113883.6.96'
valueset "Postoperative procedure (procedure)":'2.16.840.1.113883.6.96'
valueset "Metastasis from malignant tumor of liver (disorder)":'2.16.840.1.113883.6.96'
valueset "Excision of liver metastasis (procedure)":'2.16.840.1.113883.6.96'
valueset "Carcinoma of colon, stage II (finding)":'2.16.840.1.113883.6.96'
valueset "Carcinoma of colon, stage III (finding)":'2.16.840.1.113883.6.96'
valueset "Metastatic carcinoid tumor (disorder)":'2.16.840.1.113883.6.96'
valueset "Chemotherapy cycle (procedure)":'2.16.840.1.113883.6.96'
valueset "Carcinoembryonic antigen measurement (procedure)":'2.16.840.1.113883.6.96'
valueset "Patient status finding (finding)":'2.16.840.1.113883.6.96'
valueset "At risk for disease progression (finding)":'2.16.840.1.113883.6.96'
valueset "Recurrence of problem (finding)":'2.16.840.1.113883.6.96'
valueset "Laboratory test result abnormal (situation)":'2.16.840.1.113883.6.96'
valueset "Laboratory test not necessary (situation)":'2.16.840.1.113883.6.96'

define "Liver metastatis indication":
	if ((exists(["Diagnosis": "Metastasis from malignant tumor of liver (disorder)"])
		and exists(["Procedure, Performed": "Excision of liver metastasis (procedure)"]))
		and (exists(["Diagnosis": "Carcinoma of colon, stage II (finding)"])
			or exists(["Diagnosis": "Carcinoma of colon, stage III (finding)"])))
	then (exists(["Procedure, Performed": "Postoperative procedure (procedure)"])
		and exists(["Procedure, Performed": "Carcinoembryonic antigen measurement (procedure)"]))
	else false

define "Covered": 
	(exists(["Diagnosis": "Carcinoma of colon (disorder)"])
		and exists(["Procedure, Performed": "Monitoring following treatment for cancer (regime/therapy)"]))
	or (exists(["Assessment, Performed": "Using decision making strategies (finding)"])
		and exists(["Procedure, Performed": "Developing a treatment plan (procedure)"]))
	or (exists(["Assessment, Performed": "Tumor site not specified (finding)"])
		or exists(["Assessment, Performed": "Extent of tumor involvement not specified (finding)"]))
	or ("Liver metastatis indication")
	or (exists(["Diagnosis": "Metastatic carcinoid tumor (disorder)"])
		and exists(["Procedure, Performed": "Carcinoembryonic antigen measurement (procedure)"]CA where CA.components=2))
	
	
define "Coverage": 
	"Covered"
