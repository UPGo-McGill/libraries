## MAPPING

options(cancensus.api_key = "CensusMapper_4be2cf3bf91d0cabf967f4934dbdc63b")

options(cancensus.cache_path = "~/Desktop/AirBnB Internship/AirBnB-GIT/libraries")

source("R/helper_functions.R")
source("R/data_import.R")
source("R/buffer_union.R")

lib_union <- st_union (lib_buffer)

# need to find a way to filter buffer
# need to mutate variables

?tm_layout

# Toronto 
tm_shape(filter(CMAs, name == "Toronto (B)")) + 
  tm_borders(col = 'black') +
tm_shape(filter(test, CMA_Name == "Toronto (B)")) +
  tm_polygons(c("Pct_Unemployed", 
                "Med_AT_Income", 
                "Pct_Core_Hous", 
                "Pct_Lone_Parent", 
                "Pct_Imm", 
                "Pct_Vis_Min"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
tm_shape(lib_union) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Toronto", 
            main.title.position = "left", 
            title = c("Unemployment Rate",
                      "Median After-Tax Household Income",
                      "Percentage with Core Housing Need",
                      "Percentage of Single-Parent Families",
                      "Percentage Immigrants",
                      "Percentage Visible Minority"), 
            legend.position = c("left", "top"),
            frame = FALSE) +
  tm_compass()

# Montreal

tm_shape(filter(CMAs, name == "Montréal (B)")) + 
  tm_borders(col = 'black') +
tm_shape(filter(CTs, name == "Montréal (B)")) +
  tm_polygons("Population", border.alpha = 0)

# Vancouver 

# Calgary

# Ottawa - Gatineau

# Edmonton

# Winnipeg

# Hamilton

# Kitchener-Cambridge-Waterloo

# Oshawa

# Moncton

# Saint John

# Fredericton

# Saskatoon

# Kingston

# St.Catharines - Niagara

# Thunder Bay

# London

# Kelowna

# Abbotsforn - Mission

# Victoria

# Nanaimo

# Red Deer

# Edmonton

# Wood Buffalo

# Barrie

# Chilliwack

# Guelph

# Halifax

# Regina