## GRAPHING ############

source("R/helper_functions.R")
source("R/data_import.R")
source("R/service_area_comparison.R")

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


# Making graphs
tidy_summary %>% 
  filter(census_variable == "housing_need") %>% 
  ggplot()+
  geom_point(aes(x = date, y = value, colour = library))

tidy_summary %>% 
  filter(census_variable == "lone_parent") %>% 
  ggplot()+
  geom_point(aes(x = date, y = value, colour = library))

tidy_summary %>% 
  filter(census_variable == "immigrants") %>% 
  ggplot()+
  geom_point(aes(x = date, y = value, colour = library))

tidy_summary %>% 
  filter(census_variable == "visible_minorities") %>% 
  ggplot()+
  geom_point(aes(x = date, y = value, colour = library))

tidy_summary %>% 
  filter(census_variable == "unemployed_pct") %>% 
  ggplot()+
  geom_point(aes(x = date, y = value, colour = library))

tidy_summary %>% 
  filter(census_variable == "med_income") %>% 
  ggplot()+
  geom_point(aes(x = date, y = value, colour = library))
