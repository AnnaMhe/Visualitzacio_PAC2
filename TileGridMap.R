library(tidyverse)
library(viridis)

# LOCATION DATAFRAME

andalucia <- tribble(
  ~province, ~code, ~x, ~y,
  "Huelva", "HU", 1, 3,
  "Sevilla", "SV", 2, 3, 
  "Cadiz", "CA", 2, 2, 
  "Cordoba", "CO", 3, 3, 
  "Malaga", "MA", 3, 2,
  "Granada", "GR", 4, 2, 
  "Almeria", "AL", 5, 2,
  "Jaen", "JA", 4, 3, 
)

# SALARY DATA

df <- tibble(
  province = c("Huelva", "Sevilla", "Cadiz", "Cordoba", "Malaga", "Granada", "Almeria", "Jaen"), 
  `SALARY Andalucia` = c(13896, 17068, 16572, 14889, 16979, 15946, 14889, 13558)
)

# TILE GRID MAP

andalucia %>% 
  left_join(df, by = "province") %>% 
  ggplot(aes(x, y)) + 
  geom_tile(aes(fill = `SALARY Andalucia`)) + 
  geom_text(aes(label = code), color = "white") + 
  coord_fixed(ratio = 1) + 
  theme(
    panel.background = element_blank(),
    panel.grid = element_blank(), 
    axis.title = element_blank(), 
    axis.text = element_blank(), 
    axis.ticks = element_blank()) + 
  scale_fill_viridis(na.value = "#E1E1E1", option = "D", begin = 0.2, end = 0.8)
