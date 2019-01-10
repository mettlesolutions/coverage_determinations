library ElectricalNerveStimulators

using FHIR

include FHIRHelpers version '1.8' called FHIRHelpers

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
codesystem "ICD10CM": '2.16.840.1.113883.6.90'

valueset "Chronic intractable pain (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Electrical peripheral nerve stimulation (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//central nervous system stimulator
valueset "Implantation of prosthetic device (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Dorsal column stimulation (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Deep brain stimulation (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Epidural insertion neurostimulator electrode (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Laminectomy for implantation of neurostimulator electrodes, endodural (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Implantation of electrode into brain using stereotactic guidance (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Stereotactic operation on thalamus (procedure)": '2.16.840.1.113883.3.88.12.80.28'
//periaqueductal gray matter
valueset "Seen by physician (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Seen by general practitioner (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Surgical procedure (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Physical Therapy": '2.16.840.1.113883.3.3157.1802'
valueset "Psychological therapies (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Drug therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Contraindicated (qualifier value)": '2.16.840.1.113883.3.117.1.7.1.412'
valueset "Patient unsuitable for procedure (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Procedure contraindicated (situation)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Screening procedure (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Multidisciplinary assessment (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Implantation (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Implementation of alternative methods of pain control (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Treatment Failure": '2.16.840.1.113762.1.4.1111.93'
valueset "Psychiatric interview and evaluation (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Physical evaluation assessment (procedure)": '2.16.840.1.113883.3.88.12.80.28'

context Patient

define "Covered 1(Implanted Peripheral Nerve Stimulators)":
            ( exists ([Condition: "Chronic intractable pain (finding)"])
            and (exists ([Procedure: "Implantation of prosthetic device (procedure)" included in [Procedure: "Electrical peripheral nerve stimulation (procedure)"]] )) )
            
define "Condition 1(Coverage)":
         if  ( exists ([Condition: "Chronic intractable pain (finding)"])
         and ( exists ([Procedure: "Implementation of alternative methods of pain control (procedure)"]I
                where I.outcome="Treatment Failure") ) )
          then  ( exists ([Procedure: "Dorsal column stimulation (procedure)"] ) )
         else false

define "Other treatment modalities":
           ( exists ([Procedure: "Drug therapy (procedure)"]D
           where (D.outcome= "Contraindicated (qualifier value)" and D.outcome= "Patient unsuitable for procedure (finding)") )
           or ( exists ([Procedure: "Psychological therapies (procedure)"]P
           where P.outcome= "Contraindicated (qualifier value)" and P.outcome= "Patient unsuitable for procedure (finding)" ) )
           or ( exists ([Procedure: "Physical Therapy"]PH
           where PH.outcome= "Contraindicated (qualifier value)" and PH.outcome= "Patient unsuitable for procedure (finding)" ) )
           or ( exists ([Procedure: "Surgical procedure (procedure)"]S
           where S.outcome= "Contraindicated (qualifier value)" and S.outcome= "Patient unsuitable for procedure (finding)" ) ) )

define "Condition 2(Coverage)":
           "Other treatment modalities"

define "Dorsal Column Neurostimulation":
            ( exists ([Procedure: "Laminectomy for implantation of neurostimulator electrodes, endodural (procedure)"] )
            or ( exists ([Procedure: "Epidural insertion neurostimulator electrode (procedure)"]) ) )

define "Central Nervous System Stimulator":
           "Dorsal Column Neurostimulation" or ( exists ([Procedure: "Deep brain stimulation (procedure)"]) )

define "Condition 3(Coverage)":
          ( exists ([Procedure: "Screening procedure (procedure)"])
          and "Procedures"
          and ( exists ([Procedure: "Multidisciplinary assessment (procedure)"]) ) )

define "Procedures":
               ( exists ([Procedure: "Psychiatric interview and evaluation (procedure)"])
               or (exists ([Procedure: "Physical evaluation assessment (procedure)"]) ) )

define "Conditions for coverage":
       if ("Condition 1(Coverage)" and "Condition 2(Coverage)" and "Condition 3(Coverage)")
        then "Procedures"
        else false
define "Coverage":
         "Covered 1(Implanted Peripheral Nerve Stimulators)" or "Conditions for coverage"
