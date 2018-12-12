library CytogeneticStudies

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Genetic syndrome (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Fetus with hereditary disease (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Sexual nondevelopment (finding)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Chronic myeloid leukemia, disease (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Acute lymphoid leukemia, disease (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Myeloid leukemia (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Myelodysplastic syndrome (disorder)":'2.16.840.1.113883.3.88.12.3221.7.4'


define "Covered":
	exists(["Diagnosis": "Fetus with hereditary disease (disorder)"])
	or exists(["Assessment, Performed": "Sexual nondevelopment (finding)"]) 
	or exists(["Diagnosis": "Chronic myeloid leukemia, disease (disorder)"])
	or exists(["Diagnosis": "Myeloid leukemia (disorder)"]) 
	or exists(["Diagnosis": "Acute lymphoid leukemia, disease (disorder)"])
	or exists(["Diagnosis": "Myelodysplastic syndrome (disorder)"]) 
	
	
define "Coverage":
	"Covered"
