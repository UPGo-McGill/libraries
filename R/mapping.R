## MAPPING

source("R/helper_functions.R")
source("R/data_import.R")
source("R/buffer_union.R")


# CTs <- st_join(CTs, CMA_name, by = "CMAs" )

lib_buffer <- st_buffer(Libraries, 1000)%>%
  st_geometry ()
plot(lib_buffer)
lib_union <- st_union (lib_buffer)

# need to find a way to filter buffer

?tm_layout

# Toronto 
tm_shape(filter(CMAs, name == "Toronto (B)")) + 
  tm_borders(col = 'black') +
tm_shape(filter(CTs_test, CMA_UID == "35535")) +
  tm_polygons(c("Population", "v_CA16_2354: Percentage with employment income", 
                "v_CA16_2398: Median after-tax income of households in 2015 ($)", 
                "v_CA16_4888: Spending 30% or more of income on shelter costs", 
                "v_CA16_488: Total lone-parent families by sex of parent", 
                "v_CA16_3411: Immigrants", 
                "v_CA16_3957: Total visible minority population"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
tm_shape(lib_union) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Toronto", 
            main.title.position = "left", 
            title = c("Population", 
                      "Percentage with Employment Income",
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

# Quebec

# Winnipeg

# Hamilton

# Kitchener-Cambridge-Waterloo