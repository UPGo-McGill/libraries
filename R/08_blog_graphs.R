## FIG 1: LOLLIPOP GRAPH OF 2016 MEDIAN INCOME

figure1 <- 
  library_service_comparison %>%
  filter(date == "2016") %>%
  ggplot(aes(housing_need, reorder(CMA_name, housing_need))) +
  geom_line(aes(group = interaction(CMA_name, PR_UID)), colour = "grey80") +
  geom_point(aes(color = library)) +
  scale_x_continuous(labels = scales::percent) +
  theme_minimal() +
  theme(axis.title.y = element_blank()) +
  theme(axis.title.x = element_blank())

## FIG 2. MAP OF MONTREAL WITH ALL LIBRARY BUFFERS (2016)
figure2 <- 
  tm_shape(st_buffer(
    filter(libraries_2016, Library_System == 
             "Bibliotheque et Archives Nationales du Quebec"), 1000),
    ext = 12) +
  tm_dots(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Montreal (B)")) +
  tm_polygons("housing_need_pct", border.alpha = 0,
              legend.format=list(fun=function(x) {
                paste0(formatC(x * 100, digits = 0, format="f"), " %")
              })) +
 # tm_shape(water) +
#  tm_fill(col = "grey85") +
#  tm_shape(coastal_water) +
#  tm_fill(col = "grey85") +
  tm_shape(filter(service_areas_2016, CMA_name == "Montreal (B)" & 
                    library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"),
            frame = FALSE) +
  tm_compass()

## FIG.3: ALL VARIABLES CHANGE 2006-2016

## Facet Wrap of previous graphs: Demographic variables in 2006 and 2016
# (removes lone parent variable)

library_service_comparison_tidy <-
  gather(library_service_comparison, housing_need, visible_minorities,
         unemployed_pct, med_income, key = "census_variable",
         value = "value") %>% 
  drop_units()

figure3 <- 
  tidy_summary %>% 
  filter(census_variable != "immigrants" & census_variable != "lone_parent") %>%
  ggplot()+
  geom_line(data = filter(library_service_comparison_tidy, value < 100000),
            aes(x = date, y = value, colour = library,
                group = interaction(library, CMA_name)), 
            alpha = 0.2) +
  geom_point(data = filter(library_service_comparison_tidy, value < 100000),
             aes(x = date, y = value, colour = library), 
             alpha = 0.2) +
  geom_point(aes(x = date, y = value, colour = library), size = 5) + 
  geom_line(aes(x = date, y = value, colour = library, group = library),
            size = 2) + 
  facet_wrap(~ census_variable, scales = "free")

## FIG. 4: HOUSING NEED CHANGE

figure4 <-
  lib_change %>%
  ggplot(aes(housing_need_ch, reorder(CMA_name.x, housing_need_ch))) +
  geom_line(aes(group = interaction(CMA_name.x, PR_UID)), colour = "grey80") +
  geom_point(aes(color = library)) +
  scale_x_continuous(labels = scales::percent) +
  theme_minimal() +
  theme(axis.title.y = element_blank()) +
  theme(axis.title.x = element_blank())

## FIG.5: MONTREAL
fig_montreal <- 
  tm_shape(
    filter(service_areas_2016, CMA_name == "Montreal (B)" & library == TRUE)) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Montreal (B)")) +
  tm_polygons(c("unemployed_pct", "med_income", "housing_need_pct",
                "visible_minorities_pct"), border.alpha = 0)  + 
  #  tm_shape(water) +
  #  tm_fill(col = "grey85") +
  #  tm_shape(coastal_water) +
  #  tm_fill(col = "grey85") +
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(
    service_areas_2016, CMA_name == "Montreal (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"), frame = FALSE)

fig_montreal2 <- 
  tm_shape(filter(CMAs_2016, CMA_name == "Montreal (B)")) +
  tm_dots(col = 'black')+
  tm_shape(
    filter(service_areas_2016, CMA_name == "Montreal (B)" & library == TRUE)) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Montreal (B)")) +
  tm_polygons(c("unemployed_pct", "med_income", "housing_need_pct",
                "visible_minorities_pct"), border.alpha = 0)  + 
  #  tm_shape(water) +
  #  tm_fill(col = "grey85") +
  #  tm_shape(coastal_water) +
  #  tm_fill(col = "grey85") +
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(
    service_areas_2016, CMA_name == "Montreal (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"), frame = FALSE)


## FIG.6: TORONTO

fig_toronto <- 
  tm_shape(
    filter(service_areas_2016, CMA_name == "Toronto (B)" & library == TRUE)) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Toronto (B)")) +
  tm_polygons(c("unemployed_pct", "med_income", "housing_need_pct",
                "visible_minorities_pct"), border.alpha = 0)  + 
  #  tm_shape(water) +
  #  tm_fill(col = "grey85") +
  #  tm_shape(coastal_water) +
  #  tm_fill(col = "grey85") +
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(
    service_areas_2016, CMA_name == "Toronto (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"), frame = FALSE)

fig_toronto2 <- 
  tm_shape(filter(CMAs_2016, CMA_name == "Toronto (B)")) +
  tm_dots(col = 'black')+
  tm_shape(
    filter(service_areas_2016, CMA_name == "Toronto (B)" & library == TRUE)) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Toronto (B)")) +
  tm_polygons(c("unemployed_pct", "med_income", "housing_need_pct",
                "visible_minorities_pct"), border.alpha = 0)  + 
  #  tm_shape(water) +
  #  tm_fill(col = "grey85") +
  #  tm_shape(coastal_water) +
  #  tm_fill(col = "grey85") +
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(
    service_areas_2016, CMA_name == "Toronto (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"), frame = FALSE)


## FIG.7: CALGARY
fig_calgary <- 
  tm_shape(
    filter(service_areas_2016, CMA_name == "Calgary (B)" & library == TRUE)) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Calgary (B)")) +
  tm_polygons(c("unemployed_pct", "med_income", "housing_need_pct",
                "visible_minorities_pct"), border.alpha = 0)  + 
  #  tm_shape(water) +
  #  tm_fill(col = "grey85") +
  #  tm_shape(coastal_water) +
  #  tm_fill(col = "grey85") +
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(
    service_areas_2016, CMA_name == "Calgary (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"), frame = FALSE)

fig_calgary2 <- 
  tm_shape(filter(CMAs_2016, CMA_name == "Calgary (B)")) +
  tm_dots(col = 'black')+
  tm_shape(
    filter(service_areas_2016, CMA_name == "Calgary (B)" & library == TRUE)) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Calgary (B)")) +
  tm_polygons(c("unemployed_pct", "med_income", "housing_need_pct",
                "visible_minorities_pct"), border.alpha = 0)  + 
  # tm_shape(water) +
  #  tm_fill(col = "grey85") +
  #  tm_shape(coastal_water) +
  #  tm_fill(col = "grey85") +
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(
    service_areas_2016, CMA_name == "Calgary (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"), frame = FALSE)

## FIG.8: VANCOUVER

fig_vancouver <- 
  tm_shape(
    filter(service_areas_2016, CMA_name == "Vancouver (B)" & library == TRUE)) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Vancouver (B)")) +
  tm_polygons(c("unemployed_pct", "med_income", "housing_need_pct",
                "visible_minorities_pct"), border.alpha = 0)  + 
  #  tm_shape(water) +
  #  tm_fill(col = "grey85") +
  #  tm_shape(coastal_water) +
  #  tm_fill(col = "grey85") +
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(
    service_areas_2016, CMA_name == "Vancouver (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"), frame = FALSE)

fig_vancouver2 <- 
  tm_shape(filter(CMAs_2016, CMA_name == "Vancouver (B)")) +
  tm_dots(col = 'black')+
  tm_shape(
    filter(service_areas_2016, CMA_name == "Vancouver (B)" & library == TRUE)) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == "Vancouver (B)")) +
  tm_polygons(c("unemployed_pct", "med_income", "housing_need_pct",
                "visible_minorities_pct"), border.alpha = 0)  + 
  #  tm_shape(water) +
  #  tm_fill(col = "grey85") +
  #  tm_shape(coastal_water) +
  #  tm_fill(col = "grey85") +
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(
    service_areas_2016, CMA_name == "Vancouver (B)" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"), frame = FALSE)
