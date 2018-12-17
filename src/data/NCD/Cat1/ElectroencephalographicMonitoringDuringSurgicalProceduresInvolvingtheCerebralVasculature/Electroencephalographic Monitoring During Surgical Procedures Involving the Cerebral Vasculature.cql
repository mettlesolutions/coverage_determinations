//Electroencephalographic Monitoring During Surgical Procedures Involving the Cerebral Vasculature

library ElectroencephalographicMonitoringDuringSurgicalProceduresInvolvingtheCerebralVasculature

using FHIR

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
codesystem "NUCCPT" : '2.16.840.1.113883.6.101'

//gross cerebral blood flow
valueset "Under general anesthesia (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Electroencephalographic procedure (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Cerebral ischemia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Intracranial/cerebral perfusion pressure monitoring (regime/therapy)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Carotid endarterectomy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Repair of aneurysm (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Neurologic Procedure S": '2.16.840.1.113883.3.666.5.1939'
valueset "Intracranial/cerebral perfusion pressure monitoring (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Induced hypotension (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset '"Technologists, Technicians & Other Technical Service Providers"; "Technician, Other", EEG': '2.16.840.1.114222.4.11.1066'


context Patient

define "Condition 1":
		(exists (["Condition" :"Under general anesthesia (finding)"])
		and (exists (["Procedure" : "Electroencephalographic procedure (procedure)"]))
		)
		
define "Condition 2" :
		(exists (["Procedure" : "Intracranial/cerebral perfusion pressure monitoring (regime/therapy)"])
		and (exists (["Procedure" : "Electroencephalographic procedure (procedure)"]))
		and (exists (["Observation" : "Electroencephalographic procedure (procedure)"]))
		or (exists (["Observation" : '"Technologists, Technicians & Other Technical Service Providers"; "Technician, Other", EEG']))
		)
define "Condition 3":
		(exists (["Procedure" : "Carotid endarterectomy (procedure)"])
		and (exists (["Procedure" : "Neurologic Procedure S"]))
		and (exists (["Procedure":"Repair of aneurysm (procedure)"]))
		and (exists (["Procedure" : "Induced hypotension (procedure)" ]))
		and (exists (["Procedure" : "Electroencephalographic procedure (procedure)"]))
		)
		
define "Coverage":
		"Condition 1" and "Condition 2" or "Condition 3"
