## MAPPING

options(cancensus.api_key = "CensusMapper_4be2cf3bf91d0cabf967f4934dbdc63b")

options(cancensus.cache_path = "~/Desktop/AirBnB Internship/AirBnB-GIT/libraries")

source("R/helper_functions.R")
source("R/data_import.R")
source("R/buffer_union.R")

# Toronto 
tm_shape(filter(CMAs, name == "Toronto (B)")) + 
  tm_borders(col = 'black') +
tm_shape(filter(CTs, CMA_Name == "Toronto (B)")) +
  tm_polygons(c("Pct_Unemployed", 
                "Med_AT_Income", 
                "Pct_Core_Hous", 
                "Pct_Lone_Parent", 
                "Pct_Imm", 
                "Pct_Vis_Min"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
tm_shape(filter(service_areas, name == "Toronto (B)" & library == TRUE)) +
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
  tm_shape(filter(CTs, CMA_Name == "Montréal (B)")) +
  tm_polygons(c("Pct_Unemployed", 
                "Med_AT_Income", 
                "Pct_Core_Hous", 
                "Pct_Lone_Parent", 
                "Pct_Imm", 
                "Pct_Vis_Min"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas, name == "Montréal (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Montreal", 
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

# Vancouver 

tm_shape(filter(CMAs, name == "Vancouver (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs, CMA_Name == "Vancouver (B)")) +
  tm_polygons(c("Pct_Unemployed", 
                "Med_AT_Income", 
                "Pct_Core_Hous", 
                "Pct_Lone_Parent", 
                "Pct_Imm", 
                "Pct_Vis_Min"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas, name == "Vancouver (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Vancouver", 
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

# Calgary

tm_shape(filter(CMAs, name == "Calgary (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs, CMA_Name == "Calgary (B)")) +
  tm_polygons(c("Pct_Unemployed", 
                "Med_AT_Income", 
                "Pct_Core_Hous", 
                "Pct_Lone_Parent", 
                "Pct_Imm", 
                "Pct_Vis_Min"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas, name == "Calgary (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Calgary", 
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


# Ottawa - Gatineau

tm_shape(filter(CMAs, name == "Ottawa - Gatineau (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs, CMA_Name == "Ottawa - Gatineau (B)")) +
  tm_polygons(c("Pct_Unemployed", 
                "Med_AT_Income", 
                "Pct_Core_Hous", 
                "Pct_Lone_Parent", 
                "Pct_Imm", 
                "Pct_Vis_Min"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas, name == "Ottawa - Gatineau (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Ottawa - Gatineau", 
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


# Edmonton

tm_shape(filter(CMAs, name == "Edmonton (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs, CMA_Name == "Edmonton (B)")) +
  tm_polygons(c("Pct_Unemployed", 
                "Med_AT_Income", 
                "Pct_Core_Hous", 
                "Pct_Lone_Parent", 
                "Pct_Imm", 
                "Pct_Vis_Min"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas, name == "Edmonton (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Edmonton", 
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

# Winnipeg

tm_shape(filter(CMAs, name == "Winnipeg (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs, CMA_Name == "Winnipeg (B)")) +
  tm_polygons(c("Pct_Unemployed", 
                "Med_AT_Income", 
                "Pct_Core_Hous", 
                "Pct_Lone_Parent", 
                "Pct_Imm", 
                "Pct_Vis_Min"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas, name == "Winnipeg (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Winnipeg", 
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

# Hamilton

tm_shape(filter(CMAs, name == "Hamilton (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs, CMA_Name == "Hamilton (B)")) +
  tm_polygons(c("Pct_Unemployed", 
                "Med_AT_Income", 
                "Pct_Core_Hous", 
                "Pct_Lone_Parent", 
                "Pct_Imm", 
                "Pct_Vis_Min"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas, name == "Hamilton (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Hamilton", 
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

# Kitchener-Cambridge-Waterloo

tm_shape(filter(CMAs, name == "Kitchener - Cambridge - Waterloo (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs, CMA_Name == "Kitchener - Cambridge - Waterloo (B)")) +
  tm_polygons(c("Pct_Unemployed", 
                "Med_AT_Income", 
                "Pct_Core_Hous", 
                "Pct_Lone_Parent", 
                "Pct_Imm", 
                "Pct_Vis_Min"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas, name == "Kitchener - Cambridge - Waterloo (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Kitchener - Cambridge - Waterloo", 
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

# Oshawa

tm_shape(filter(CMAs, name == "Oshawa (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs, CMA_Name == "Oshawa (B)")) +
  tm_polygons(c("Pct_Unemployed", 
                "Med_AT_Income", 
                "Pct_Core_Hous", 
                "Pct_Lone_Parent", 
                "Pct_Imm", 
                "Pct_Vis_Min"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas, name == "Oshawa (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Oshawa", 
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

# Moncton

tm_shape(filter(CMAs, name == "Moncton (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs, CMA_Name == "Moncton (B)")) +
  tm_polygons(c("Pct_Unemployed", 
                "Med_AT_Income", 
                "Pct_Core_Hous", 
                "Pct_Lone_Parent", 
                "Pct_Imm", 
                "Pct_Vis_Min"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas, name == "Moncton (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Moncton", 
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

# Saint John

tm_shape(filter(CMAs, name == "Saint John (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs, CMA_Name == "Saint John (B)")) +
  tm_polygons(c("Pct_Unemployed", 
                "Med_AT_Income", 
                "Pct_Core_Hous", 
                "Pct_Lone_Parent", 
                "Pct_Imm", 
                "Pct_Vis_Min"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas, name == "Saint John (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Saint John", 
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

# Fredericton

tm_shape(filter(CMAs, name == "Fredericton (K)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs, CMA_Name == "Fredericton (K)")) +
  tm_polygons(c("Pct_Unemployed", 
                "Med_AT_Income", 
                "Pct_Core_Hous", 
                "Pct_Lone_Parent", 
                "Pct_Imm", 
                "Pct_Vis_Min"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas, name == "Fredericton (K)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Fredericton", 
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

# Saskatoon

tm_shape(filter(CMAs, name == "Saskatoon (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs, CMA_Name == "Saskatoon (B)")) +
  tm_polygons(c("Pct_Unemployed", 
                "Med_AT_Income", 
                "Pct_Core_Hous", 
                "Pct_Lone_Parent", 
                "Pct_Imm", 
                "Pct_Vis_Min"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas, name == "Saskatoon (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Saskatoon", 
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

# Kingston

tm_shape(filter(CMAs, name == "Kingston (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs, CMA_Name == "Kingston (B)")) +
  tm_polygons(c("Pct_Unemployed", 
                "Med_AT_Income", 
                "Pct_Core_Hous", 
                "Pct_Lone_Parent", 
                "Pct_Imm", 
                "Pct_Vis_Min"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas, name == "Kingston (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Kingston", 
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

# St.Catharines - Niagara

tm_shape(filter(CMAs, name == "St. Catharines - Niagara (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs, CMA_Name == "St. Catharines - Niagara (B)")) +
  tm_polygons(c("Pct_Unemployed", 
                "Med_AT_Income", 
                "Pct_Core_Hous", 
                "Pct_Lone_Parent", 
                "Pct_Imm", 
                "Pct_Vis_Min"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas, name == "St. Catharines - Niagara (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "St. Catharines - Niagara", 
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

# Thunder Bay

tm_shape(filter(CMAs, name == "Thunder Bay (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs, CMA_Name == "Thunder Bay (B)")) +
  tm_polygons(c("Pct_Unemployed", 
                "Med_AT_Income", 
                "Pct_Core_Hous", 
                "Pct_Lone_Parent", 
                "Pct_Imm", 
                "Pct_Vis_Min"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas, name == "Thunder Bay (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Thunder Bay", 
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

# London

tm_shape(filter(CMAs, name == "London (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs, CMA_Name == "London (B)")) +
  tm_polygons(c("Pct_Unemployed", 
                "Med_AT_Income", 
                "Pct_Core_Hous", 
                "Pct_Lone_Parent", 
                "Pct_Imm", 
                "Pct_Vis_Min"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas, name == "London (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "London", 
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

# Kelowna

tm_shape(filter(CMAs, name == "Kelowna (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs, CMA_Name == "Kelowna (B)")) +
  tm_polygons(c("Pct_Unemployed", 
                "Med_AT_Income", 
                "Pct_Core_Hous", 
                "Pct_Lone_Parent", 
                "Pct_Imm", 
                "Pct_Vis_Min"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas, name == "Kelowna (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Kelowna", 
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

# Abbotsforn - Mission

tm_shape(filter(CMAs, name == "Abbotsford - Mission (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs, CMA_Name == "Abbotsford - Mission (B)")) +
  tm_polygons(c("Pct_Unemployed", 
                "Med_AT_Income", 
                "Pct_Core_Hous", 
                "Pct_Lone_Parent", 
                "Pct_Imm", 
                "Pct_Vis_Min"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas, name == "Abbotsford - Mission (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Abbotsford - Mission", 
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

# Victoria

tm_shape(filter(CMAs, name == "Victoria (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs, CMA_Name == "Victoria (B)")) +
  tm_polygons(c("Pct_Unemployed", 
                "Med_AT_Income", 
                "Pct_Core_Hous", 
                "Pct_Lone_Parent", 
                "Pct_Imm", 
                "Pct_Vis_Min"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas, name == "Victoria (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Victoria", 
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

# Nanaimo

tm_shape(filter(CMAs, name == "Nanaimo (K)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs, CMA_Name == "Nanaimo (K)")) +
  tm_polygons(c("Pct_Unemployed", 
                "Med_AT_Income", 
                "Pct_Core_Hous", 
                "Pct_Lone_Parent", 
                "Pct_Imm", 
                "Pct_Vis_Min"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas, name == "Nanaimo (K)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Nanaimo", 
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

# Red Deer

tm_shape(filter(CMAs, name == "Red Deer (K)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs, CMA_Name == "Red Deer (K)")) +
  tm_polygons(c("Pct_Unemployed", 
                "Med_AT_Income", 
                "Pct_Core_Hous", 
                "Pct_Lone_Parent", 
                "Pct_Imm", 
                "Pct_Vis_Min"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas, name == "Red Deer (K)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Red Deer", 
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

# Edmonton

tm_shape(filter(CMAs, name == "Edmonton (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs, CMA_Name == "Edmonton (B)")) +
  tm_polygons(c("Pct_Unemployed", 
                "Med_AT_Income", 
                "Pct_Core_Hous", 
                "Pct_Lone_Parent", 
                "Pct_Imm", 
                "Pct_Vis_Min"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas, name == "Edmonton (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Edmonton", 
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

# Wood Buffalo

tm_shape(filter(CMAs, name == "Wood Buffalo (K)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs, CMA_Name == "Wood Buffalo (K)")) +
  tm_polygons(c("Pct_Unemployed", 
                "Med_AT_Income", 
                "Pct_Core_Hous", 
                "Pct_Lone_Parent", 
                "Pct_Imm", 
                "Pct_Vis_Min"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas, name == "Wood Buffalo (K)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Wood Buffalo", 
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

# Barrie

tm_shape(filter(CMAs, name == "Barrie (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs, CMA_Name == "Barrie (B)")) +
  tm_polygons(c("Pct_Unemployed", 
                "Med_AT_Income", 
                "Pct_Core_Hous", 
                "Pct_Lone_Parent", 
                "Pct_Imm", 
                "Pct_Vis_Min"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas, name == "Barrie (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Barrie", 
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

# Chilliwack

tm_shape(filter(CMAs, name == "Chilliwack (K)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs, CMA_Name == "Chilliwack (K)")) +
  tm_polygons(c("Pct_Unemployed", 
                "Med_AT_Income", 
                "Pct_Core_Hous", 
                "Pct_Lone_Parent", 
                "Pct_Imm", 
                "Pct_Vis_Min"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas, name == "Chilliwack (K)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Chilliwack", 
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

# Guelph

tm_shape(filter(CMAs, name == "Guelph (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs, CMA_Name == "Guelph (B)")) +
  tm_polygons(c("Pct_Unemployed", 
                "Med_AT_Income", 
                "Pct_Core_Hous", 
                "Pct_Lone_Parent", 
                "Pct_Imm", 
                "Pct_Vis_Min"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas, name == "Guelph (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Guelph", 
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

# Halifax

tm_shape(filter(CMAs, name == "Halifax (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs, CMA_Name == "Halifax (B)")) +
  tm_polygons(c("Pct_Unemployed", 
                "Med_AT_Income", 
                "Pct_Core_Hous", 
                "Pct_Lone_Parent", 
                "Pct_Imm", 
                "Pct_Vis_Min"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas, name == "Halifax (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Halifax", 
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

# Regina

tm_shape(filter(CMAs, name == "Regina (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs, CMA_Name == "Regina (B)")) +
  tm_polygons(c("Pct_Unemployed", 
                "Med_AT_Income", 
                "Pct_Core_Hous", 
                "Pct_Lone_Parent", 
                "Pct_Imm", 
                "Pct_Vis_Min"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas, name == "Regina (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Regina", 
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

