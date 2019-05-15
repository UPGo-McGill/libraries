## GRAPHING ############

source("R/01 helper_functions.R")
source("R/02 data_import.R")
source("R/03 service_area_comparison.R")


## Lollipop graphs of demographic variables in 2006 and 2016
# Compared to Canadian average 

# 1. Graphing housing need 
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

# 2. Graphing lone parent
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

# 3. Graphing immigration
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
                             "Within Library Service Area"))+
  scale_y_continuous (labels = scales:: percent)


# 4. Graphing visible minorities
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


# 5. Graphing unemployment
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


# 6. Graphing median income
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
                             "Within Library Service Area")) +
  scale_y_continuous(limits = c(NA,100000), labels = scales::dollar)

## Facet Wrap of previous graphs: Demographic variables in 2006 and 2016
# (removes lone parent variable)

library_service_comparison_tidy <-
  gather(library_service_comparison, housing_need, visible_minorities,
         unemployed_pct, med_income, key = "census_variable",
         value = "value") %>% 
   drop_units()

tidy_summary %>% 
   filter(census_variable != "lone_parent") %>% 
ggplot()+
   geom_line(data = library_service_comparison_tidy,
             aes(x = date, y = value, colour = library,
                 group = interaction(library, CMA_name)),
             alpha = 0.2) +
   geom_point(data = library_service_comparison_tidy,
              aes(x = date, y = value, colour = library),
              alpha = 0.2) +
   geom_point(
              aes(x = date, y = value, colour = library), size = 5) +
   geom_line(
             aes(x = date, y = value, colour = library, group = library),
             size = 2) +
   facet_wrap(~census_variable, scales = "free")

