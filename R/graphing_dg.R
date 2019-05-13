# as numeric
library_service_comparison_2006_num <- library_service_comparison_2006 %>%
  mutate(immigrants = as.numeric(immigrants))%>%
  mutate(population = as.numeric(population))%>%
  mutate(housing_need = as.numeric(housing_need)) %>%
  mutate(lone_parent = as.numeric(lone_parent)) 

library_service_comparison_2016_num <- library_service_comparison_2016 %>%
  mutate(immigrants = as.numeric(immigrants))%>%
  mutate(population = as.numeric(population))%>%
  mutate(housing_need = as.numeric(housing_need)) %>%
  mutate(lone_parent = as.numeric(lone_parent))


## EDA
ggplot(library_service_comparison_2006_num)+
  geom_point(mapping = aes(CMA_name, housing_need, color=library))

ggplot(library_service_comparison_2016_num)+
  geom_point(mapping = aes(CMA_name, housing_need, color=library))


## Highest Core Housing Need 
library_service_comparison_2016_num %>% 
  filter(housing_need > 0.14) %>% 
  ggplot(mapping = aes(x = housing_need, y = CMA_name, color=library)) +
  geom_point() + 
  geom_smooth(se = FALSE)

## Biggest Gaps
## 1. Need to subtract library service comparison 2016-2006

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

lib_change <- lib_change %>%
  mutate(housing_need_ch = housing_need.x - housing_need.y)
  

