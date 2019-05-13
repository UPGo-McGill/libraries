## GRAPHING ############

source("R/01 helper_functions.R")
source("R/02 data_import.R")
source("R/03 service_area_comparison.R")

## need to multiple percentages by 100##
## fix legends ##


## Tidying data

tidy_summary_2006 <- gather(summary_2006_weighted, housing_need, lone_parent, 
                            immigrants, visible_minorities, unemployed_pct, 
                            med_income, key = "census_variable",
                            value = "value") %>% 
  mutate(date = "2006") %>% 
  drop_units()

tidy_summary_2016 <- gather(summary_2016_weighted, housing_need, lone_parent, 
                            immigrants, visible_minorities, unemployed_pct, 
                            med_income, key = "census_variable",
                            value = "value") %>% 
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

Canada_summary <- rbind(
  Canada_2006 %>% mutate(date = "2006") %>% select(-c(1, 4:8)),
  Canada_2016 %>% mutate(date = "2016") %>% select(-c(1, 4:8)))

names(Canada_summary) <-
  c("population", "unemployed_pct", "housing_need", "lone_parent", "immigrants",
    "visible_minorities", "date", "geometry")

# Making summary graphs of each year using weighted means

tidy_summary %>% 
  filter(census_variable == "housing_need") %>% 
  ggplot()+
  geom_line(aes(x = date, y = value, colour = library, group = library))

tidy_summary %>% 
  filter(census_variable == "lone_parent") %>% 
  ggplot()+
  geom_line(aes(x = date, y = value, colour = library, group = library))

tidy_summary %>% 
  filter(census_variable == "immigrants") %>% 
  ggplot()+
  geom_line(aes(x = date, y = value, colour = library, group = library))

tidy_summary %>% 
  filter(census_variable == "visible_minorities") %>% 
  ggplot()+
  geom_line(aes(x = date, y = value, colour = library, group = library))

tidy_summary %>% 
  filter(census_variable == "unemployed_pct") %>% 
  ggplot()+
  geom_line(aes(x = date, y = value, colour = library, group = library))

tidy_summary %>% 
  filter(census_variable == "med_income") %>% 
  ggplot()+
  geom_line(aes(x = date, y = value, colour = library, group = library))


# Mapping housing need
ggplot()+
  geom_line(data = library_service_comparison,
            aes(x = date, y = housing_need, colour = library,
                group = interaction(library, CMA_name)), 
            alpha = 0.2) +
  geom_point(data = library_service_comparison,
             aes(x = date, y = housing_need, colour = library), 
             alpha = 0.2) +
  geom_point(data = filter(tidy_summary, census_variable == "housing_need"),
             aes(x = date, y = value, colour = library), size = 5) + 
  geom_line(data = filter(tidy_summary, census_variable == "housing_need"),
            aes(x = date, y = value, colour = library, group = library),
            size = 2) + 
  geom_point(data = Canada_summary,
             aes(x = date, y = housing_need), 
             size = 5, alpha = 0.5)+
  geom_line(data = Canada_summary,
            aes(x = date, y = housing_need, group = 1),
            size = 2, alpha = 0.5) +
  xlab("Year") +
  ylab("Core Housing Need (%)") +
  labs(colour = '') +
  scale_colour_discrete (labels = 
                           c("Outside Library Service Area", 
                             "Within Library Service Area"))

# Mapping lone parent
ggplot()+
  geom_line(data = library_service_comparison,
            aes(x = date, y = lone_parent, colour = library,
                group = interaction(library, CMA_name)), 
            alpha = 0.2) +
  geom_point(data = library_service_comparison,
             aes(x = date, y = lone_parent, colour = library), 
             alpha = 0.2) +
  geom_point(data = filter(tidy_summary, census_variable == "lone_parent"),
             aes(x = date, y = value, colour = library), size = 5) + 
  geom_line(data = filter(tidy_summary, census_variable == "lone_parent"),
            aes(x = date, y = value, colour = library, group = library),
            size = 2) + 
  geom_point(data = Canada_summary,
             aes(x = date, y = lone_parent), 
             size = 5, alpha = 0.5)+
  geom_line(data = Canada_summary,
            aes(x = date, y = lone_parent, group = 1),
            size = 2, alpha = 0.5) +
  xlab("Year") +
  ylab("Lone Parent Families (%)") +   
  labs(colour = '') +
  scale_colour_discrete (labels = 
                           c("Outside Library Service Area", 
                             "Within Library Service Area"))


# Mapping immigrants
ggplot()+
  geom_line(data = library_service_comparison,
            aes(x = date, y = immigrants, colour = library,
                group = interaction(library, CMA_name)), 
            alpha = 0.2) +
  geom_point(data = library_service_comparison,
             aes(x = date, y = immigrants, colour = library), 
             alpha = 0.2) +
  geom_point(data = filter(tidy_summary, census_variable == "immigrants"),
             aes(x = date, y = value, colour = library), size = 5) + 
  geom_line(data = filter(tidy_summary, census_variable == "immigrants"),
            aes(x = date, y = value, colour = library, group = library),
            size = 2) + 
  geom_point(data = Canada_summary,
             aes(x = date, y = immigrants), 
             size = 5, alpha = 0.5)+
  geom_line(data = Canada_summary,
            aes(x = date, y = immigrants, group = 1),
            size = 2, alpha = 0.5) +
  xlab("Year") +
  ylab("Immigrant Population (%)") +
  labs(colour = '') +
  scale_colour_discrete (labels = 
                           c("Outside Library Service Area", 
                             "Within Library Service Area"))


# Mapping visible minorities
ggplot()+
  geom_line(data = library_service_comparison,
            aes(x = date, y = visible_minorities, colour = library,
                group = interaction(library, CMA_name)), 
            alpha = 0.2) +
  geom_point(data = library_service_comparison,
             aes(x = date, y = visible_minorities, colour = library), 
             alpha = 0.2) +
  geom_point(data = filter(tidy_summary, census_variable == "visible_minorities"),
             aes(x = date, y = value, colour = library), size = 5) + 
  geom_line(data = filter(tidy_summary, census_variable == "visible_minorities"),
            aes(x = date, y = value, colour = library, group = library),
            size = 2) + 
  geom_point(data = Canada_summary,
             aes(x = date, y = visible_minorities), 
             size = 5, alpha = 0.5)+
  geom_line(data = Canada_summary,
            aes(x = date, y = visible_minorities, group = 1),
            size = 2, alpha = 0.5) +
  xlab("Year") +
  ylab("Visible Minority Population (%)") +
  labs(colour = '') +
  scale_colour_discrete (labels = 
                           c("Outside Library Service Area", 
                             "Within Library Service Area"))


# Mapping unemployment
ggplot()+
  geom_line(data = library_service_comparison,
            aes(x = date, y = unemployed_pct, colour = library,
                group = interaction(library, CMA_name)), 
            alpha = 0.2) +
  geom_point(data = library_service_comparison,
             aes(x = date, y = unemployed_pct, colour = library), 
             alpha = 0.2) +
  geom_point(data = filter(tidy_summary, census_variable == "unemployed_pct"),
             aes(x = date, y = value, colour = library), size = 5) + 
  geom_line(data = filter(tidy_summary, census_variable == "unemployed_pct"),
            aes(x = date, y = value, colour = library, group = library),
            size = 2) + 
  geom_point(data = Canada_summary,
             aes(x = date, y = unemployed_pct), 
             size = 5, alpha = 0.5)+
  geom_line(data = Canada_summary,
            aes(x = date, y = unemployed_pct, group = 1),
            size = 2, alpha = 0.5) +
  xlab("Year") +
  ylab("Unemployment Rate (%)") +
  labs(colour = '') +
  scale_colour_discrete (labels = 
                           c("Outside Library Service Area", 
                             "Within Library Service Area"))


# Mapping median income
ggplot()+
  geom_line(data = library_service_comparison,
            aes(x = date, y = med_income, colour = library,
                group = interaction(library, CMA_name)), 
            alpha = 0.2) +
  geom_point(data = library_service_comparison,
             aes(x = date, y = med_income, colour = library), 
             alpha = 0.2) +
  geom_point(data = filter(tidy_summary, census_variable == "med_income"),
             aes(x = date, y = value, colour = library), size = 5) + 
  geom_line(data = filter(tidy_summary, census_variable == "med_income"),
            aes(x = date, y = value, colour = library, group = library),
            size = 2) + 
  geom_point(data = Canada_summary,
             aes(x = date, y = med_income), 
             size = 5, alpha = 0.5)+
  geom_line(data = Canada_summary,
            aes(x = date, y = med_income, group = 1),
            size = 2, alpha = 0.5) +
  xlab("Year") +
  ylab("Median Household Income ($)") +
  labs(colour = '') +
  scale_colour_discrete (labels = 
                           c("Outside Library Service Area", 
                             "Within Library Service Area"))

