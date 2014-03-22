names(out)

ggplot(data = out, aes(x = sali, y = -irpp)) + 
  geom_point() + 
  theme_bw() + 
  scales()

