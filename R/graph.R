names(out)

ggplot(data = out, aes(x = salsuperbrut, y = alleg_cice / salsuperbrut)) + 
  geom_point() + 
  theme_tufte()

