## EDA
ggplot(library_service_comparison_2006)+
  geom_point(mapping = aes(CMA_name, housing_need, color=library))

ggplot(library_service_comparison_2016)+
  geom_point(mapping = aes(CMA_name, housing_need, color=library))

## Highest Core Housing Need 
library_service_comparison_2016 %>% 
  filter(housing_need > 0.14) %>% 
  ggplot(mapping = aes(x = housing_need, y = CMA_name, color=library)) +
  geom_point() + 
  geom_smooth(se = FALSE)

## Biggest Gaps
## 1. Need to subtract library service comparison 2016-2006
# Create shared variable for service areas // non-service areas

lib_true_2006 <- library_service_comparison_2006 %>%
  ungroup()%>%
  mutate (CMA_lib = if_else(library==TRUE, "T", "F"))
lib_true_2006 <- lib_true_2006 %>%
  mutate (CMA_lib2 = paste(as.character(CMA_name), as.character(CMA_lib), sep='_'))

lib_true_2016 <- library_service_comparison_2016 %>%
  ungroup()%>%
  mutate (CMA_lib = if_else(library==TRUE, "T", "F"))
lib_true_2016 <- lib_true_2016 %>%
  mutate (CMA_lib2 = paste(as.character(CMA_name), as.character(CMA_lib), sep='_'))

## Join 2006 and 2016 by CMA_NAME and LiBRARY SERVICE AREA (true/false)
lib_change <- lib_true_2016 %>% 
  inner_join(st_drop_geometry(lib_true_2006), by = c("CMA_lib2" = "CMA_lib2"))

lib_change %>% 
  st_drop_geometry() %>% 
  distinct()


## Calculate change in variables
lib_change <- lib_change %>%
  mutate(housing_need_ch = housing_need.x - housing_need.y)

lib_change <- lib_change %>%
  mutate(immigrants_ch = immigrants.x - immigrants.y)
  
lib_change <- lib_change %>%
  mutate(med_income_ch = med_income.x - med_income.y)

lib_change <- lib_change %>%
  mutate(visible_minorities_ch = visible_minorities.x - visible_minorities.y)

lib_change <- lib_change %>%
  mutate(unemployed_pct_change = unemployed_pct.x - unemployed_pct.y)

lib_change <- lib_change %>% 
  st_drop_geometry() %>% 
  distinct(population.x, housing_need.x, .keep_all = TRUE)

lib_change <- lib_change %>% 
  filter(region.x == region.y)


## graphing housing need
ggplot(lib_change)+
  geom_point(mapping = aes(CMA_name.x, housing_need_ch, color=library.x))+
  facet_wrap(~region.y)

ggplot(lib_change)+
  geom_point(mapping = aes(CMA_name.x, med_income_ch, color=library.x))+
  #geom_text_repel(data = subset(lib_change, library.x == TRUE),
  #                aes(CMA_name.x, med_income_ch, label = CMA_name.x)) +
  facet_wrap(~region.y)


ggplot(lib_change)+
  geom_point(mapping = aes(CMA_name.x, immigrants_ch, color=library.x))+
  facet_wrap(~region.y)

ggplot(lib_change)+
  geom_point(mapping = aes(CMA_name.x, visible_minorities_ch, color=library.x))+
  facet_wrap(~region.y)

ggplot(lib_change)+
  geom_point(mapping = aes(CMA_name.x, unemployed_pct_change, color=library.x))+
  facet_wrap(~region.y)

# Greatest change
lib_change %>% 
  filter(housing_need_ch > 0.09) %>% 
  ggplot(mapping = aes(x = housing_need_ch, y = CMA_name.x, color=library.x)) +
  geom_point() + 
  geom_smooth(se = FALSE)


lib_change %>% 
  filter(region.y == "Quebec") %>% 
  view()



library_service_comparison_2006 %>% 
  filter(region == "Montreal")

