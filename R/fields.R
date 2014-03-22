# Read the API documentation
fields  <- fromJSON(readLines("http://api.openfisca.fr/api/1/fields"))
str(fields)
names(fields)
fields$apiVersion
View(fields$columns)
