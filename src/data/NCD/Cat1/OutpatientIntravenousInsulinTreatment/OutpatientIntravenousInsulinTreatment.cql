//OutpatientIntravenousInsulinTreatment
library ChlamydiaScreening_Common version '2'

using QDM version '5.3'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
codesystem "NDFRT": '2.16.840.1.113883.3.26.1.5'

valueset "Intravenous therapy (regime/therapy)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Insulins [Chemical/Ingredient]": '2.16.840.1.113762.1.4.1010.1'
valueset "Outpatient procedure (procedure)": '2.16.840.1.113883.3.88.12.80.28'

parameter MeasurementPeriod default Interval[
@2009-12-23T00:00:00.0,
null
)

context Patient

define "Outpatient Intravenous Insulin Treatment":
             ( exists (["Medication, Administered": "Insulins [Chemical/Ingredient]"]) and ( exists (["Procedure, Performed": "Intravenous therapy (regime/therapy)"]) ) )
             and ( exists (["Procedure, Performed": "Outpatient procedure (procedure)"]O
             where O.relevantPeriod during MeasurementPeriod) )
             
define "Not Covered":
          "Outpatient Intravenous Insulin Treatment"
