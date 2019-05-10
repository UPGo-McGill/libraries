### DATA IMPORT ################################################################

source("R/helper_functions.R")


## Import CMAs

CMAs <-
  get_census(
    dataset = 'CA06', regions = list(C = "Canada"), 
    level = 'CMA',
    geo_format = "sf") %>% 
  st_transform(3347)

## Import CTs

CTs <-
  get_census(
    dataset = "CA06", regions = list(C = "Canada"), 
    level = "CT",
    vectors = c("v_CA06_582", "v_CA06_2060", "v_CA06_2063", "v_CA06_69", 
                "v_CA06_1785", "v_CA06_478", "v_CA06_1303"),
    geo_format = "sf") %>% 
  st_transform(3347)

## Import libraries

Libraries <- suppressWarnings(read_csv("data/Canadian_libraries.csv") %>% 
  st_as_sf(coords = c("Longitude", "Latitude"), crs=4326) %>%
  st_transform(3347))


## Filter tables to relevant ones

# CMAs and CTs that are actually CMAs and CTs
CMAs <- CMAs %>% filter(Type == "CMA")
CTs <- CTs %>% filter(Type == "CT")

#Libraries in CMAs
Libraries <- Libraries[lengths(st_within(Libraries, CMAs)) > 0,]

#CMAs and CTs that contain libraries
CMAs <- CMAs[lengths(st_contains(CMAs, Libraries)) > 0,]
CTs <- CTs[,c(6,7,10,15:22)]

CTs <- CTs %>% 
  left_join(st_drop_geometry(CMAs), by = c("CMA_UID" = "GeoUID" )) #should be an inner join
  
CTs <- CTs %>% 
  select(GeoUID, CMA_UID, CMA_Name = name, Population = Population.x,
         contains("v_C"), geometry)

CTs <- filter(CTs, CMA_Name != "NA")

names(CTs) <- 
  c("Geo_UID", "CMA_UID", "CMA_Name", "Population", "Pct_Unemployed",
   "Ct_Core_Hous_Rent", "Ct_Core_Hous_Own", "Ct_Lone_Parent", "Med_AT_Income",
   "Ct_Imm", "Ct_Vis_Min", "geometry")


CTs <- CTs %>% 
  mutate(Ct_Core_Hous = Ct_Core_Hous_Rent + Ct_Core_Hous_Own) %>% 
  mutate(Pct_Core_Hous = Ct_Core_Hous/Population, 
         Pct_Lone_Parent = Ct_Lone_Parent/Population,
         Pct_Imm = Ct_Imm/Population,
         Pct_Vis_Min = Ct_Vis_Min/Population) %>% 
  select(Geo_UID, CMA_UID, CMA_Name, Population, Pct_Unemployed, Ct_Core_Hous_Rent,
         Ct_Core_Hous_Own, Ct_Core_Hous, Pct_Core_Hous, Ct_Lone_Parent, Pct_Lone_Parent,
         Ct_Imm, Pct_Imm, Ct_Vis_Min, Pct_Vis_Min, geometry)
  

