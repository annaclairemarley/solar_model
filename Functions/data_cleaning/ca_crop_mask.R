#' ca_crop_mask
#'
#' function to reproject, crop and mask all rasters to california
#'
#' @param raster the raster files
#' @param project the projection you want to reproject the raster to
#' @param polygon california_project
#'
#' @examples ca_crop_mask(solar_stack, NAD83, california_project)
#' 
ca_crop_mask = function(raster, project, polygon){
  
  reproject <- projectRaster(raster, crs = project)
  crop <- crop(reproject, polygon)
  mask <- mask(crop, polygon)
  
  return(mask)
}