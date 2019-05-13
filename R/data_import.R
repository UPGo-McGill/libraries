### DATA IMPORT ################################################################

source("R/helper_functions.R")


## Import 2016 CMAs and CTs

CMAs_2016 <-
  get_census(
    dataset = 'CA16', regions = list(C = "Canada"), level = 'CMA',
    geo_format = "sf") %>% 
  st_transform(3347)

CMAs_2006 <-
  get_census(
    dataset = 'CA06', regions = list(C = "Canada"), level = 'CMA',
    geo_format = "sf") %>% 
  st_transform(3347)

CTs_2016 <-
  get_census(
    dataset = "CA16", regions = list(C = "Canada"), level = "CT",
    vectors = c("v_CA16_5618", "v_CA16_4888", "v_CA16_488", "v_CA16_2398",
                "v_CA16_3411", "v_CA16_3957"),
    geo_format = "sf") %>% 
  st_transform(3347)

CTs_2006 <-
  get_census(
    dataset = "CA06", regions = list(C = "Canada"), level = "CT",
    vectors = c("v_CA06_582", "v_CA06_2060", "v_CA06_2063", "v_CA06_69", 
                "v_CA06_1785", "v_CA06_478", "v_CA06_1303"),
    geo_format = "sf") %>% 
  st_transform(3347)

Canada_2016 <- 
  get_census(
    dataset = "CA16", regions = list(C = "Canada"), level = "C",
    vectors = c("v_CA16_5618", "v_CA16_4888", "v_CA16_488", "v_CA16_2398",
                "v_CA16_3411", "v_CA16_3957"), 
    geo_format = "sf") %>% 
  st_transform(3347)

Canada_2006 <- 
  get_census(
    dataset = "CA06", regions = list(C = "Canada"), level = "C",
    vectors = c("v_CA06_582", "v_CA06_2060", "v_CA06_2063", "v_CA06_69", 
                "v_CA06_1785", "v_CA06_478", "v_CA06_1303"),
    geo_format = "sf") %>% 
  st_transform(3347)


## Filter CMA, CT, and Canada-wide tables

CMAs_2016 <- CMAs_2016 %>% filter(Type == "CMA") %>%
  select(GeoUID, CMA_name = name)
CMAs_2006 <- CMAs_2006 %>% filter(Type == "CMA") %>%
  select(GeoUID, CMA_name = name)
CTs_2016 <- CTs_2016 %>% filter(Type == "CT") %>% 
  select(GeoUID, CMA_UID, Population, contains("v_CA"))
CTs_2006 <- CTs_2006 %>% filter(Type == "CT") %>% 
  select(GeoUID, CMA_UID, Population, contains("v_CA"))
Canada_2016 <- Canada_2016 %>% select(GeoUID, Population, contains("v_CA"))
Canada_2006 <- Canada_2006 %>% select(GeoUID, Population, contains("v_CA"))

## Import libraries

libraries <- suppressWarnings(
  read_csv("data/Canadian_libraries.csv") %>% 
    st_as_sf(coords = c("Longitude", "Latitude"), crs=4326) %>%
    st_transform(3347)
  )

#Libraries in CMAs
libraries_2016 <- libraries[lengths(st_within(libraries, CMAs_2016)) > 0,]
libraries_2006 <- libraries[lengths(st_within(libraries, CMAs_2006)) > 0,]

#CMAs and CTs that contain libraries
CMAs_2016 <- CMAs_2016[lengths(st_contains(CMAs_2016, libraries_2016)) > 0,]
CMAs_2006 <- CMAs_2006[lengths(st_contains(CMAs_2006, libraries_2006)) > 0,]


## Add CMA names to the CTs table, rename, and add pct variables

CTs_2016 <- CTs_2016 %>% 
  inner_join(st_drop_geometry(CMAs_2016), by = c("CMA_UID" = "GeoUID")) %>% 
  select(GeoUID, CMA_UID, CMA_name, everything())

CTs_2006 <- CTs_2006 %>% 
  inner_join(st_drop_geometry(CMAs_2006), by = c("CMA_UID" = "GeoUID")) %>% 
  select(GeoUID, CMA_UID, CMA_name, everything())

names(CTs_2016) <- 
  c("Geo_UID", "CMA_UID", "CMA_name", "population", "unemployed_pct",
   "housing_need", "lone_parent", "med_income", "immigrants",
   "visible_minorities", "geometry")

names(CTs_2006) <- 
  c("Geo_UID", "CMA_UID", "CMA_name", "population", "unemployed_pct",
    "housing_need_rent", "housing_need_own", "lone_parent", "med_income",
    "immigrants", "visible_minorities", "geometry")

names(Canada_2016) <- 
  c("Geo_UID", "population", "unemployment_pct",
    "housing_need", "lone_parent", "med_income", "immigrants",
    "visible_minorities", "geometry")

names(Canada_2006) <- 
  c("Geo_UID", "population", "unemployed_pct",
    "housing_need_rent", "housing_need_own", "lone_parent", "med_income",
    "immigrants", "visible_minorities", "geometry")

CTs_2016 <- CTs_2016 %>% 
  mutate_at(
    .vars = c("housing_need", "lone_parent", "immigrants", "visible_minorities"),
    .funs = list(`pct` = ~{. / population}))
            
CTs_2006 <- CTs_2006 %>% 
  mutate(housing_need = housing_need_rent + housing_need_own) %>% 
  select(Geo_UID, CMA_UID, CMA_name, population, unemployed_pct, housing_need,
         lone_parent, med_income, immigrants, visible_minorities, geometry) %>% 
  mutate_at(
    c("housing_need", "lone_parent", "immigrants", "visible_minorities"),
    list(`pct` = ~{. / population}))

Canada_2016 <- Canada_2016 %>% 
  mutate_at(
    .vars = c("housing_need", "lone_parent", "immigrants", "visible_minorities"),
    .funs = list(`pct` = ~{. / population}))

Canada_2006 <- Canada_2006 %>% 
  mutate(housing_need = housing_need_rent + housing_need_own) %>% 
  select(Geo_UID, population, unemployed_pct, housing_need,
         lone_parent, med_income, immigrants, visible_minorities, geometry) %>% 
  mutate_at(
    c("housing_need", "lone_parent", "immigrants", "visible_minorities"),
    list(`pct` = ~{. / population}))


## Remove Montreal Accent

CMAs_2006 <- CMAs_2006 %>%
  ungroup()%>%
  mutate(CMA_name=ifelse(str_detect(CMA_name, 'Mont'),"Montreal",CMA_name))

CMAs_2016 <- CMAs_2016 %>%
  ungroup()%>%
  mutate(CMA_name=ifelse(str_detect(CMA_name, 'Mont'),"Montreal",CMA_name))

CTs_2006 <- CTs_2006 %>%
  ungroup()%>%
  mutate(CMA_name=ifelse(str_detect(CMA_name, 'Mont'),"Montreal",CMA_name))

CTs_2016 <- CTs_2016 %>%
  ungroup()%>%
  mutate(CMA_name=ifelse(str_detect(CMA_name, 'Mont'),"Montreal",CMA_name))

## Produce library service areas

service_areas_2016 <- make_library_service_areas(libraries_2016, CMAs_2016)
service_areas_2006 <- make_library_service_areas(libraries_2006, CMAs_2006)

