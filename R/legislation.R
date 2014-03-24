legislation  <- fromJSON("http://ui.openfisca.fr/api/1/legislations/legislation-de-reference/json")
names(legislation)  <- sub(pattern = "@", replacement = "", x = names(legislation))
legislation$context
legislation$type
legislation$from
legislation$to
names(legislation$children)
names(legislation$children)  <- sub(pattern = "@", replacement = "", x = names(legislation$children))
str(legislation$children$type)
