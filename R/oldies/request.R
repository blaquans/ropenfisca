json_celib <- '{
"scenarios": [{
"axes": [{"count": 100, "max": 100000, "name": "sali", "min": 10}, 
{"count": 100, "max": 100000, "name": "choi", "min": 10}], 
"test_case": {
"foyers_fiscaux": [{"declarants": ["ind0"]}], 
"individus": 
[{"cadre": true, 
"activite": "Actif occupé", 
"statmarit": "Célibataire", 
"id": "ind0", 
"birth": 1970,
"choi" : 1000}], 
"familles": [{"parents": ["ind0"]}], 
"menages": [{"personne_de_reference": "ind0"}]}, 
"year": 2014}], 
"decomposition": [
{"code": "salsuperbrut"}, 
{"code": "salnet"}, 
{"code": "choi"}, 
{"code" : "cotpat_contrib"}, 
{"code" : "alleg_fillon"}, 
{"code" : "alleg_cice"}, 
{"code": "sali"}, 
{"code": "irpp"}, 
{"code": "revdisp"}
]
}'
json_celib
result_celib <- POST(url='http://api.openfisca.fr/api/1/simulate', body =json_celib,
                     add_headers('Content-Type'= 'application/json',
                                 'User-Agent'='OpenFisca-Notebook'))
response  <-  content(result_celib)
response$error

response$value$values
out  <- data.frame(response$value$values)
names(out)  <- response$value$code
names(out)

