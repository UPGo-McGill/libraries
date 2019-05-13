### SERVICE AREA COMPARISON ####################################################

source("R/helper_functions.R")

## 2016 and 2006 service area comparisons

library_service_comparison_2016 <- st_intersect_summarize(
  CTs_2016,
  service_areas_2016,
  group_vars = vars(CMA_name, library),
  population = population,
  sum_vars = vars(housing_need, lone_parent, immigrants, visible_minorities),
  mean_vars = vars(unemployed_pct, med_income)
) %>% 
  mutate(unemployed_pct = unemployed_pct * 0.01) %>% 
  drop_units()

library_service_comparison_2006 <- st_intersect_summarize(
  CTs_2006,
  service_areas_2006,
  group_vars = vars(CMA_name, library),
  population = population,
  sum_vars = vars(housing_need, lone_parent, immigrants, visible_minorities),
  mean_vars = vars(unemployed_pct, med_income)
) %>% 
  mutate(unemployed_pct = unemployed_pct * 0.01) %>% 
  drop_units()


## Summaries for the two years

summary_2016_unweighted <- 
  library_service_comparison_2016 %>%
  ungroup() %>%
  st_drop_geometry() %>%
  select(-CMA_name, -population) %>%
  group_by(library)%>%
  summarize_all(mean)

summary_2006_unweighted <- 
  library_service_comparison_2006 %>%
  ungroup() %>% 
  st_drop_geometry()%>%
  select(-CMA_name, -population) %>%
  group_by(library)%>%
  summarize_all(mean)


## Summaries by weighted mean

true_2016 <- filter(library_service_comparison_2016, library == TRUE)
false_2016 <- filter(library_service_comparison_2016, library == FALSE)

summary_2016_weighted <- data.frame(
  "library" = c(TRUE, FALSE), 
  "housing_need" = c(weighted.mean(true_2016$housing_need, true_2016$population),
                     weighted.mean(false_2016$housing_need, false_2016$population)),
  "lone_parent" = c(weighted.mean(true_2016$lone_parent, true_2016$population),
                    weighted.mean(false_2016$lone_parent, false_2016$population)),
  "immigrants"= c(weighted.mean(true_2016$immigrants, true_2016$population),
                  weighted.mean(false_2016$immigrants, false_2016$population)),
  "visible_minorities"= c(weighted.mean(true_2016$visible_minorities, true_2016$population),
                          weighted.mean(false_2016$visible_minorities, false_2016$population)),
  "unemployed_pct"= c(weighted.mean(true_2016$unemployed_pct, true_2016$population),
                      weighted.mean(false_2016$unemployed_pct, false_2016$population)),
  "med_income" = c(weighted.mean(true_2016$med_income, true_2016$population),
                   weighted.mean(false_2016$med_income, false_2016$population))) 

library_service_comparison_2016 %>% 
  group_by(library) %>% 
  summarize_at(c("housing_need", "lone_parent", "immigrants", "visible_minorities",
              "unemployed_pct", "med_income"), ~{weighted.mean(., population)})

true_2006 <- filter(library_service_comparison_2006, library == TRUE)
false_2006 <- filter(library_service_comparison_2006, library == FALSE)

summary_2006_weighted <- data.frame(
  "library" = c(TRUE, FALSE), 
  "housing_need" = c(weighted.mean(true_2006$housing_need, true_2006$population),
                     weighted.mean(false_2006$housing_need, false_2006$population)),
  "lone_parent" = c(weighted.mean(true_2006$lone_parent, true_2006$population),
                    weighted.mean(false_2006$lone_parent, false_2006$population)),
  "immigrants"= c(weighted.mean(true_2006$immigrants, true_2006$population),
                  weighted.mean(false_2006$immigrants, false_2006$population)),
  "visible_minorities"= c(weighted.mean(true_2006$visible_minorities, true_2006$population),
                          weighted.mean(false_2006$visible_minorities, false_2006$population)),
  "unemployed_pct"= c(weighted.mean(true_2006$unemployed_pct, true_2006$population),
                      weighted.mean(false_2006$unemployed_pct, false_2006$population)),
  "med_income" = c(weighted.mean(true_2006$med_income, true_2006$population), 
                   weighted.mean(false_2006$med_income, false_2006$population)))

rm(true_2016, false_2016, true_2006, false_2006)



