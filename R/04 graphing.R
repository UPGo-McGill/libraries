## GRAPHING ############

source("R/01 helper_functions.R")
source("R/02 data_import.R")
source("R/03 service_area_comparison.R")

## Tidying data
tidy_summary_2006 <- gather(summary_2006_weighted, housing_need, lone_parent, 
                            immigrants, visible_minorities, unemployed_pct, 
                            med_income, key = "census_variable", value = "value") %>% 
                            mutate(date = "2006") %>% 
                            drop_units()

tidy_summary_2016 <- gather(summary_2016_weighted, housing_need, lone_parent, 
                            immigrants, visible_minorities, unemployed_pct, 
                            med_income, key = "census_variable", value = "value") %>% 
                            mutate(date = "2016") %>% 
                            drop_units()

tidy_summary <- rbind(tidy_summary_2006, tidy_summary_2016)

rm(tidy_summary_2006, tidy_summary_2016)

library_service_comparison <- rbind(library_service_comparison_2006 %>% 
                              mutate(date = "2006"), 
                              library_service_comparison_2016 %>% 
                              mutate(date = "2016")) %>% 
                              group_by(CMA_name) %>% 
                              drop_units()

Canada_summary <- rbind(Canada_2006 %>% 
                          mutate(date = "2006") %>% 
                          select(-c(1, 4:5, 7:8)), 
                        Canada_2016 %>% 
                          mutate(date = "2016") %>% 
                          select(-c(1, 4:5, 7:8)))
names(Canada_summary) <- c("population", "unemployed_pct", "med_income", "housing_need", "lone_parent", 
                           "immigrants", "visible_minorities", "date", "geometry")

# Making summary graphs of each year using weighted means
tidy_summary %>% 
  filter(census_variable == "housing_need") %>% 
  ggplot()+
  geom_point(aes(x = date, y = value, colour = library)) + 
  geom_point(data = Canada_summary,
             aes(x = date, y = housing_need))

tidy_summary %>% 
  filter(census_variable == "lone_parent") %>% 
  ggplot()+
  geom_point(aes(x = date, y = value, colour = library))+ 
  geom_point(data = Canada_summary,
             aes(x = date, y = lone_parent))

tidy_summary %>% 
  filter(census_variable == "immigrants") %>% 
  ggplot()+
  geom_point(aes(x = date, y = value, colour = library))+ 
  geom_point(data = Canada_summary,
             aes(x = date, y = immigrants))

tidy_summary %>% 
  filter(census_variable == "visible_minorities") %>% 
  ggplot()+
  geom_point(aes(x = date, y = value, colour = library))+ 
  geom_point(data = Canada_summary,
             aes(x = date, y = visible_minorities))

tidy_summary %>% 
  filter(census_variable == "unemployed_pct") %>% 
  ggplot()+
  geom_point(aes(x = date, y = value, colour = library))+ 
  geom_point(data = Canada_summary,
             aes(x = date, y = unemployed_pct))

tidy_summary %>% 
  filter(census_variable == "med_income") %>% 
  ggplot()+
  geom_point(aes(x = date, y = value, colour = library))+ 
  geom_point(data = Canada_summary,
             aes(x = date, y = med_income))

# Mapping housing need
 ggplot()+
  geom_point(data = library_service_comparison,
            aes(x = date, y = housing_need, colour = library, size = population), 
             alpha = 0.25) +
  geom_point(data = filter(tidy_summary, census_variable == "housing_need"),
             aes(x = date, y = value, colour = library), size = 10) + 
  geom_line(data = filter(tidy_summary, census_variable == "housing_need"),
             aes(x = date, y = value, colour = library, group = library))+
  geom_point(data = Canada_summary,
              aes(x = date, y = housing_need))
  