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
  #  tm_shape(water) +
  #    tm_fill(col = "grey85") +
  #  tm_shape(coastal_water) +
  #    tm_fill(col = "grey85") +
  tm_shape(filter(service_areas_2016, CMA_name == "Montreal (B)" & 
                    library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"),
            frame = FALSE) +
  tm_compass()

tmap_save(figure_3, "output/figure_3.png", width = 2400, height = 2400)

figure_3a <- 
  tm_shape(st_buffer(
    filter(libraries_2016, Library_System == 
             "Bibliotheque et Archives Nationales du Quebec"), 1000),
    ext = 12) +
  tm_dots(col = 'black')+
  tm_shape(filter(CMAs_2016, CMA_name == "Montreal (B)")) +
  tm_borders(col="black", alpha = 0.3) +
  tm_shape(filter(libraries, str_detect(Library_System, "Montreal"))) +
  tm_dots(col = 'black') +
  tm_layout(legend.position = c("left", "top"),
            frame = FALSE) +
  tm_compass()

tmap_save(figure_3a, "output/figure_3a.png", width = 2400, height = 2400)


figure_3b <- 
  tm_shape(st_buffer(
    filter(libraries_2016, Library_System == 
             "Bibliotheque et Archives Nationales du Quebec"), 1000),
    ext = 12) +
  tm_dots(col = 'black')+
  tm_shape(filter(CMAs_2016, CMA_name == "Montreal (B)")) +
  tm_borders(col="black", alpha = 0.3) +
  tm_shape(filter(libraries, str_detect(Library_System, "Montreal"))) +
  tm_dots(col = 'black')+
  tm_shape(filter(service_areas_2016, CMA_name == "Montreal (B)" & 
                    library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"),
            frame = FALSE) +
  tm_compass()
tmap_save(figure_3b, "output/figure_3b.png", width = 2400, height = 2400)



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



## Facet Wrap of previous graphs: Demographic variables in 2006 and 2016
# (removes lone parent variable)

library_service_comparison_tidy <-
  gather(library_service_comparison, housing_need, visible_minorities,
         unemployed_pct, med_income, key = "census_variable",
         value = "value") %>% 
  drop_units()

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

