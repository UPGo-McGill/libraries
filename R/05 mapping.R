## MAPPING

source("R/01 helper_functions.R")
source("R/02 data_import.R")

# Toronto 2016
tm_shape(filter(CMAs_2016, CMA_name == "Toronto (B)")) + 
  tm_borders(col = 'black') +
tm_shape(filter(CTs_2016, CMA_name == "Toronto (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
tm_shape(filter(service_areas_2016, CMA_name == "Toronto (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Toronto 2016", 
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

# Toronto 2006
tm_shape(filter(CMAs_2006, CMA_name == "Toronto (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2006, CMA_name == "Toronto (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2006, CMA_name == "Toronto (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Toronto 2006", 
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

# Montreal 2016
tm_shape(filter(CMAs_2016, CMA_name == "Montréal (B)")) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Montréal (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2016, CMA_name == "Montréal (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Montreal 2016", 
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

# Montreal 2006 
tm_shape(filter(CMAs_2006, CMA_name == "Montréal (B)")) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2006, CMA_name == "Montréal (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2006, CMA_name == "Montréal (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Montreal 2006", 
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

# Vancouver 2016
tm_shape(filter(CMAs_2016, CMA_name == "Vancouver (B)")) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Vancouver (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2016, CMA_name == "Vancouver (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Vancouver 2016", 
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

# Vancouver 2006
tm_shape(filter(CMAs_2006, CMA_name == "Vancouver (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2006, CMA_name == "Vancouver (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2006, CMA_name == "Vancouver (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Vancouver 2006", 
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

# Calgary 2016 

tm_shape(filter(CMAs_2016, CMA_name == "Calgary (B)")) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Calgary (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2016, CMA_name == "Calgary (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Calgary 2016", 
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

# Calgary 2006
tm_shape(filter(CMAs_2006, CMA_name == "Calgary (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2006, CMA_name == "Calgary (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2006, CMA_name == "Calgary (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Calgary 2006", 
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

# Ottawa - Gatineau 2016

tm_shape(filter(CMAs_2016, CMA_name == "Ottawa - Gatineau (B)")) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Ottawa - Gatineau (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2016, CMA_name == "Ottawa - Gatineau (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Ottawa - Gatineau 2016", 
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

# Ottawa - Gatineau 2006

tm_shape(filter(CMAs_2006, CMA_name == "Ottawa - Gatineau (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2006, CMA_name == "Ottawa - Gatineau (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2006, CMA_name == "Ottawa - Gatineau (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Ottawa - Gatineau 2006", 
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

# Edmonton 2016

tm_shape(filter(CMAs_2016, CMA_name == "Edmonton (B)")) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Edmonton (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2016, CMA_name == "Edmonton (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Edmonton 2016", 
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

# Edmonton 2006

tm_shape(filter(CMAs_2006, CMA_name == "Edmonton (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2006, CMA_name == "Edmonton (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2006, CMA_name == "Edmonton (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Edmonton 2006", 
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

# Winnipeg 2016

tm_shape(filter(CMAs_2016, CMA_name == "Winnipeg (B)")) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Winnipeg (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2016, CMA_name == "Winnipeg (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Winnipeg 2016", 
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

tm_shape(filter(CMAs_2006, CMA_name == "Winnipeg (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2006, CMA_name == "Winnipeg (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2006, CMA_name == "Winnipeg (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Winnipeg 2006", 
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

# Hamilton 2016

tm_shape(filter(CMAs_2016, CMA_name == "Hamilton (B)")) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Hamilton (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2016, CMA_name == "Hamilton (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Hamilton 2016", 
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

# Hamilton 2006

tm_shape(filter(CMAs_2006, CMA_name == "Hamilton (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2006, CMA_name == "Hamilton (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2006, CMA_name == "Hamilton (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Hamilton 2006", 
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

# Kitchener-Cambridge-Waterloo 2016

tm_shape(filter(CMAs_2016, CMA_name == "Kitchener - Cambridge - Waterloo (B)")) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Kitchener - Cambridge - Waterloo (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2016, CMA_name == "Kitchener - Cambridge - Waterloo (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Kitchener - Cambridge - Waterloo 2016", 
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

# Kitchener - Cambridge - Waterloo 2006

tm_shape(filter(CMAs_2006, CMA_name == "Kitchener - Cambridge - Waterloo (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2006, CMA_name == "Kitchener - Cambridge - Waterloo (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2006, CMA_name == "Kitchener - Cambridge - Waterloo (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Kitchener - Cambridge - Waterloo 2006", 
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

# Oshawa 2016

tm_shape(filter(CMAs_2016, CMA_name == "Oshawa (B)")) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Oshawa (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2016, CMA_name == "Oshawa (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Oshawa 2016", 
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

# Oshawa 2006

tm_shape(filter(CMAs_2006, CMA_name == "Oshawa (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2006, CMA_name == "Oshawa (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2006, CMA_name == "Oshawa (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Oshawa 2006", 
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

# Moncton 2016

tm_shape(filter(CMAs_2016, CMA_name == "Moncton (B)")) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Moncton (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2016, CMA_name == "Moncton (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Moncton 2016", 
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

# Moncton 2006

tm_shape(filter(CMAs_2006, CMA_name == "Moncton (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2006, CMA_name == "Moncton (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2006, CMA_name == "Moncton (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Moncton 2006", 
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

# Saint John 2016 

tm_shape(filter(CMAs_2016, CMA_name == "Saint John (B)")) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Saint John (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2016, CMA_name == "Saint John (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Saint John 2016", 
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

# Saint John 2006

tm_shape(filter(CMAs_2006, CMA_name == "Saint John (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2006, CMA_name == "Saint John (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2006, CMA_name == "Saint John (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Saint John 2006", 
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

# Fredericton 2016

tm_shape(filter(CMAs_2016, CMA_name == "Fredericton (K)")) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Fredericton (K)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2016, CMA_name == "Fredericton (K)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Fredericton 2016", 
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

# Fredericton 2006

tm_shape(filter(CMAs_2006, CMA_name == "Fredericton (K)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2006, CMA_name == "Fredericton (K)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2006, CMA_name == "Fredericton (K)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Fredericton 2006", 
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

# Saskatoon 2016

tm_shape(filter(CMAs_2016, CMA_name == "Saskatoon (B)")) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Saskatoon (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2016, CMA_name == "Saskatoon (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Saskatoon 2016", 
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

# Saskatoon 2006

tm_shape(filter(CMAs_2006, CMA_name == "Saskatoon (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2006, CMA_name == "Saskatoon (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2006, CMA_name == "Saskatoon (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Saskatoon 2006", 
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

# Kingston 2016

tm_shape(filter(CMAs_2016, CMA_name == "Kingston (B)")) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Kingston (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2016, CMA_name == "Kingston (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Kingston 2016", 
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

# Kingston 2006

tm_shape(filter(CMAs_2006, CMA_name == "Kingston (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2006, CMA_name == "Kingston (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2006, CMA_name == "Kingston (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Kingston 2006", 
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

# St.Catharines - Niagara 2016

tm_shape(filter(CMAs_2016, CMA_name == "St. Catharines - Niagara (B)")) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "St. Catharines - Niagara (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2016, CMA_name == "St. Catharines - Niagara (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "St.Catharines - Niagara 2016", 
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

# St. Catharines - Niagara 2006

tm_shape(filter(CMAs_2006, CMA_name == "St. Catharines - Niagara (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2006, CMA_name == "St. Catharines - Niagara (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2006, CMA_name == "St. Catharines - Niagara (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "St. Catharines - Niagara 2006", 
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

# Thunder Bay 2016

tm_shape(filter(CMAs_2016, CMA_name == "Thunder Bay (B)")) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Thunder Bay (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2016, CMA_name == "Thunder Bay (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Thunder Bay 2016", 
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

# Thunder Bay 2006

tm_shape(filter(CMAs_2006, CMA_name == "Thunder Bay (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2006, CMA_name == "Thunder Bay (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2006, CMA_name == "Thunder Bay (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Thunder Bay 2006", 
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

# London 2016

tm_shape(filter(CMAs_2016, CMA_name == "London (B)")) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "London (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2016, CMA_name == "London (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "London 2016", 
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

# London 2006

tm_shape(filter(CMAs_2006, CMA_name == "London (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2006, CMA_name == "London (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2006, CMA_name == "London (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "London 2006", 
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

# Kelowna 2016

tm_shape(filter(CMAs_2016, CMA_name == "Kelowna (B)")) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Kelowna (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2016, CMA_name == "Kelowna (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Kelowna 2016", 
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

# Kelowna 2006

tm_shape(filter(CMAs_2006, CMA_name == "Kelowna (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2006, CMA_name == "Kelowna (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2006, CMA_name == "Kelowna (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Kelowna 2006", 
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

# Abbotsforn - Mission 2016

tm_shape(filter(CMAs_2016, CMA_name == "Abbotsford - Mission (B)")) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Abbotsford - Mission (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2016, CMA_name == "Abbotsford - Mission (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Abbotsford - Mission 2016", 
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

# Abbotsford - Mission 2006

tm_shape(filter(CMAs_2006, CMA_name == "Abbotsford - Mission (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2006, CMA_name == "Abbotsford - Mission (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2006, CMA_name == "Abbotsford - Mission (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Abbotsford - Mission 2006", 
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

# Victoria 2016

tm_shape(filter(CMAs_2016, CMA_name == "Victoria (B)")) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Victoria (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2016, CMA_name == "Victoria (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Victoria 2016", 
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

# Victoria 2006

tm_shape(filter(CMAs_2006, CMA_name == "Victoria (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2006, CMA_name == "Victoria (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2006, CMA_name == "Victoria (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Victoria 2006", 
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

# Nanaimo 2016

tm_shape(filter(CMAs_2016, CMA_name == "Nanaimo (K)")) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Nanaimo (K)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2016, CMA_name == "Nanaimo (K)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Nanaimo 2016", 
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

# Nanaimo 2006

tm_shape(filter(CMAs_2006, CMA_name == "Nanaimo (K)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2006, CMA_name == "Nanaimo (K)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2006, CMA_name == "Nanaimo (K)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Nanaimo 2006", 
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

# Red Deer 2016

tm_shape(filter(CMAs_2016, CMA_name == "Red Deer (K)")) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Red Deer (K)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2016, CMA_name == "Red Deer (K)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Red Deer 2016", 
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

# Red Deer 2006

tm_shape(filter(CMAs_2006, CMA_name == "Red Deer (K)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2006, CMA_name == "Red Deer (K)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2006, CMA_name == "Red Deer (K)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Red Deer 2006", 
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

# Edmonton 2016 [This is in here twice?]

# tm_shape(filter(CMAs_2016, CMA_name == "Edmonton (B)")) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Edmonton (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2016, CMA_name == "Edmonton (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Edmonton 2016", 
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

# Wood Buffalo 2016

tm_shape(filter(CMAs_2016, CMA_name == "Wood Buffalo (K)")) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Wood Buffalo (K)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2016, CMA_name == "Wood Buffalo (K)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Wood Buffalo 2016", 
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

# Wood Buffalo 2006

tm_shape(filter(CMAs_2006, CMA_name == "Wood Buffalo (K)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2006, CMA_name == "Wood Buffalo (K)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2006, CMA_name == "Wood Buffalo (K)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Wood Buffalo 2006", 
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

# Barrie 2016

tm_shape(filter(CMAs_2016, CMA_name == "Barrie (B)")) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Barrie (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2016, CMA_name == "Barrie (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Barrie 2016", 
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

# Barrie 2006

tm_shape(filter(CMAs_2006, CMA_name == "Barrie (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2006, CMA_name == "Barrie (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2006, CMA_name == "Barrie (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Barrie 2006", 
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

# Chilliwack 2016

tm_shape(filter(CMAs_2016, CMA_name == "Chilliwack (K)")) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Chilliwack (K)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2016, CMA_name == "Chilliwack (K)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Chilliwack 2016", 
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

# Chilliwack 2006

tm_shape(filter(CMAs_2006, CMA_name == "Chilliwack (K)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2006, CMA_name == "Chilliwack (K)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2006, CMA_name == "Chilliwack (K)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Chilliwack 2006", 
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

# Guelph 2016

tm_shape(filter(CMAs_2016, CMA_name == "Guelph (B)")) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Guelph (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2016, CMA_name == "Guelph (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Guelph 2016", 
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

# Guelph 2006

tm_shape(filter(CMAs_2006, CMA_name == "Guelph (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2006, CMA_name == "Guelph (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2006, CMA_name == "Guelph (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Guelph 2006", 
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

# Halifax 2016

tm_shape(filter(CMAs_2016, CMA_name == "Halifax (B)")) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Halifax (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2016, CMA_name == "Halifax (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Halifax 2016", 
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

# Halifax 2006

tm_shape(filter(CMAs_2006, CMA_name == "Halifax (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2006, CMA_name == "Halifax (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2006, CMA_name == "Halifax (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Halifax 2006", 
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

# Regina 2016

tm_shape(filter(CMAs_2016, CMA_name == "Regina (B)")) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Regina (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2016, CMA_name == "Regina (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Regina 2016", 
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

# Regina 2006

tm_shape(filter(CMAs_2006, CMA_name == "Regina (B)")) + 
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2006, CMA_name == "Regina (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct", 
                "lone_parent_pct", 
                "immigrants_pct", 
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2006, CMA_name == "Regina (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Regina 2006", 
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

