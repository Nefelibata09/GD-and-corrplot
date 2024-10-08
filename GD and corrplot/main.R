library(raster)
library(sp)
library(GD)
tif_file_path <- list.files(r"(/mnt/c/Users/kilin/Documents/30mLULC/30mLULC/30mLULC/1km_final/R_2000)", pattern = ".tif$", full.names = TRUE, ignore.case = TRUE)
# tif_file_path
tif_file_all <- stack(tif_file_path)
# tif_file_all
tif_file_all_matrix <- getValues(tif_file_all)
#View(tif_file_all_matrix)
tif_matrix = na.omit(tif_file_all_matrix)
#View(tif_matrix)
tif_frame <- as.data.frame(tif_matrix)
View(tif_frame)
discmethod <- c("equal", "natural", "quantile", "geometric", "sd")
discitv <- c(4:11)
my_gd <- gdm(y1_2000S ~ tem_2000S + pop_2000S + poduS+ndvi_2000S+lig_2000S+gdp2000S+OID,
                        continuous_variable = c("tem_2000S", "pop_2000S","poduS","ndvi_2000S","lig_2000S","gdp2000S","OID"),
                        data = tif_frame,
                        discmethod = discmethod,
                        discitv = discitv)
View(my_gd)