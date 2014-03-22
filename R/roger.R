# Cas ultra simple d'un célibataire salarié
json  <- readLines("json/roger2.json")
json
result_celib <- POST(url='http://api.openfisca.fr/api/1/simulate', body =json,
                     add_headers('Content-Type'= 'application/json',
                                 'User-Agent'='OpenFisca-Notebook'))
response  <-  content(result_celib)
response$error

out  <- data.frame(response$value$values)
names(out)  <- response$value$code
names(out)

svg("output/roger_irpp.svg", width = 10, height = 7)
ggplot(data = out, aes(x = sali, y = -irpp)) + 
  geom_point(color = "#D74A38") + 
  theme_bw() + 
  scale_x_continuous(name = "Salaire imposable", label = french, breaks = pretty_breaks(n=10)) + 
  scale_y_continuous(name = "Impôts sur le revenu des personnes physiques", label = french, breaks = pretty_breaks(n=10)) + 
  labs(title = "Impôt sur le revenu d'un célibataire salarié en 2014")
dev.off()

svg("output/roger_revenu_disponible.svg", width = 10, height = 7)
ggplot(data = out, aes(x = sali, y = revdisp)) + 
  geom_point(color = "#D74A38") + 
  theme_bw() + 
  scale_x_continuous(name = "Salaire imposable", label = french, breaks = pretty_breaks(n=10)) + 
  scale_y_continuous(name = "Revenu disponible après impôts", label = french, breaks = pretty_breaks(n=10)) + 
  labs(title = "Revenu disponible d'un célibataire salarié en 2014") + 
  geom_abline(intercept = 0, slope = 1)
dev.off()
