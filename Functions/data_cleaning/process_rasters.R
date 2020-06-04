#' process_rasters
#'
#' function to read in raster data, create a raster stack, and rename files to months of the year 
#'
#' @param folder_path string of name of the folder as "/folder_name"
#'
#' @return raster stack of rasters for one year, renamed to months of the year
#'
#' @examples process_rasters(folder_path = "/solar_2050")
#' 
process_rasters = function(folder_path){
  
  #generate a list of input rasters 
  #pattern = "*.tif$" - filters for main raster files only and skips any associated files (e.g.   world files)
  rasters <- list.files(paste0(path, folder_path) , 
                        pattern = "*.tif$")
  
  #create a raster stack from the input raster files 
  raster_stack <- raster::stack(paste0(paste0(path, paste0(folder_path, "/")), rasters))
  
  # rename bands
  names(raster_stack) <- c("jan", "feb", "mar", "apr", "may", "jun", 
                           "jul", "aug", "sep", "oct", "nov", "dec")
  
  return(raster_stack)
}