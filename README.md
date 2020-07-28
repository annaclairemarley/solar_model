# Solar Model

## Table of Contents
* [Usage](#usage)
  * [Solar Energy Generation Submodel](#solar-energy-generation-submodel)
  * [Land Suitability Submodel](#land-suitability-submodel)
  * [Economics Submodel](#economics-submodel)
  * [Final scores](#final-scores)

# Usage

This model creates a projected solar suitability score for each county in California given solar energy generation, land suitability, and economic factors.

<code>data_cleaning.Rmd</code>: Cleans raw data used for model inputs

<code>model.Rmd</code>: Intakes cleaned data created in <code>data_cleaning.Rmd</code> and stored in  <code>generated_files</code> and produces final suitability score

<code>solar_radiation_SA.Rmd</code>: Conducts a sensitivity analysis on the parameters used in the solar energy output submodel

<code>report.pdf</code>: Final writeup of results

<code>Functions/</code>: Folder of functions used in this model. Includes both data cleaning and model functions

<code>Images/</code>: Graphs and maps generated in this model

<code>Scrath_Rmds</code>: Scratch code used to initially create this model. Not necessary to actually run model


## Solar Energy Generation Submodel
Intakes projected minimum, maximum, and average temperature data as well as net solar radiation data from [Cal-Adapt](http://v1.cal-adapt.org/data/download/) to create a raster of projected solar energy in California. 


## Land Suitability Submodel
The land suitability submodel identifies suitable areas for utility-scale solar farms in California using two functions: 
* The <code>suitable_land_CA()</code> function has three inputs, a slope threshold(%), a land cover raster from [USGS](https://www.usgs.gov/centers/wgsc/science/california-land-change-projections?qt-science_center_objects=0#qt-science_center_objects), and a vector of suitable land cover categories. These inputs are used to create a raster of all suitable cells for solar in California.
* The <code>suitable_land_counties()</code> mapping function takes the raster created by the first function and the year analyzed to produce a map showing percentage of suitable area by county. 

## Economics Submodel

## Final Scores
The <code>final_score()</code> function takes scores from each submodel and produces a final solar suitability score by county, as well as a map of these scores. The weights for each submodel score can be changed using the <code>weights</code> optional input. The following figure shows the output of this function using data for the year 2020.

<img src="Images/best_counties_2020.png" width="300px">
