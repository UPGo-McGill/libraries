### FINAL FIGURES #############################################################

source("R/01 helper_functions.R")


## FIGURE 1. MAP OF BANQ AREA (WITH NO BUFFERS AT ALL)

pdf()
tm_shape(st_buffer(filter(libraries_2016, Library_System == 
                            "Bibliotheque et Archives Nationales du Quebec"), 1000),
         ext = 12) +
  tm_dots(col = 'black')+
  tm_shape(filter(CTs_2016, CMA_name == "Montreal")) +
  tm_polygons("housing_need_pct", border.alpha = 0)  + 
  tm_shape(filter(libraries_2016, Library_System == "Bibliotheque et Archives Nationales du Quebec")) +
  tm_dots(col= 'black', size = 1)+
  tm_layout(legend.position = c("left", "top"),
            frame = FALSE) +
  tm_compass()
dev.off()

## FIGURE 2. MAP OF BANQ AREA (WITH BANQ BUFFER DRAWN ON)

pdf()
tm_shape(st_buffer(filter(libraries_2016, Library_System == 
                            "Bibliotheque et Archives Nationales du Quebec"), 1000),
         ext = 12) +
  tm_dots(col = 'black')+
  tm_shape(filter(CTs_2016, CMA_name == "Montreal")) +
  tm_polygons("housing_need_pct", border.alpha = 0)  + 
  tm_shape(st_buffer(filter(libraries_2016, Library_System == 
                              "Bibliotheque et Archives Nationales du Quebec"), 1000) ) +
  tm_borders(col= 'black')+
  tm_layout(legend.position = c("left", "top"),
            frame = FALSE) +
  tm_compass()
dev.off()

## FIGURE 3. MAP OF MONTREAL WITH ALL LIBRARY BUFFERS (2016)

pdf()
tm_shape(filter(libraries_2016, Library_System == 
                  "Bibliotheque et Archives Nationales du Quebec"), 
         bb = st_buffer(filter(libraries_2016, Library_System == 
                                 "Bibliotheque et Archives Nationales du Quebec"), 1000),
         ext = 12) +
  tm_dots(col = 'black')+
  tm_shape(filter(CTs_2016, CMA_name == "Montreal")) +
  tm_polygons("housing_need_pct", border.alpha = 0)  + 
  tm_shape(filter(service_areas_2016, CMA_name == "Montreal" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"),
            frame = FALSE) +
  tm_compass()
dev.off()


## FIGURE 3B. ZOOMED OUT MAP OF MONTREAL WITH ALL LIBRARY BUFFERS

pdf()
  tm_shape(filter(CTs_2006, CMA_name == "Montreal"))+
  tm_fill("housing_need_pct", border.alpha = 0, breaks = c(0,0.1, 0.2, 0.3, 0.4, 0.5))  + 
  tm_shape(filter(service_areas_2006, CMA_name == "Montreal" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"),
            frame = FALSE) +
  tm_compass()
dev.off()



## FIGURE 4.A LOLLIPOP GRAPH OF 2016 VISIBLE MINORITIES

library_service_comparison %>%
  filter (date=="2016") %>%
  ggplot()+
  geom_line(mapping = aes(housing_need, CMA_name, group = CMA_name)) +
  geom_point(mapping = aes(housing_need, CMA_name, color = library)) +
  scale_x_continuous(labels = scales::percent) +
  theme_minimal()


## FIGURE 4.B LOLLIPOP GRAPH OF 2016 VISIBLE MINORITIES

library_service_comparison %>%
  filter (date=="2016") %>%
  ggplot()+
  geom_line(mapping = aes(visible_minorities, CMA_name, group = CMA_name)) +
  geom_point(mapping = aes(visible_minorities, CMA_name, color = library)) +
  scale_x_continuous(labels = scales::percent) +
  theme_minimal()

## FIGURE 4.C LOLLIPOP GRAPH OF 2016 UNEMPLOYMENT (PRC)

library_service_comparison %>%
  filter (date=="2016") %>%
  ggplot()+
  geom_line(mapping = aes(unemployed_pct, CMA_name, group = CMA_name)) +
  geom_point(mapping = aes(unemployed_pct, CMA_name, color = library)) +
  scale_x_continuous(labels = scales::percent) +
  theme_minimal()

## FIGURE 4.D LOLLIPOP GRAPH OF 2016 MEDIAN INCOME

library_service_comparison %>%
  filter (date=="2016") %>%
  ggplot()+
  geom_line(mapping = aes(med_income, CMA_name, group = CMA_name)) +
  geom_point(mapping = aes(med_income, CMA_name, color = library)) +
  scale_x_continuous(labels = scales::dollar) +
  theme_minimal()


## FIGURE 5.A. 2006/2016 CORE HOUSING NEED COMPARISON ACROSS ALL REGIONS

lib_change %>%
  ggplot()+
  geom_line(mapping = aes(housing_need_ch, CMA_name.x, group = CMA_name.x)) +
  geom_point(mapping = aes(housing_need_ch, CMA_name.x, color = library.x)) +
  scale_x_continuous(labels = scales::percent) +
  theme_minimal()

## FIGURE 5.B. 2006/2016 VISIBLE MINORITIES COMPARISON ACROSS ALL REGIONS

lib_change %>%
  ggplot()+
  geom_line(mapping = aes(visible_minorities_ch, CMA_name.x, group = CMA_name.x)) +
  geom_point(mapping = aes(visible_minorities_ch, CMA_name.x, color = library.x)) +
  scale_x_continuous(labels = scales::percent) +
  theme_minimal()

## FIGURE 5.C. 2006/2016 UNEMPLOYMENT (PCT) COMPARISON ACROSS ALL REGIONS

lib_change %>%
  ggplot()+
  geom_line(mapping = aes(unemployed_pct_change, CMA_name.x, group = CMA_name.x)) +
  geom_point(mapping = aes(unemployed_pct_change, CMA_name.x, color = library.x)) +
  scale_x_continuous(labels = scales::percent) +
  theme_minimal()

## FIGURE 5.D. 2006/2016 MEDIAN INCOME (PCT) COMPARISON ACROSS ALL REGIONS

lib_change %>%
  ggplot()+
  geom_line(mapping = aes(med_income_ch, CMA_name.x, group = CMA_name.x)) +
  geom_point(mapping = aes(med_income_ch, CMA_name.x, color = library.x)) +
  scale_x_continuous(labels = scales::dollar) +
  theme_minimal()



## FIGURE 6. ALL FIVE VARIABLE 2006/2016 COMPARISONS ACROSS ALL REGIONS

library_service_comparison_tidy <- gather(library_service_comparison, 
                                          housing_need, lone_parent, 
                                          immigrants, visible_minorities, 
                                          unemployed_pct, 
                                          med_income, key = "census_variable",
                                          value = "value") %>% 
  drop_units()

ggplot()+
  geom_line(data = library_service_comparison_tidy,
            aes(x = date, y = value, colour = library,
                group = interaction(library, CMA_name)), 
            alpha = 0.2) +
  geom_point(data = library_service_comparison_tidy,
             aes(x = date, y = value, colour = library), 
             alpha = 0.2) +
  geom_point(data=tidy_summary,
             aes(x = date, y = value, colour = library), size = 5) + 
  geom_line(data = tidy_summary,
            aes(x = date, y = value, colour = library, group = library),
            size = 2) + 
  facet_wrap(~census_variable, scales = "free")




## FIGURE 6. ALL FIVE VARIABLE 2006/2016 COMPARISONS ACROSS ALL REGIONS

library_service_comparison_tidy <- gather(library_service_comparison, 
                                     housing_need, lone_parent, 
                                     immigrants, visible_minorities, 
                                     unemployed_pct, 
                                     med_income, key = "census_variable",
                                     value = "value") %>% 
  drop_units()

ggplot()+
  geom_line(data = library_service_comparison_tidy,
            aes(x = date, y = value, colour = library,
                group = interaction(library, CMA_name)), 
            alpha = 0.2) +
  geom_point(data = library_service_comparison_tidy,
             aes(x = date, y = value, colour = library), 
             alpha = 0.2) +
  geom_point(data=tidy_summary,
             aes(x = date, y = value, colour = library), size = 5) + 
  geom_line(data = tidy_summary,
            aes(x = date, y = value, colour = library, group = library),
            size = 2) + 
  facet_wrap(~census_variable, scales = "free")


## FIGURE 7. CORE HOUSING NEED 2006/2016 ACROSS MAJOR REGIONS

ggplot(lib_change)+
  geom_point(mapping = aes(CMA_name.x, visible_minorities_ch, color=library.x))+
  theme(axis.title.x = element_blank())+
  facet_wrap(~region.y)+
  theme(axis.title.x = element_blank())


## Toronto 2016, 2006
#tm_shape(filter(CMAs_2016, CMA_name == "Toronto (B)")) +
# tm_dots(col = 'black')+
tm_shape(filter(service_areas_2016, CMA_name == "Toronto (B)" & library == TRUE)) +
  tm_borders(col = 'black')+
  tm_shape(filter(CTs_2016, CMA_name == "Toronto (B)")) +
  tm_polygons(("housing_need_pct"), border.alpha = 0, breaks = c(0,0.1, 0.2, 0.3, 0.4, 0.5))  + 
  tm_shape(filter(service_areas_2016, CMA_name == "Toronto (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"),
            frame = FALSE) +
  tm_compass()

#tm_shape(filter(CMAs_2006, CMA_name == "Toronto (B)")) +
# tm_dots(col = 'black')+
tm_shape(filter(service_areas_2006, CMA_name == "Toronto (B)" & library == TRUE)) +
  tm_borders(col = 'black')+
  tm_shape(filter(CTs_2006, CMA_name == "Toronto (B)")) +
  tm_polygons(("housing_need_pct"), border.alpha = 0, breaks = c(0,0.1, 0.2, 0.3, 0.4, 0.5))  + 
  tm_shape(filter(service_areas_2006, CMA_name == "Toronto (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"),
            frame = FALSE) +
  tm_compass()

## Vancouver 2016, 2006
#tm_shape(filter(CMAs_2016, CMA_name == "Vancouver (B)")) +
# tm_dots(col = 'black')+
tm_shape(filter(service_areas_2016, CMA_name == "Vancouver (B)" & library == TRUE), ext = 1.1) +
  tm_borders(col = 'black')+
  tm_shape(filter(CTs_2016, CMA_name == "Vancouver (B)")) +
  tm_polygons(("housing_need_pct"), border.alpha = 0, breaks = c(0,0.1, 0.2, 0.3, 0.4, 0.5))  + 
  tm_shape(filter(service_areas_2016, CMA_name == "Vancouver (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "bottom"),
            frame = FALSE) +
  tm_compass()

#tm_shape(filter(CMAs_2006, CMA_name == "Vancouver (B)")) +
# tm_dots(col = 'black')+
tm_shape(filter(service_areas_2006, CMA_name == "Vancouver (B)" & library == TRUE), ext = 1.1) +
  tm_borders(col = 'black')+
  tm_shape(filter(CTs_2006, CMA_name == "Vancouver (B)")) +
  tm_polygons(("housing_need_pct"), border.alpha = 0, breaks = c(0,0.1, 0.2, 0.3, 0.4, 0.5))  + 
  tm_shape(filter(service_areas_2006, CMA_name == "Vancouver (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "bottom"),
            frame = FALSE) +
  tm_compass()

## Calgary 2016, 2006
#tm_shape(filter(CMAs_2016, CMA_name == "Calgary (B)")) +
# tm_dots(col = 'black')+
tm_shape(filter(service_areas_2016, CMA_name == "Calgary (B)" & library == TRUE), ext = 1.5) +
  tm_borders(col = 'black')+
  tm_shape(filter(CTs_2016, CMA_name == "Calgary (B)")) +
  tm_polygons(("housing_need_pct"), border.alpha = 0, breaks = c(0,0.1, 0.2, 0.3, 0.4, 0.5))  + 
  tm_shape(filter(service_areas_2016, CMA_name == "Calgary (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("right", "bottom"),
            frame = FALSE) +
  tm_compass()

#tm_shape(filter(CMAs_2006, CMA_name == "Calgary (B)")) +
# tm_borders(col = 'black')+
tm_shape(filter(service_areas_2006, CMA_name == "Calgary (B)" & library == TRUE), ext = 1.5) +
  tm_borders(col = 'black')+
  tm_shape(filter(CTs_2006, CMA_name == "Calgary (B)")) +
  tm_polygons(("housing_need_pct"), border.alpha = 0, breaks = c(0,0.1, 0.2, 0.3, 0.4, 0.5))  + 
  tm_shape(filter(service_areas_2006, CMA_name == "Calgary (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("right", "bottom"),
            frame = FALSE) +
  tm_compass()


## Montreal 2016, 2006
#tm_shape(filter(CMAs_2016, CMA_name == "Montreal (B)")) +
# tm_dots(col = 'black')+
tm_shape(filter(service_areas_2016, CMA_name == "Montreal (B)" & library == TRUE), ext = 1.1) +
  tm_borders(col = 'black')+
  tm_shape(filter(CTs_2016, CMA_name == "Montreal (B)")) +
  tm_polygons(("housing_need_pct"), border.alpha = 0, breaks = c(0,0.1, 0.2, 0.3, 0.4, 0.5))  + 
  tm_shape(filter(service_areas_2016, CMA_name == "Montreal (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"),
            frame = FALSE) +
  tm_compass()

## somethings wrong
#tm_shape(filter(CMAs_2006, CMA_name == "Montreal")) +
# tm_dots(col = 'black')+
tm_shape(filter(service_areas_2006, CMA_name == "Montreal" & library == TRUE), ext = 1.1) +
  tm_borders(col = 'black')+
  tm_shape(filter(CTs_2006, CMA_name == "Montreal (B)")) +
  tm_polygons(("housing_need_pct"), border.alpha = 0, breaks = c(0,0.1, 0.2, 0.3, 0.4, 0.5))  + 
  tm_shape(filter(service_areas_2006, CMA_name == "Montreal" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"),
            frame = FALSE) +
  tm_compass()

## Ottawa Gatineau 2016, 2006

#tm_shape(filter(CMAs_2016, CMA_name == "Ottawa - Gatineau (B)")) +
# tm_dots(col = 'black')+
tm_shape(filter(service_areas_2016, CMA_name == "Ottawa - Gatineau (B)" & library == TRUE)) +
  tm_borders(col = 'black')+
  tm_shape(filter(CTs_2016, CMA_name == "Ottawa - Gatineau (B)")) +
  tm_polygons(("housing_need_pct"), border.alpha = 0, breaks = c(0,0.1, 0.2, 0.3, 0.4, 0.5))  + 
  tm_shape(filter(service_areas_2016, CMA_name == "Ottawa - Gatineau (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"),
            frame = FALSE) +
  tm_compass()

#tm_shape(filter(CMAs_2006, CMA_name == "Ottawa - Gatineau (B)")) +
# tm_dots(col = 'black')+
tm_shape(filter(service_areas_2006, CMA_name == "Ottawa - Gatineau (B)" & library == TRUE), ext = 1.1) +
  tm_borders(col = 'black')+
  tm_shape(filter(CTs_2006, CMA_name == "Ottawa - Gatineau (B)")) +
  tm_polygons(("housing_need_pct"), border.alpha = 0, breaks = c(0,0.1, 0.2, 0.3, 0.4, 0.5))  + 
  tm_shape(filter(service_areas_2006, CMA_name == "Ottawa - Gatineau (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"),
            frame = FALSE) +
  tm_compass()


## Halifax 2016, 2006
#tm_shape(filter(CMAs_2016, CMA_name == "Halifax (B)")) +
# tm_dots(col = 'black')+
tm_shape(filter(service_areas_2016, CMA_name == "Halifax (B)" & library == TRUE)) +
  tm_borders(col = 'black')+
  tm_shape(filter(CTs_2016, CMA_name == "Halifax (B)")) +
  tm_polygons(("housing_need_pct"), border.alpha = 0, breaks = c(0,0.1, 0.2, 0.3, 0.4, 0.5))  + 
  tm_shape(filter(service_areas_2016, CMA_name == "Halifax (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"),
            frame = FALSE) +
  tm_compass()

#tm_shape(filter(CMAs_2006, CMA_name == "Halifax(B)")) +
# tm_dots(col = 'black')+
tm_shape(filter(service_areas_2006, CMA_name == "Halifax (B)" & library == TRUE)) +
  tm_borders(col = 'black')+
  tm_shape(filter(CTs_2006, CMA_name == "Halifax (B)")) +
  tm_polygons(("housing_need_pct"), border.alpha = 0, breaks = c(0,0.1, 0.2, 0.3, 0.4, 0.5))  + 
  tm_shape(filter(service_areas_2006, CMA_name == "Halifax (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"),
            frame = FALSE) +
  tm_compass()

## Edmonton 2016, 2006
#tm_shape(filter(CMAs_2016, CMA_name == "Edmonton (B)")) +
# tm_dots(col = 'black')+
tm_shape(filter(service_areas_2016, CMA_name == "Edmonton (B)" & library == TRUE), ext = 1.5) +
  tm_borders(col = 'black')+
  tm_shape(filter(CTs_2016, CMA_name == "Edmonton (B)")) +
  tm_polygons(("housing_need_pct"), border.alpha = 0, breaks = c(0,0.1, 0.2, 0.3, 0.4, 0.5))  + 
  tm_shape(filter(service_areas_2016, CMA_name == "Edmonton (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"),
            frame = FALSE) +
  tm_compass()

#tm_shape(filter(CMAs_2006, CMA_name == "Edmonton (B)")) +
# tm_dots(col = 'black')+
tm_shape(filter(service_areas_2006, CMA_name == "Edmonton (B)" & library == TRUE), ext = 1.5) +
  tm_borders(col = 'black')+
  tm_shape(filter(CTs_2006, CMA_name == "Edmonton (B)")) +
  tm_polygons(("housing_need_pct"), border.alpha = 0, breaks = c(0,0.1, 0.2, 0.3, 0.4, 0.5))  + 
  tm_shape(filter(service_areas_2006, CMA_name == "Edmonton (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"),
            frame = FALSE) +
  tm_compass()


## FIGURE 8 ##################
# Toronto
#tm_shape(filter(CMAs_2016, CMA_name == "Toronto (B)")) +
# tm_dots(col = 'black')+
tm_shape(filter(service_areas_2016, CMA_name == "Toronto (B)" & library == TRUE)) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Toronto (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct",
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2016, CMA_name == "Toronto (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Toronto 2016", 
            main.title.position = "left", 
            legend.position = c("right", "bottom"),
            frame = FALSE) +
  tm_compass()

# Montreal
# tm_shape(filter(CMAs_2016, CMA_name == "Montreal (B)")) +
# tm_dots(col = 'black')+
tm_shape(filter(service_areas_2016, CMA_name == "Montreal (B)" & library == TRUE)) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Montreal (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct",
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2016, CMA_name == "Montreal (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Montreal", 
            main.title.position = "left", 
            legend.position = c("left", "top"),
            frame = FALSE) +
  tm_compass()

# Calgary
# tm_shape(filter(CMAs_2016, CMA_name == "Calgary (B)")) +
# tm_dots(col = 'black')+
tm_shape(filter(service_areas_2016, CMA_name == "Calgary (B)" & library == TRUE), ext = 1.5) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Calgary (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct",
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2016, CMA_name == "Calgary (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Calgary", 
            main.title.position = "left", 
            legend.position = c("right", "bottom"),
            frame = FALSE) +
  tm_compass()

# Edmonton
#tm_shape(filter(CMAs_2016, CMA_name == "Edmonton (B)")) +
# tm_dots(col = 'black')+
tm_shape(filter(service_areas_2016, CMA_name == "Edmonton (B)" & library == TRUE), ext = 1.2) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Edmonton (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct",
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2016, CMA_name == "Edmonton (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Edmonton", 
            main.title.position = "left", 
            legend.position = c("left", "top"),
            frame = FALSE) +
  tm_compass()


# Halifax
# tm_shape(filter(CMAs_2016, CMA_name == "Halifax (B)")) +
# tm_dots(col = 'black')+
tm_shape(filter(service_areas_2016, CMA_name == "Halifax (B)" & library == TRUE)) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Halifax (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct",
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2016, CMA_name == "Halifax (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(main.title = "Halifax", 
            main.title.position = "left", 
            legend.position = c("left", "top"),
            frame = FALSE) +
  tm_compass()

# Oshawa
# tm_shape(filter(CMAs_2016, CMA_name == "Oshawa (B)")) +
# tm_dots(col = 'black')+
tm_shape(filter(service_areas_2016, CMA_name == "Oshawa (B)" & library == TRUE), ext = 3) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Oshawa (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct",
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 4) +
  tm_shape(filter(service_areas_2016, CMA_name == "Oshawa (B)" & library == TRUE)) +
  tm_borders(col = 'black') +
  tm_layout(main.title = "Oshawa", 
            main.title.position = "left", 
            legend.position = c("right", "bottom"),
            frame = FALSE) +
  tm_compass()

# Saskatoon
# tm_shape(filter(CMAs_2016, CMA_name == "Saskatoon (B)")) +
# tm_dots(col = 'black')+
tm_shape(filter(service_areas_2016, CMA_name == "Saskatoon (B)" & library == TRUE), ext = 2) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Saskatoon (B)")) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct",
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(service_areas_2016, CMA_name == "Saskatoon (B)" & library == TRUE)) +
  tm_borders(col = 'black') +
  tm_layout(main.title = "Saskatoon", 
            main.title.position = "left", 
            legend.position = c("right", "bottom"),
            frame = FALSE) +
  tm_compass()
