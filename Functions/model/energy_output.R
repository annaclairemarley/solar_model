#' energy_output
#'
#' function to calculate projected solar energy output 
#'
#' @param Gtotal Net solar irradiation (W/m^2)
#' @param Tmin minimum temperature (degrees C)
#' @param Tmax maximum temperature (degrees C)
#' @param Tav average temperature (degrees C)
#' @param Tday_length Average length of day (hours)
#' @param B temperature coefficient (x 10^-3 K^-1)
#' @param g irradiance coefficient (x 10^-3 W^-1 m2)
#' @param Tref room temperature is the reference temp (25 C)
#' @param c1 technology parameter
#' @param c2 technology parameter
#' @param c3 technology parameter
#'
energy_output = function(Gtotal, Tmin, Tmax, 
                         Tav, Tday_length,  
                         B, g, Tref = 25, c1 = -3.75, 
                         c2 = 1.14, c3 = 0.0175){
  
  # calculate the average daily temperature range 
  DTR = Tmax - Tmin
  
  # Calculate average daytime temperature
  Tday = Tav + DTR/4
  
  # calculate daytime solar radiation
  Gday = Gtotal*(24/Tday_length)
  
  # calculate temperature of PV cell 
  Tcell = c1 + c2*Tday + c3*Gday
  
  # calculate efficiency of solar cells
  eff = 1 - B*(Tcell - Tref) + g*log10(Gday)
  
  # calculate solar output
  solar_output = Gday*eff*0.2
  
  return(solar_output)
  
}