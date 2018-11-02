//NeuromuscularElectricalStimulaton (NMES)
library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'
valueset "Muscle atrophy (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Splinting of muscles (finding)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Contracture of multiple joints (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Total replacement of hip (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Spinal cord injury (disorder)" :'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Therapeutic electrical stimulation for bone healing (regime/therapy)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Neuromuscular stimulation (regime/therapy)" : '2.16.840.1.113883.3.88.12.80.28'


valueset "Implantation of cardiac pacemaker (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Neuromuscular scoliosis (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Osteoporosis (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Eruption of skin (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Cancer" :'2.16.840.1.113883.3.526.2.1079'
valueset "Autonomic hyperreflexia of bladder (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'


context Patient

define "Conditions to cover":
		(exists(["Diagnosis" :"Muscle atrophy (disorder)"])
			or(exists ["Diagnosis" : "Splinting of muscles (finding)"])
			or(exists ["Diagnosis" : "Contracture of multiple joints (disorder)"])
			or(exists ["Procedure, Performed" : "Total replacement of hip (procedure)"])
			or(exists ["Diagnosis" : "Spinal cord injury (disorder)"])
			or(exists ["Procedure, Performed" : "Therapeutic electrical stimulation for bone healing (regime/therapy)"])
		)
define "Covered":
		"Conditions to cover" and (exists (["Device, Applied": "Neuromuscular stimulation (regime/therapy)"]) )
		
define "Not Covered":
	(exists (["Diagnosis" :"Implantation of cardiac pacemaker (procedure)"])
			or(exists ["Diagnosis" : "Neuromuscular scoliosis (disorder)"])
			or(exists ["Diagnosis" : "Osteoporosis (disorder)"])
			or(exists ["Diagnosis" : "Eruption of skin (disorder)" ])
			or(exists ["Diagnosis" :  "Cancer"])
			or(exists ["Diagnosis" : "Autonomic hyperreflexia of bladder (disorder)"])
		)
		
define "Coverage":
		"Covered" and not "Not Covered"	
