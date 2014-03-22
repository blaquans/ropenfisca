# Read the API documentation
fields  <- fromJSON(readLines("http://api.openfisca.fr/api/1/fields"))
str(fields)
names(fields)
fields$apiVersion
fields$url
fields$method

columns  <- fields$columns
names(colums)
columns$entity$birth
columns$entity$choi
columns$"@type"$birth
columns$label$birth
columns$label$sali
columns$cerfa_field$sali
columns$min$sali
columns$max$sali

prestations  <- fields$prestations
names(prestations)
prestations$default$alleg_cice
prestations$entity$alleg_cice
prestations$label$alleg_cice
prestations$name$alleg_cice
prestations$labels$0
 