# Splitting a Data Frame

library(datasets)

head(airquality)

# Primero separo los datos por mes

s <- split(airquality, airquality$Month)

# Después aplico un lapply para analizar las medias de las variables del ds.

lapply(s, function(x) colMeans(x[,c("Ozone", "Solar.R", "Wind")]))

# Con sapply simplifico la visualización de los resultados

sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))

# Corrijo el tema de los missing values (NA)

sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))
