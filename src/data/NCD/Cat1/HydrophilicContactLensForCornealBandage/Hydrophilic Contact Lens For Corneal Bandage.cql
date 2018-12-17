//Hydrophilic Contact Lens For Corneal Bandage
library HydrophilicContactLensForCornealBandage

using FHIR

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
			(exists (["Condition":"Bullous keratopathy (disorder)"])
			or (exists (["Condition" :"Keratoconjunctivitis sicca (disorder)"]))
			or (exists (["Condition" :"Corneal ulcer (disorder)"]))
			and (exists (["Condition" :"Corneal erosion (disorder)"]))
			or  (exists (["Condition" :"Keratitis (disorder)"]))
			or  (exists (["Condition" : "Descemetocele (disorder)"]))
			or  (exists (["Condition" :"Corneal edema (disorder)"]))
			or  (exists (["Condition" :"Corneal ectasia (disorder)"]))
			or  (exists (["Condition" :"Mooren's ulcer (disorder)"]))
			or  (exists (["Condition" :"Dystrophy of anterior cornea (disorder)"]))
			or (exists (["Condition": "Neurotrophic keratoconjunctivitis (disorder)"]))
			)
			
define "Condition 1(Covered)":
           "Corneal Pathology" and ( exists (["Procedure": "Fitting of contact lens (procedure)"]) )
			
define "Condition 2(Covered)":
           ( exists (["Procedure": "Fitting of contact lens (procedure)"]) 
           and ( exists (["Encounter": "Physician service (procedure)"]) ) )
           
define "Coverage":
           "Condition 1(Covered)" or "Condition 2(Covered)"
	
