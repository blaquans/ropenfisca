# Cas ultra simple d'un célibataire salarié
json  <- readLines("json/roger3.json")
result_celib <- POST(url='http://api.openfisca.fr/api/1/simulate', body =json,
                     add_headers('Content-Type'= 'application/json',
                                 'User-Agent'='OpenFisca-Notebook'))
response  <-  content(result_celib)
response$error

out  <- data.frame(response$value$values)
names(out)  <- response$value$code
names(out)
out

plot_data <- subset(out, select= c("revnet", "psoc", "ppe", "impo"))
plot_data <- melt(out, id.vars = c("sali", "revdisp"))

svg("output/roger_aera.svg", width = 10, height = 7)
ggplot(data = plot_data, aes(x = sali, group=variable, fill=variable, y=value)) + 
  geom_area(position='stack') +
  geom_line(aes(y=revdisp)) +
  theme_bw() + 
  scale_x_continuous(name = "Salaire imposable", label = french, breaks = pretty_breaks(n=10)) + 
  scale_y_continuous(name = "Revenu disponible", label = french, breaks = pretty_breaks(n=10)) + 
  labs(title = "Revenu disponible d'un célibataire salarié en 2014")
dev.off()

plot_data <- subset(out, select= c("revnet", "psoc", "ppe", "impo"))
plot_data <- melt(out, id.vars = c("sali", "revdisp"))
dplot_data  <- by_group(tbl_df(plot_data), variable)
ggvis(plot_data, props(x = ~sali, y = ~value, fill = ~factor(variable))) + 
  layer_area(data = by_group(variable))

ggvis(plot_data, props(x = ~sali, y = ~value, fill = ~factor(variable))) + layer_point()
