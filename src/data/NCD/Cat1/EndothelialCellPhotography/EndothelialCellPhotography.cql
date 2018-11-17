//EndothelialCellPhotography
library ChlamydiaScreening_Common version '2'

using QDM version '5.3'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
codesystem "ICD10CM": '2.16.840.1.113883.6.90'

valueset "Corneal specular microscopy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Endothelial corneal dystrophy": '2.16.840.1.113883.3.526.2.1566'
valueset "Ocular photography for medical evaluation and documentation, slit lamp photography (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Corneal Edema": '2.16.840.1.113883.3.526.2.1548'
valueset "Secondary lens implant (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//intraocular surgery
valueset "Cataract surgery (procedure)": '2.16.840.1.113883.3.526.2.1527'
valueset "Corneal endothelium finding (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Aspiration of cataract by phacoemulsification (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Refractive surgery (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Radial keratotomy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Keratoplasty (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Posterior polymorphous corneal dystrophy (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Iridocorneal endothelial syndrome (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
//presurgical comprehensive eye examination
valueset "": ''

context Patient

define "Excluded refractive Procedures":
              ( exists (["Procedure, Performed": "Radial keratotomy (procedure)"])
              or ( exists (["Procedure, Performed": "Keratoplasty (procedure)"]) ) )

define "Indications and Limitations":
        ( exists ( if ( exists (["Procedure, Performed": "Ocular photography for medical evaluation and documentation, slit lamp photography (procedure)"]) )
          then ["Diagnosis": "Endothelial corneal dystrophy"] 
          else null ) )
          
          or ( exists ( if ( exists (["Procedure, Performed": "Ocular photography for medical evaluation and documentation, slit lamp photography (procedure)"]) )
          then ["Diagnosis": "Corneal Edema"] 
          else null ) )
          
          or (exists (["Procedure, Performed": "Secondary lens implant (procedure)"]) )
          
          or ( exists (["Diagnosis": "Corneal endothelium finding (finding)"])
               and ( exists (["Procedure, Performed": "Aspiration of cataract by phacoemulsification (procedure)"]) or ( exists (["Procedure, Performed": "Refractive surgery (procedure)"]) ) )
                 and not "Excluded refractive Procedures" )
                 
          or ( exists (["Diagnosis": "Posterior polymorphous corneal dystrophy (disorder)"])
              or ( exists (["Diagnosis": "Iridocorneal endothelial syndrome (disorder)"]) ) )
              
define "Coverage":
          "Indications and Limitations"

