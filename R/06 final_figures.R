### FINAL FIGURES #############################################################

source("R/01 helper_functions.R")


## FIGURE 1. MAP OF BANQ AREA (WITH NO BUFFERS AT ALL)

tm_shape(st_buffer(filter(libraries_2016, Library_System == 
                            "Bibliotheque et Archives Nationales du Quebec"), 1000),
         ext = 12) +
  tm_dots(col = 'black')+
  tm_shape(filter(CTs_2016, CMA_name == "Montreal")) +
  tm_polygons("housing_need_pct", border.alpha = 0)  + 
  tm_shape(filter(libraries_2016, Library_System == "Bibliotheque et Archives Nationales du Quebec")) +
  tm_dots(col= 'black', size = 1)+
  tm_layout(legend.position = c("left", "top"),
            frame = FALSE) +
  tm_compass()


## FIGURE 2. MAP OF BANQ AREA (WITH BANQ BUFFER DRAWN ON)

tm_shape(st_buffer(filter(libraries_2016, Library_System == 
                            "Bibliotheque et Archives Nationales du Quebec"), 1000),
         ext = 12) +
  tm_dots(col = 'black')+
  tm_shape(filter(CTs_2016, CMA_name == "Montreal")) +
  tm_polygons("housing_need_pct", border.alpha = 0)  + 
  tm_shape(st_buffer(filter(libraries_2016, Library_System == 
                              "Bibliotheque et Archives Nationales du Quebec"), 1000) ) +
  tm_borders(col= 'black')+
  tm_layout(legend.position = c("left", "top"),
            frame = FALSE) +
  tm_compass()


## FIGURE 3. MAP OF MONTREAL WITH ALL LIBRARY BUFFERS (2016)

tm_shape(filter(libraries_2016, Library_System == 
                  "Bibliotheque et Archives Nationales du Quebec"), 
         bb = st_buffer(filter(libraries_2016, Library_System == 
                                 "Bibliotheque et Archives Nationales du Quebec"), 1000),
         ext = 12) +
  tm_dots(col = 'black')+
  tm_shape(filter(CTs_2016, CMA_name == "Montreal")) +
  tm_polygons("housing_need_pct", border.alpha = 0)  + 
  tm_shape(filter(service_areas_2016, CMA_name == "Montreal" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"),
            frame = FALSE) +
  tm_compass()

## FIGURE 3B. MAP OF MONTREAL WITH ALL LIBRARY BUFFERS (2006)
tm_shape(filter(libraries_2006, Library_System == 
                  "Bibliotheque et Archives Nationales du Quebec"), 
         bb = st_buffer(filter(libraries_2016, Library_System == 
                                 "Bibliotheque et Archives Nationales du Quebec"), 1000),
         ext = 12) +
  tm_dots(col = 'black')+
  tm_shape(filter(CTs_2006, CMA_name == "Montreal"))+
  tm_fill("housing_need_pct", border.alpha = 0, breaks = c(0,0.1, 0.2, 0.3, 0.4, 0.5))  + 
  tm_shape(filter(service_areas_2006, CMA_name == "Montreal" & library == TRUE)) +
  tm_borders(col = 'black') + 
  tm_layout(legend.position = c("left", "top"),
            frame = FALSE) +
  tm_compass()

## FIGURE 4. LOLLIPOP GRAPH OF 2016 CORE HOUSING NEED ACROSS ALL REGIONS


## FIGURE 5. 2006/2016 CORE HOUSING NEED COMPARISON ACROSS ALL REGIONS


## FIGURE 6. ALL FIVE VARIABLE 2006/2016 COMPARISONS ACROSS ALL REGIONS


