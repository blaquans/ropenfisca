# Read the API documentation
fields  <- fromJSON(readLines("http://api.openfisca.fr/api/1/fields"))
#str(fields)
names(fields)
fields$apiVersion
fields$url
fields$method

columns  <- fields$columns
# Clean the names
names(columns)  <- sub(pattern = "@", replacement = "", x = names(columns))
# Subset of variables
columns2  <- subset(columns, select = c(name, label, entity))

columns$type$sali
columns$entity$birth
columns$entity$choi
columns$label$birth
columns$label$sali
columns$cerfa_field$sali
columns$default$sali
columns$val_type$sali
columns$survey_only$sali
columns$end$sali
columns$min$sali
columns$max$sali

prestations  <- fields$prestations
# Clean the names
names(prestations)  <- sub(pattern = "@", replacement = "", x = names(prestations))
names(prestations)
prestations2  <- subset(prestations, select = c(name, label, entity, type))

prestations$default$alleg_cice
prestations$entity$alleg_cice
prestations$label$alleg_cice
prestations$name$alleg_cice
 