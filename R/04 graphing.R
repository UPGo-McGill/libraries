## GRAPHING ############

source("R/01 helper_functions.R")
source("R/02 data_import.R")
source("R/03 service_area_comparison.R")

## need to multiple percentages by 100##
## fix legends ##



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
                             "Within Library Service Area"))+
  scale_y_continuous (labels = scales:: percent)


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
                             "Within Library Service Area")) +
  scale_y_continuous(limits = c(NA,100000), labels = scales::dollar)

# FACET WRAP

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


## Create variable to study change 2006-2016

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
  inner_join(st_drop_geometry(lib_true_2006), by = c("CMA_lib2", "library", "PR_UID"))

rm(lib_true_2006, lib_true_2016)

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


