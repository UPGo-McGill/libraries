## MAPPING

source("R/helper_functions.R")
source("R/data_import.R")
source("R/buffer_union.R")


CTs <- st_join(CTs, CMA_name, by = "CMAs" )

lib_buffer <- st_buffer(Libraries, 1000)%>%
  st_geometry ()
plot(lib_buffer)
lib_union <- st_union (lib_buffer)

# need to find a way to filter buffer

# Toronto 
tm_shape(filter(CMAs, name == "Toronto (B)")) + 
  tm_borders(col = 'black') +
tm_shape(filter(CTs, CMA_UID == "35535")) +
  tm_polygons(c("v_CA16_2354: Percentage with employment income", "Population"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
tm_shape(lib_union)+
  tm_borders(col = 'black')

# Montreal
tm_shape(filter(CMAs, name == "Montréal (B)")) + 
  tm_borders(col = 'black') +
tm_shape(filter(CTs, name == "Montréal (B)")) +
  tm_polygons("Population", border.alpha = 0)

# Vancouver 

# Calgary

# Ottawa - Gatineau

# Edmonton

# Quebec

# Winnipeg

# Hamilton

# Kitchener-Cambridge-Waterloo