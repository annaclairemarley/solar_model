#' Land suitability
#' 
#' Identifies suitable land for utility-scale solar energy generation in CA
#'
#' @param land_cover_raster USGS land cover projection for year of interest
#' @param slope_threshold maximum slope (%) considered suitable, deafult value is 5%
#' @param land_cover_suitable_values vector of suitable land values, default is c(5, 7, 10)
#'
#' @return suitable land raster 


suitable_land <- function (land_cover_raster,
                             slope_threshold = 5,
                             land_cover_suitable_values = c(5, 7, 10) ) {
  
  ### Slope ###
  # Read slope file
  slope_CA <- raster("generated_files/slope_CA.tif")
  
  # Read CA file
  CA_proj <- read_sf(dsn = "generated_files/",
                     layer = "counties_proj")
  
  # Reclassify matrix ( 0s into 1s and viceversa)
  rcl_mat_slope <- c(-Inf, slope_threshold, 1,
                     slope_threshold, Inf, 0)
  
  # Reclassify
  slope_binary <- reclassify(slope_CA, rcl = rcl_mat_slope, progress = 'text')
  
  
  ### Land cover ###
  # Select pixels with those values
  suitable_lc <- land_cover_raster %in% land_cover_suitable_values
  
  # Mask
  suitable_lc_binary <- mask(suitable_lc, CA_proj)
  
  
  ### Suitability ###
  # Overlay layers
  suitable <- overlay(slope_binary,
                      suitable_lc_binary,
                      fun = function (a,b) {a*b},
                      progress = 'text')
  # Plot
  plot(suitable)
  
  # Return raster
  return(suitable)
}








