//Hydrophilic Contact Lens For Corneal Bandage
library ChlamydiaScreening_Common version '2'

using QDM

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT" : '2.16.840.1.113883.6.96'
valueset "Bullous keratopathy (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Keratoconjunctivitis sicca (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Corneal ulcer (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Corneal erosion (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Keratitis (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Descemetocele (disorder)"  : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Corneal edema (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Corneal ectasia (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Mooren's ulcer (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Dystrophy of anterior cornea (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Neurotrophic keratoconjunctivitis (disorder)" : '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Physician service (procedure)" : '2.16.840.1.113883.3.88.12.80.28'
valueset "Fitting of contact lens (procedure)" : '2.16.840.1.113883.3.88.12.80.28'

context Patient

define "Corneal Pathology":
			(exists (["Diagnosis":"Bullous keratopathy (disorder)"])
			or (exists (["Diagnosis" :"Keratoconjunctivitis sicca (disorder)"]))
			or (exists (["Diagnosis" :"Corneal ulcer (disorder)"]))
			and (exists (["Diagnosis" :"Corneal erosion (disorder)"]))
			or  (exists (["Diagnosis" :"Keratitis (disorder)"]))
			or  (exists (["Diagnosis" : "Descemetocele (disorder)"]))
			or  (exists (["Diagnosis" :"Corneal edema (disorder)"]))
			or  (exists (["Diagnosis" :"Corneal ectasia (disorder)"]))
			or  (exists (["Diagnosis" :"Mooren's ulcer (disorder)"]))
			or  (exists (["Diagnosis" :"Dystrophy of anterior cornea (disorder)"]))
			or (exists (["Diagnosis": "Neurotrophic keratoconjunctivitis (disorder)"]))
			)
			
define "Condition 1(Covered)":
           "Corneal Pathology" and ( exists (["Procedure, Performed": "Fitting of contact lens (procedure)"]) )
			
define "Condition 2(Covered)":
           ( exists (["Procedure, Performed": "Fitting of contact lens (procedure)"]) 
           and ( exists (["Encounter, Performed": "Physician service (procedure)"]) ) )
           
define "Coverage":
           "Condition 1(Covered)" or "Condition 2(Covered)"
	
