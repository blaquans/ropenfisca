json  <- cat(readLines("json/celib01.json"))
json  <- readLines("json/celib01.json")
json
cat(readLines("json/celib01.json"))
result_celib <- POST(url='http://api.openfisca.fr/api/1/simulate', body =json,
                     add_headers('Content-Type'= 'application/json',
                                 'User-Agent'='OpenFisca-Notebook'))
response  <-  content(result_celib)
response$error

response$value$values
out  <- data.frame(response$value$values)
names(out)  <- response$value$code
names(out)

