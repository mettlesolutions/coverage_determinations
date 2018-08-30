library ChlamydiaScreening_Common version '2'

using QDM version '5.3'

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)


codesystem "SNOMEDCT": '2.16.840.1.113883.6.96'
valueset "Transplantation of pancreas (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Whole organ pancreatic transplant (procedure)": '2.16.840.1.113762.1.4.1029.23'
valueset "Immunosuppressive therapy (procedure)": '2.16.840.1.113883.3.88.12.80.28'
valueset "Diabetes mellitus type 1 (disorder)": '2.16.840.1.113762.1.4.1018.240'
//beta cell autoantibody positive
valueset "Lipodystrophy, partial, with Rieger anomaly, short stature, and insulinopenic diabetes mellitus (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Labile affect (finding)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Metabolic complication of procedures (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Hospitalization": '2.16.840.1.113762.1.4.1164.40'
valueset "Hypoglycemia (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Ketoacidosis (disorder)": '2.16.840.1.113883.3.88.12.3221.7.4'
valueset "Endocrinologist (occupation)": '2.16.840.1.113762.1.4.1099.14'
valueset "Autotransplantation of pancreatic tissue (procedure)": '2.16.840.1.113883.3.88.12.80.28'
codesystem "HCPCS": '2.16.840.1.113883.6.285'
valueset "Kidney Transplant": '2.16.840.1.113883.3.464.1003.109.11.1052'
codesystem "NDFRT": '2.16.840.1.113883.3.26.1.5'
valueset "C-Peptide [Chemical/Ingredient]": '2.16.840.1.113762.1.4.1010.1'
