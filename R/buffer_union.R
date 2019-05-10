### BUFFER LIBRARIES ################################################################

source("R/helper_functions.R")
source("R/data_import.R")

## Buffer 1000 m = 1 km

lib_CMA <- st_join(Libraries, CMAs)

lib_buffer <- st_buffer(lib_CMA, 1000)%>%
  st_geometry ()
plot(lib_buffer)

## Sort by CMA?
# Might need to use st_combine, to combine all buffers within a CMA 

## Union overlaping buffers

lib_union <- st_union (lib_buffer)
plot(lib_union)
  

