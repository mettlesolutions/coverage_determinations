library AntiCancerChemotherapyforColorectalCancer version '1'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

valueset "Colorectal Cancer Chemotherapy":'2.16.840.1.113762.1.4.1116.257'
valueset "oxaliplatin 5 MG/ML [Eloxatin]":'2.16.840.1.113883.3.88.12.80.16'
valueset "Fluorouracil Injectable Solution [Adrucil]":'2.16.840.1.113883.3.88.12.80.16'
valueset "capecitabine Oral Tablet [Xeloda]":'2.16.840.1.113883.3.88.12.80.16'
valueset "Irinotecan hydrochloride 20 MG/ML [Camptosar]":'2.16.840.1.113883.3.88.12.80.16'
valueset "cetuximab":'2.16.840.1.113883.3.88.12.80.16'
valueset "bevacizumab":'2.16.840.1.113883.3.88.12.80.16'

define "Covered":
	exists(["Medication, Administered":"oxaliplatin 5 MG/ML [Eloxatin]"])
//	or exists(["Medication, Administered":"Fluorouracil Injectable Solution [Adrucil]"])
//	or exists(["Medication, Administered":"capecitabine Oral Tablet [Xeloda]"])
	or exists(["Medication, Administered":"Irinotecan hydrochloride 20 MG/ML [Camptosar]"])
	or exists(["Medication, Administered":"cetuximab"])
	or exists(["Medication, Administered":"bevacizumab"])
	

define "Coverage":
	"Covered"
