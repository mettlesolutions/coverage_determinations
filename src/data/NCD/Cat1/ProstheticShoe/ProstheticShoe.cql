//ProstheticShoe

library ChlamydiaScreening_Common version '2'

using QDM version '5.3'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'

valueset "Implantation of prosthetic device (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Provision of artificial arm (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Provision of artificial leg (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Fitting of artificial limb (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Orthopedic device application (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Absence of hand (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Congenital absence of foot (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'

context Patient

define "Covered":
        ( exists (["Diagnosis": "Absence of hand (finding)"]) and ( exists (["Procedure, Performed": "Implantation of prosthetic device (procedure)"]) ) )
         or ( exists (["Diagnosis": "Congenital absence of foot (disorder)"]) and (exists ( ["Procedure, Performed": "Implantation of prosthetic device (procedure)"]) ))

/*define "Condition 2(Covered)": 
         ["Procedure, Performed": "Fitting of artificial limb (procedure)"] includes ["Procedure, Performed": "Provision of artificial arm (procedure)"]
            
            and ["Procedure, Performed": "Fitting of artificial limb (procedure)"]  included in ["Procedure, Performed": "Provision of artificial leg (procedure)"]*/
         
define "Not Covered":
                ["Procedure, Performed": "Orthopedic device application (procedure)"]

define "Coverage":
         "Covered" and not "Not Covered"
          
