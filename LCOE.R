#' LCOE
#'
#' @param gen unit area (1 m^2) generation of the PV panel, unit in W/m^2
#' @param size the size of the PV panel, unit in m^2
#' @param year the life-time of the PV panel, a default value of 10 is provided
#' @param total_om the total O&M cost of the technology, unit in $/MWh
#' @param instant_cost the instant cost of the technology, unit in $/kW
#' @param installed_cost the installed cost of the technology, unit in $/kW
#' @param land_cost the unit cost of the land, unit in $/m^2
#'
#' @return LCOE of the project
#'

LCOE = function(gen, size, year = 10, total_om, instant_cost, installed_cost, land_cost){
instant_c = size*gen*instant_cost/1000
installed_c = size*gen*installed_cost/1000
om_c = size*gen*year*365*24*total_om/2000000
land_c = size*land_cost

LCG = size*gen*year*365*24/2000000

LCOE = (instant_c+installed_c+om_c+land_c)/(LCG)

return(LCOE)
}