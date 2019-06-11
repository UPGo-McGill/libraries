### FINAL FIGURES #############################################################

source("R/01_helper_functions.R")


## FIGURE 1. MAP OF BANQ AREA (WITH NO BUFFERS AT ALL)

figure_1 <-
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
  tm_shape(water) +
    tm_fill(col = "grey85") +
  tm_shape(coastal_water) +
    tm_fill(col = "grey85") +
  tm_shape(filter(libraries_2016, Library_System ==
                    "Bibliotheque et Archives Nationales du Quebec")) +
    tm_dots(col= 'black', size = 1) +
  tm_layout(legend.position = c("left", "top"),
            frame = FALSE) +
  tm_compass()

tmap_save(figure_1, "output/figure_1.png", width = 2400, height = 2400)


## FIGURE 2. MAP OF BANQ AREA (WITH BANQ BUFFER DRAWN ON)

figure_2 <- 
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
  tm_shape(water) +
    tm_fill(col = "grey85") +
  tm_shape(coastal_water) +
    tm_fill(col = "grey85") +
  tm_shape(st_buffer(
    filter(libraries_2016, Library_System ==
             "Bibliotheque et Archives Nationales du Quebec"), 1000)) +
    tm_borders(col= 'black') +
  
  tm_layout(legend.position = c("left", "top"),
            frame = FALSE) +
  tm_compass()

tmap_save(figure_2, "output/figure_2.png", width = 2400, height = 2400)


## FIGURE 3. MAP OF MONTREAL WITH ALL LIBRARY BUFFERS (2016)

figure_3 <- 
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
  tm_shape(water) +
    tm_fill(col = "grey85") +
  tm_shape(coastal_water) +
    tm_fill(col = "grey85") +
  tm_shape(filter(service_areas_2016, CMA_name == "Montreal (B)" & 
                    library == TRUE)) +
    tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"),
            frame = FALSE) +
  tm_compass()

tmap_save(figure_3, "output/figure_3.png", width = 2400, height = 2400)



## FIGURE 4. ZOOMED OUT MAP OF MONTREAL WITH ALL LIBRARY BUFFERS

figure_4 <- 
  tm_shape(filter(CTs_2016, CMA_name == "Montreal (B)")) +
    tm_fill("housing_need_pct",
            border.alpha = 0,
            breaks = c(0,0.1, 0.2, 0.3, 0.4, 0.5),
            legend.format=list(fun=function(x) {
              paste0(formatC(x * 100, digits = 0, format="f"), " %")
            })) +
  tm_shape(water) +
    tm_fill(col = "grey85") +
  tm_shape(coastal_water) +
    tm_fill(col = "grey85") +
  tm_shape(filter(service_areas_2016, CMA_name == "Montreal (B)" & 
                    library == TRUE)) +
    tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"),
            frame = FALSE) +
  tm_compass()

tmap_save(figure_4, "output/figure_4.png", width = 2400, height = 2400)


## FIGURE 5a LOLLIPOP GRAPH OF 2016 HOUSING NEED

figure_5a <- 
  library_service_comparison %>%
  filter(date == "2016") %>%
  ggplot(aes(housing_need, reorder(CMA_name, housing_need))) +
  geom_line(aes(group = interaction(CMA_name, PR_UID)), colour = "grey80") +
  geom_point(aes(color = library)) +
  scale_x_continuous(labels = scales::percent) +
  theme_minimal() +
  theme(axis.title.y = element_blank()) +
  theme(axis.title.x = element_blank())

ggsave("output/figure_5a.png", figure_5a, "png", width = 8, height = 6,
       units = "in", dpi = 240)

## FIGURE 5b LOLLIPOP GRAPH OF 2016 MEDIAN INCOME

figure_5b <- 
  library_service_comparison %>%
  filter(date == "2016") %>%
  ggplot(aes(med_income, reorder(CMA_name, med_income))) +
  geom_line(aes(group = interaction(CMA_name, PR_UID)), colour = "grey80") +
  geom_point(aes(color = library)) +
  scale_x_continuous(labels = scales::dollar) +
  theme_minimal() +
  theme(axis.title.y = element_blank()) +
  theme(axis.title.x = element_blank())

ggsave("output/figure_5b.png", figure_5b, "png", width = 8, height = 6,
       units = "in", dpi = 240)


## FIGURE 5c LOLLIPOP GRAPH OF 2016 UNEMPLOYMENT (PRC)

figure_5c <- 
  library_service_comparison %>%
  filter(date == "2016") %>%
  ggplot(aes(unemployed_pct, reorder(CMA_name, unemployed_pct))) +
  geom_line(aes(group = interaction(CMA_name, PR_UID)), colour = "grey80") +
  geom_point(aes(color = library)) +
  scale_x_continuous(labels = scales::percent) +
  theme_minimal() +
  theme(axis.title.y = element_blank()) +
  theme(axis.title.x = element_blank())

ggsave("output/figure_5c.png", figure_5c, "png", width = 8, height = 6,
       units = "in", dpi = 240)

## FIGURE 5d LOLLIPOP GRAPH OF 2016 VISIBLE MINORITIES

figure_5d <- 
  library_service_comparison %>%
  filter(date == "2016") %>%
  ggplot(aes(visible_minorities, reorder(CMA_name, visible_minorities))) +
  geom_line(aes(group = interaction(CMA_name, PR_UID)), colour = "grey80") +
  geom_point(aes(color = library)) +
  scale_x_continuous(labels = scales::percent) +
  theme_minimal() +
  theme(axis.title.y = element_blank()) +
  theme(axis.title.x = element_blank())

ggsave("output/figure_5d.png", figure_5d, "png", width = 8, height = 6,
       units = "in", dpi = 240)


## 2016 maps #############

# Montreal

city_name = "Montreal (B)"

city <- 
  tm_shape(
    filter(service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == city_name)) +
  tm_polygons(c("unemployed_pct", "med_income", "housing_need_pct",
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_shape(water) +
  tm_fill(col = "grey85") +
  tm_shape(coastal_water) +
  tm_fill(col = "grey85") +
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(
    service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"), frame = FALSE)

tmap_save(city, "output/Montreal_city.png", width = 2400,
          height = 2400)

CMA <- 
  tm_shape(filter(CMAs_2016, CMA_name == city_name)) +
  tm_dots(col = 'black')+
  tm_shape(
    filter(service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == city_name)) +
  tm_polygons(c("unemployed_pct", "med_income", "housing_need_pct",
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_shape(water) +
  tm_fill(col = "grey85") +
  tm_shape(coastal_water) +
  tm_fill(col = "grey85") +
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(
    service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"), frame = FALSE)

tmap_save(CMA, "output/Montreal_CMA.png", width = 2400, height = 2400)


# Toronto

city_name = "Toronto (B)"

city <- 
  tm_shape(
    filter(service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == city_name)) +
  tm_polygons(c("unemployed_pct", "med_income", "housing_need_pct",
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_shape(water) +
  tm_fill(col = "grey85") +
  tm_shape(coastal_water) +
  tm_fill(col = "grey85") +
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(
    service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"), frame = FALSE)

tmap_save(city, "output/Toronto_city.png", width = 2400,
          height = 2400)

CMA <- 
  tm_shape(filter(CMAs_2016, CMA_name == city_name)) +
  tm_dots(col = 'black')+
  tm_shape(
    filter(service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == city_name)) +
  tm_polygons(c("unemployed_pct", "med_income", "housing_need_pct",
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_shape(water) +
  tm_fill(col = "grey85") +
  tm_shape(coastal_water) +
  tm_fill(col = "grey85") +
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(
    service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"), frame = FALSE)

tmap_save(CMA, "output/Toronto_CMA.png", width = 2400, height = 2400)


# Vancouver

city_name = "Vancouver (B)"

city <- 
  tm_shape(
    filter(service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == city_name)) +
  tm_polygons(c("unemployed_pct", "med_income", "housing_need_pct",
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_shape(water) +
  tm_fill(col = "grey85") +
  tm_shape(coastal_water) +
  tm_fill(col = "grey85") +
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(
    service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"), frame = FALSE)

tmap_save(city, "output/Vancouver_city.png", width = 2400,
          height = 2400)

CMA <- 
  tm_shape(filter(CMAs_2016, CMA_name == city_name)) +
  tm_dots(col = 'black')+
  tm_shape(
    filter(service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == city_name)) +
  tm_polygons(c("unemployed_pct", "med_income", "housing_need_pct",
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_shape(water) +
  tm_fill(col = "grey85") +
  tm_shape(coastal_water) +
  tm_fill(col = "grey85") +
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(
    service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"), frame = FALSE)

tmap_save(CMA, "output/Vancouver_CMA.png", width = 2400, height = 2400)


# Ottawa

city_name = "Ottawa - Gatineau (B)"

city <- 
  tm_shape(
    filter(service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == city_name)) +
  tm_polygons(c("unemployed_pct", "med_income", "housing_need_pct",
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_shape(water) +
  tm_fill(col = "grey85") +
  tm_shape(coastal_water) +
  tm_fill(col = "grey85") +
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(
    service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"), frame = FALSE)

tmap_save(city, "output/Ottawa_city.png", width = 2400,
          height = 2400)

CMA <- 
  tm_shape(filter(CMAs_2016, CMA_name == city_name)) +
  tm_dots(col = 'black')+
  tm_shape(
    filter(service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == city_name)) +
  tm_polygons(c("unemployed_pct", "med_income", "housing_need_pct",
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_shape(water) +
  tm_fill(col = "grey85") +
  tm_shape(coastal_water) +
  tm_fill(col = "grey85") +
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(
    service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"), frame = FALSE)

tmap_save(CMA, "output/Ottawa_CMA.png", width = 2400, height = 2400)


# Calgary

city_name = "Calgary (B)"

city <- 
  tm_shape(
    filter(service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == city_name)) +
  tm_polygons(c("unemployed_pct", "med_income", "housing_need_pct",
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_shape(water) +
  tm_fill(col = "grey85") +
  tm_shape(coastal_water) +
  tm_fill(col = "grey85") +
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(
    service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"), frame = FALSE)

tmap_save(city, "output/Calgary_city.png", width = 2400,
          height = 2400)

CMA <- 
  tm_shape(filter(CMAs_2016, CMA_name == city_name)) +
  tm_dots(col = 'black')+
  tm_shape(
    filter(service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == city_name)) +
  tm_polygons(c("unemployed_pct", "med_income", "housing_need_pct",
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_shape(water) +
  tm_fill(col = "grey85") +
  tm_shape(coastal_water) +
  tm_fill(col = "grey85") +
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(
    service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"), frame = FALSE)

tmap_save(CMA, "output/Calgary_CMA.png", width = 2400, height = 2400)


# Halifax

city_name = "Halifax (B)"

city <- 
  tm_shape(
    filter(service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == city_name)) +
  tm_polygons(c("unemployed_pct", "med_income", "housing_need_pct",
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_shape(water) +
  tm_fill(col = "grey85") +
  tm_shape(coastal_water) +
  tm_fill(col = "grey85") +
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(
    service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"), frame = FALSE)

tmap_save(city, "output/Halifax_city.png", width = 2400,
          height = 2400)

CMA <- 
  tm_shape(filter(CMAs_2016, CMA_name == city_name)) +
  tm_dots(col = 'black')+
  tm_shape(
    filter(service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == city_name)) +
  tm_polygons(c("unemployed_pct", "med_income", "housing_need_pct",
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_shape(water) +
  tm_fill(col = "grey85") +
  tm_shape(coastal_water) +
  tm_fill(col = "grey85") +
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(
    service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"), frame = FALSE)

tmap_save(CMA, "output/Halifax_CMA.png", width = 2400, height = 2400)


# Edmonton

city_name = "Edmonton (B)"

city <- 
  tm_shape(
    filter(service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == city_name)) +
  tm_polygons(c("unemployed_pct", "med_income", "housing_need_pct",
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_shape(water) +
  tm_fill(col = "grey85") +
  tm_shape(coastal_water) +
  tm_fill(col = "grey85") +
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(
    service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"), frame = FALSE)

tmap_save(city, "output/Edmonton_city.png", width = 2400,
          height = 2400)

CMA <- 
  tm_shape(filter(CMAs_2016, CMA_name == city_name)) +
  tm_dots(col = 'black')+
  tm_shape(
    filter(service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == city_name)) +
  tm_polygons(c("unemployed_pct", "med_income", "housing_need_pct",
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_shape(water) +
  tm_fill(col = "grey85") +
  tm_shape(coastal_water) +
  tm_fill(col = "grey85") +
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(
    service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"), frame = FALSE)

tmap_save(CMA, "output/Edmonton_CMA.png", width = 2400, height = 2400)


# Oshawa

city_name = "Oshawa (B)"

city <- 
  tm_shape(
    filter(service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == city_name)) +
  tm_polygons(c("unemployed_pct", "med_income", "housing_need_pct",
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_shape(water) +
  tm_fill(col = "grey85") +
  tm_shape(coastal_water) +
  tm_fill(col = "grey85") +
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(
    service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"), frame = FALSE)

tmap_save(city, "output/Oshawa_city.png", width = 2400,
          height = 2400)

CMA <- 
  tm_shape(filter(CMAs_2016, CMA_name == city_name)) +
  tm_dots(col = 'black')+
  tm_shape(
    filter(service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == city_name)) +
  tm_polygons(c("unemployed_pct", "med_income", "housing_need_pct",
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_shape(water) +
  tm_fill(col = "grey85") +
  tm_shape(coastal_water) +
  tm_fill(col = "grey85") +
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(
    service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"), frame = FALSE)

tmap_save(CMA, "output/Oshawa_CMA.png", width = 2400, height = 2400)


# Saskatoon

city_name = "Saskatoon (B)"

city <- 
  tm_shape(
    filter(service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == city_name)) +
  tm_polygons(c("unemployed_pct", "med_income", "housing_need_pct",
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_shape(water) +
  tm_fill(col = "grey85") +
  tm_shape(coastal_water) +
  tm_fill(col = "grey85") +
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(
    service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"), frame = FALSE)

tmap_save(city, "output/Saskatoon_city.png", width = 2400,
          height = 2400)

CMA <- 
  tm_shape(filter(CMAs_2016, CMA_name == city_name)) +
  tm_dots(col = 'black')+
  tm_shape(
    filter(service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == city_name)) +
  tm_polygons(c("unemployed_pct", "med_income", "housing_need_pct",
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_shape(water) +
  tm_fill(col = "grey85") +
  tm_shape(coastal_water) +
  tm_fill(col = "grey85") +
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(
    service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"), frame = FALSE)

tmap_save(CMA, "output/Saskatoon_CMA.png", width = 2400, height = 2400)


# Chilliwack

city_name = "Chilliwack (K)"

city <- 
  tm_shape(
    filter(service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == city_name)) +
  tm_polygons(c("unemployed_pct", "med_income", "housing_need_pct",
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_shape(water) +
  tm_fill(col = "grey85") +
  tm_shape(coastal_water) +
  tm_fill(col = "grey85") +
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(
    service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"), frame = FALSE)

tmap_save(city, "output/Chilliwack_city.png", width = 2400,
          height = 2400)

CMA <- 
  tm_shape(filter(CMAs_2016, CMA_name == city_name)) +
  tm_dots(col = 'black')+
  tm_shape(
    filter(service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_2016, CMA_name == city_name)) +
  tm_polygons(c("unemployed_pct", "med_income", "housing_need_pct",
                "visible_minorities_pct"), border.alpha = 0)  + 
  tm_shape(water) +
  tm_fill(col = "grey85") +
  tm_shape(coastal_water) +
  tm_fill(col = "grey85") +
  tm_facets(sync = TRUE, ncol = 2) +
  tm_shape(filter(
    service_areas_2016, CMA_name == city_name & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"), frame = FALSE)

tmap_save(CMA, "output/Chilliwack_CMA.png", width = 2400, height = 2400)


## FIGURE 6. ALL FIVE VARIABLE 2006/2016 COMPARISONS ACROSS ALL REGIONS ####

figure_6 <- 
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

ggsave("output/figure_6.png", figure_6, "png", width = 8, height = 8,
       units = "in", dpi = 240)


## FIGURE 7a 2006/2016 CORE HOUSING NEED COMPARISON ACROSS ALL REGIONS

figure_7a <-
  lib_change %>%
  ggplot(aes(housing_need_ch, reorder(CMA_name.x, housing_need_ch))) +
  geom_line(aes(group = interaction(CMA_name.x, PR_UID)), colour = "grey80") +
  geom_point(aes(color = library)) +
  scale_x_continuous(labels = scales::percent) +
  theme_minimal() +
  theme(axis.title.y = element_blank()) +
  theme(axis.title.x = element_blank())

ggsave("output/figure_7a.png", figure_7a, "png", width = 8, height = 6,
       units = "in", dpi = 240)


## FIGURE 7b CORE HOUSING NEED CHANGE 2006/2016 ACROSS MAJOR REGIONS

figure_7b <-
  lib_change %>%
  ggplot(aes(reorder(CMA_name.x, housing_need_ch), housing_need_ch)) +
  geom_line(aes(group = interaction(CMA_name.x, PR_UID)), colour = "grey80") +
  geom_point(mapping = aes(color=library)) +
  geom_text_repel(data = filter(lib_change, library == TRUE),
                  aes(label = CMA_name.x), size = 1.5) +
  theme_minimal() +
  theme(axis.title.y = element_blank(), axis.title.x = element_blank(),
        axis.text.x = element_blank()) +
  scale_y_continuous(labels = scales::percent) +
  facet_wrap(~region.y)

ggsave("output/figure_7b.png", figure_7b, "png", width = 8, height = 6,
       units = "in", dpi = 240)


## FIGURE 8 MEDIAN INCOME CHANGE 2006/2016 ACROSS MAJOR REGIONS

figure_8 <-
  lib_change %>%
  ggplot(aes(reorder(CMA_name.x, med_income_ch), med_income_ch)) +
  geom_line(aes(group = interaction(CMA_name.x, PR_UID)), colour = "grey80") +
  geom_point(mapping = aes(color=library)) +
  geom_text_repel(data = filter(lib_change, library == TRUE),
                  aes(label = CMA_name.x), size = 1.5) +
  theme_minimal() +
  theme(axis.title.y = element_blank(), axis.title.x = element_blank(),
        axis.text.x = element_blank()) +
  scale_y_continuous(labels = scales::dollar) +
  facet_wrap(~region.y)

ggsave("output/figure_8.png", figure_8, "png", width = 8, height = 6,
       units = "in", dpi = 240)


## FIGURE 9 VISIBLE MINORITY CHANGE 2006/2016 ACROSS MAJOR REGIONS

figure_9 <-
  lib_change %>%
  ggplot(aes(reorder(CMA_name.x, visible_minorities_ch),
             visible_minorities_ch)) +
  geom_line(aes(group = interaction(CMA_name.x, PR_UID)), colour = "grey80") +
  geom_point(mapping = aes(color=library)) +
  geom_text_repel(data = filter(lib_change, library == TRUE),
                  aes(label = CMA_name.x), size = 1.5) +
  theme_minimal() +
  theme(axis.title.y = element_blank(), axis.title.x = element_blank(),
        axis.text.x = element_blank()) +
  scale_y_continuous(labels = scales::percent) +
  facet_wrap(~region.y)

ggsave("output/figure_9.png", figure_9, "png", width = 8, height = 6,
       units = "in", dpi = 240)