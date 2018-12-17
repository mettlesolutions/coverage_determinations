library CarcinoembryonicAntigen version '1'

using FHIR

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": 'http://snomed.info/sct'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "ICD9CM": 'https://www.cdc.gov/nchs/icd/icd9.htm'
codesystem "RXNORM": 'https://www.nlm.nih.gov/research/umls/rxnorm/'

valueset "Carcinoembryonic Antigen Test":'2.16.840.1.113762.1.4.1116.35'
valueset "Carcinoembryonic antigen monitoring (regime/therapy)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Carcinoma of colon (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Response to treatment (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Monitoring following treatment for cancer (regime/therapy)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Monitoring response to treatment (regime/therapy)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Using decision making strategies (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Discussion about treatment (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Developing a treatment plan (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Evaluating response to treatment (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Consultation for treatment (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Tumor site not specified (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Extent of tumor involvement not specified (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Preoperative procedure (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Postoperative procedure (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Metastasis from malignant tumor of liver (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Excision of liver metastasis (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Carcinoma of colon, stage II (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Carcinoma of colon, stage III (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Metastatic carcinoid tumor (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Chemotherapy cycle (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Carcinoembryonic antigen measurement (procedure)":'2.16.840.1.113883.3.88.12.80.28'
valueset "Patient status finding (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "At risk for disease progression (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Recurrence of problem (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Laboratory test result abnormal (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Laboratory test not necessary (situation)":'2.16.840.1.113883.3.88.12.3221.7.4'

define "Liver metastatis indication":
	if ((exists([Condition: "Metastasis from malignant tumor of liver (disorder)"])
		and exists([Procedure: "Excision of liver metastasis (procedure)"]))
		and (exists([Condition: "Carcinoma of colon, stage II (finding)"])
			or exists([Condition: "Carcinoma of colon, stage III (finding)"])))
	then (exists([Procedure: "Postoperative procedure (procedure)"])
		and exists([Procedure: "Carcinoembryonic antigen measurement (procedure)"]))
	else false

define "Covered":
	if (exists([Procedure: "Carcinoembryonic Antigen Test"])
	and ((exists([Condition: "Carcinoma of colon (disorder)"])
		and exists([Procedure: "Monitoring following treatment for cancer (regime/therapy)"]))
		or (exists([Observation: "Using decision making strategies (finding)"])
			and exists([Procedure: "Developing a treatment plan (procedure)"]))
		or (exists([Observation: "Tumor site not specified (finding)"])
			or exists([Observation: "Extent of tumor involvement not specified (finding)"]))
		or ("Liver metastatis indication")
		or (exists([Condition: "Metastatic carcinoid tumor (disorder)"])
			and exists([Procedure: "Carcinoembryonic antigen measurement (procedure)"]))))
	then true
	else false
	
	
define "Coverage": 
	"Covered"
