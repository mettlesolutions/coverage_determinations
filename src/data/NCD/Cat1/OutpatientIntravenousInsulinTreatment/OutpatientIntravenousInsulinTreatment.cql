library OutpatientIntravenousInsulinTreatment

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
codesystem "NUCCPT":''

valueset "Intravenous therapy (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Insulins [Chemical/Ingredient]": '2.16.840.1.113762.1.4.1010.1'
valueset "Outpatient procedure (procedure)": '2.16.840.1.113883.3.88.12.80.28'

parameter MeasurementPeriod default Interval[
@2009-12-23T00:00:00.0,
null
)

context Patient

define "Outpatient Intravenous Insulin Treatment":
             ( exists ([MedicationAdministration: "Insulins [Chemical/Ingredient]"]) and ( exists ([Procedure: "Intravenous therapy (regime/therapy)"]) ) )
             and ( exists ([Procedure: "Outpatient procedure (procedure)"]O
             where O.performed during MeasurementPeriod) )
             
define "Not Covered":
          "Outpatient Intravenous Insulin Treatment"
